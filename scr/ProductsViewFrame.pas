unit ProductsViewFrame;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, cxGraphics,
  cxControls, cxLookAndFeels, cxLookAndFeelPainters, cxStyles, cxCustomData,
  cxFilter, cxData, cxDataStorage, cxEdit, cxNavigator,
  cxDataControllerConditionalFormattingRulesManagerDialog, Data.DB, cxDBData,
  cxGridLevel, cxClasses, cxGridCustomView, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxGrid, Vcl.ExtCtrls, Vcl.Buttons,
  Vcl.Menus, Vcl.StdCtrls, cxButtons, System.Generics.Collections, MemDS,
  DBAccess, MyAccess, MainViewForm, cxCurrencyEdit;

type
  TProductsView = class(TFrame)
    Panel1: TPanel;
    View: TcxGridDBTableView;
    Level: TcxGridLevel;
    Grid: TcxGrid;
    Button1: TButton;
    ProductsDataSource: TDataSource;
    Button2: TButton;
    QProducts: TMyQuery;
    Viewid: TcxGridDBColumn;
    Viewdescription: TcxGridDBColumn;
    Viewunit: TcxGridDBColumn;
    Viewcost_price: TcxGridDBColumn;
    Viewprice: TcxGridDBColumn;
    Viewto_buy: TcxGridDBColumn;
    Viewto_sell: TcxGridDBColumn;
    Viewis_raw: TcxGridDBColumn;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  private
    FMain: TMainView;
    { Private declarations }
  public
    constructor Create(AOwner: TComponent; AMain: TMainView);
  end;

implementation

{$R *.dfm}

{ TFrame1 }

procedure TProductsView.Button1Click(Sender: TObject);
begin
  FMain.CloseTab(Self.Parent);
end;

procedure TProductsView.Button2Click(Sender: TObject);
begin
//
end;

constructor TProductsView.Create(AOwner: TComponent; AMain: TMainView);
begin
  inherited Create(AOwner);
  Self.Parent := AOwner as TWinControl;
  FMain := AMain;
end;

end.
