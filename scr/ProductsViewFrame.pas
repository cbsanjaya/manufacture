unit ProductsViewFrame;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Interfaces, cxGraphics,
  cxControls, cxLookAndFeels, cxLookAndFeelPainters, cxStyles, cxCustomData,
  cxFilter, cxData, cxDataStorage, cxEdit, cxNavigator,
  cxDataControllerConditionalFormattingRulesManagerDialog, Data.DB, cxDBData,
  cxGridLevel, cxClasses, cxGridCustomView, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxGrid, Vcl.ExtCtrls, Vcl.Buttons,
  Vcl.Menus, Vcl.StdCtrls, cxButtons, System.Generics.Collections;

type
  TProductsView = class(TFrame, IProductsView)
    Panel1: TPanel;
    View: TcxGridDBTableView;
    Level: TcxGridLevel;
    Grid: TcxGrid;
    Button1: TButton;
    ProductsDataSource: TDataSource;
    Button2: TButton;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  private
    FMain: IMainView;
    { Private declarations }
  public
    property Main: IMainView read FMain write FMain;
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

end.
