unit Aurelius.Drivers.MyDac;

{$I Aurelius.inc}

interface

uses
  Classes, DB, Variants, Generics.Collections,
  DBAccess,
  Aurelius.Drivers.Base,
  Aurelius.Drivers.Interfaces;

type
  TMyDacResultSetAdapter = class(TDriverResultSetAdapter<TCustomDADataset>)
  end;

  TMyDacStatementAdapter = class(TInterfacedObject, IDBStatement, IDBDatasetStatement)
  private
    FQuery: TCustomDADataset;
    function GetDataset: TDataset;
  public
    constructor Create(AQuery: TCustomDADataset);
    destructor Destroy; override;
    procedure SetSQLCommand(SQLCommand: string);
    procedure SetParams(Params: TEnumerable<TDBParam>);
    function Execute: Integer;
    function ExecuteQuery: IDBResultSet;
  end;

  TMyDacConnectionAdapter = class(TDriverConnectionAdapter<TCustomDAConnection>, IDBConnection)
  public
    procedure Connect;
    procedure Disconnect;
    function IsConnected: Boolean;
    function CreateStatement: IDBStatement;
    function BeginTransaction: IDBTransaction;
    function RetrieveSqlDialect: string; override;
  end;

  TMyDacTransactionAdapter = class(TInterfacedObject, IDBTransaction)
  private
    FConnection: TCustomDAConnection;
  public
    constructor Create(AConnection: TCustomDAConnection);
    procedure Commit;
    procedure Rollback;
  end;

implementation

{ TMyDacStatementAdapter }

uses
  SysUtils,
  Bcl.Utils,
  Aurelius.Drivers.Exceptions,
  Aurelius.Global.Utils;

constructor TMyDacStatementAdapter.Create(AQuery: TCustomDADataset);
begin
  FQuery := AQuery;
end;

destructor TMyDacStatementAdapter.Destroy;
begin
  FreeObj(FQuery);
  inherited;
end;

function TMyDacStatementAdapter.Execute: Integer;
begin
  FQuery.ExecSQL;
  Result := FQuery.RowsAffected;
end;

function TMyDacStatementAdapter.ExecuteQuery: IDBResultSet;
var
  ResultSet: TCustomDADataset;
  I: Integer;
begin
  ResultSet := FQuery.Connection.CreateDataSet;
  try
    ResultSet.Connection := FQuery.Connection;
    ResultSet.SQL := FQuery.SQL;
    for I := 0 to FQuery.Params.Count - 1 do
      ResultSet.Params[I].Assign(FQuery.Params[I]);
    ResultSet.Execute;
  except
    FreeObj(ResultSet);
    raise;
  end;
  Result := TMyDacResultSetAdapter.Create(ResultSet);
end;

function TMyDacStatementAdapter.GetDataset: TDataset;
begin
  Result := FQuery;
end;

procedure TMyDacStatementAdapter.SetParams(Params: TEnumerable<TDBParam>);
var
  P: TDBParam;
  Parameter: TDAParam;
  Bytes: TBytes;
  I: Integer;
begin
  I := 0;
  for P in Params do
  begin
    if (P.ParamName = '') and (I < FQuery.Params.Count) then
      Parameter := FQuery.Params[I]
    else
      Parameter := FQuery.FindParam(P.ParamName);
    Inc(I);

    if not Assigned(Parameter) then
      Continue;
    Parameter.DataType := P.ParamType;
    Parameter.ParamType := ptInput;

    if P.ParamType in [ftOraBlob, ftOraClob, ftBlob] then
    begin
      Bytes := TUtils.VariantToBytes(P.ParamValue);
      if VarIsNull(P.ParamValue) or (Length(Bytes) = 0) then
        Parameter.Clear
      else
      begin
        Parameter.DataType := P.ParamType;
        Parameter.AsBlob := Bytes;
      end;
    end
    else
    if P.ParamType in [ftMemo, ftWideMemo] then
    begin
      if VarIsNull(P.ParamValue) or (Length(VarToStr(P.ParamValue)) = 0) then
        Parameter.AsMemo := ''
      else
      begin
        Parameter.AsMemo := P.ParamValue;
      end;
    end
    else
      Parameter.Value := P.ParamValue;
  end;
end;

procedure TMyDacStatementAdapter.SetSQLCommand(SQLCommand: string);
begin
  FQuery.SQL.Text := SQLCommand;
end;

{ TMyDacConnectionAdapter }

procedure TMyDacConnectionAdapter.Disconnect;
begin
  if Connection <> nil then
    Connection.Connected := False;
end;

function TMyDacConnectionAdapter.RetrieveSqlDialect: string;
begin
  if Connection = nil then
    Exit('');

  Result := 'MySQL'
end;

function TMyDacConnectionAdapter.IsConnected: Boolean;
begin
  if Connection <> nil then
    Result := Connection.Connected
  else
    Result := false;
end;

function TMyDacConnectionAdapter.CreateStatement: IDBStatement;
var
  Statement: TCustomDADataset;
begin
  if Connection = nil then
    Exit(nil);

  Statement := Connection.CreateDataSet;
  try
    Statement.Connection := Connection;
  except
    FreeObj(Statement);
    raise;
  end;
  Result := TMyDacStatementAdapter.Create(Statement);
end;

procedure TMyDacConnectionAdapter.Connect;
begin
  if Connection <> nil then
    Connection.Connected := True;
end;

function TMyDacConnectionAdapter.BeginTransaction: IDBTransaction;
begin
  if Connection = nil then
    Exit(nil);

  Connection.Connected := true;

  if not Connection.InTransaction then
  begin
    Connection.StartTransaction;
    Result := TMyDacTransactionAdapter.Create(Connection);
  end else
    Result := TMyDacTransactionAdapter.Create(nil);
end;

{ TMyDacTransactionAdapter }

procedure TMyDacTransactionAdapter.Commit;
begin
  if (FConnection = nil) then
    Exit;

  FConnection.Commit;
end;

constructor TMyDacTransactionAdapter.Create(AConnection: TCustomDAConnection);
begin
  FConnection := AConnection;
end;

procedure TMyDacTransactionAdapter.Rollback;
begin
  if (FConnection = nil) then
    Exit;

  FConnection.Rollback;
end;

end.

