unit AssembleViewFrame;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, cxGraphics, cxControls,
  cxLookAndFeels, cxLookAndFeelPainters, cxStyles, cxCustomData, cxFilter,
  cxData, cxDataStorage, cxEdit, cxNavigator,
  cxDataControllerConditionalFormattingRulesManagerDialog, Data.DB, cxDBData,
  cxGridLevel, cxClasses, cxGridCustomView, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxGrid, Vcl.ExtCtrls, MainViewForm,
  Vcl.StdCtrls, Vcl.ComCtrls;

type
  TAssembleView = class(TFrame)
    PnlTop: TPanel;
    View: TcxGridDBTableView;
    Level: TcxGridLevel;
    Grid: TcxGrid;
    ViewColumn1: TcxGridDBColumn;
    ViewColumn2: TcxGridDBColumn;
    ViewColumn3: TcxGridDBColumn;
    ViewColumn4: TcxGridDBColumn;
    Memo: TLabeledEdit;
    Product: TComboBox;
    Label1: TLabel;
    Quantity: TLabeledEdit;
    DateTimePicker1: TDateTimePicker;
    Label2: TLabel;
  private
    FMain: TMainView;
    { Private declarations }
  public
    constructor Create(AOwner: TComponent; AMain: TMainView);
    { Public declarations }
  end;

implementation

{$R *.dfm}

{ TAssembleView }

constructor TAssembleView.Create(AOwner: TComponent; AMain: TMainView);
begin
  inherited Create(AOwner);
  Self.Parent := AOwner as TWinControl;
  FMain := AMain;
end;

end.
