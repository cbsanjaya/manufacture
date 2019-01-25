unit DataConnection;

interface

uses
  Aurelius.Drivers.Interfaces,
  Aurelius.SQL.MySql,
  Aurelius.Schema.MySql,
  Aurelius.Drivers.MyDac,
  System.SysUtils,
  System.Classes, Data.DB, DBAccess, MyAccess;

type
  TMyDacConnection = class(TDataModule)
    Connection: TMyConnection;
  private
  public
    class function CreateConnection: IDBConnection;
    class function CreateFactory: IDBConnectionFactory;
  end;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

uses 
  Aurelius.Drivers.Base;

{$R *.dfm}

{ TMyConnectionModule }

class function TMyDacConnection.CreateConnection: IDBConnection;
var 
  DataModule: TMyDacConnection;
begin
  DataModule := TMyDacConnection.Create(nil);
  Result := TMyDacConnectionAdapter.Create(DataModule.Connection, 'MySql', DataModule);
end;

class function TMyDacConnection.CreateFactory: IDBConnectionFactory;
begin
  Result := TDBConnectionFactory.Create(
    function: IDBConnection
    begin
      Result := CreateConnection;
    end
  );
end;



end.
