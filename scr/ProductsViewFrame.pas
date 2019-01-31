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
  TProductsView = class(TFrame)
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
    { Private declarations }
  public
    procedure SetPresenter(APresenter: IProductsPresenter);
    procedure SetMainAndPanel(AMain: IMainView; APanel: IPanelFrame);
    procedure ShowData(AProducts: TList<TProducts>);
  end;

implementation

{$R *.dfm}

{ TFrame1 }

procedure TProductsView.Button1Click(Sender: TObject);
begin
  FMain.CloseTab(Self.Parent as IPanelFrame);
end;

procedure TProductsView.Button2Click(Sender: TObject);
begin
  FPresenter.LoadData;
end;

procedure TProductsView.SetMainAndPanel(AMain: IMainView; APanel: IPanelFrame);
begin
  FMain := AMain;
  Self.Parent := TWinControl(APanel);
  Self.Name := 'ProductsView' + IntToStr(Self.Parent.Tag);
end;

procedure TProductsView.SetPresenter(APresenter: IProductsPresenter);
begin
  FPresenter := APresenter;
end;

procedure TProductsView.ShowData(AProducts: TList<TProducts>);
begin
  ProductsDataSet.SetSourceList(AProducts);
  ProductsDataSet.Open;

  View.DataController.CreateAllItems();
end;

end.
