unit ProductsViewFrame;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Interfaces, cxGraphics,
  cxControls, cxLookAndFeels, cxLookAndFeelPainters, cxStyles, cxCustomData,
  cxFilter, cxData, cxDataStorage, cxEdit, cxNavigator,
  cxDataControllerConditionalFormattingRulesManagerDialog, Data.DB, cxDBData,
  cxGridLevel, cxClasses, cxGridCustomView, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxGrid, Vcl.ExtCtrls;

type
  TProductsView = class(TFrame, IProductsView)
    Panel1: TPanel;
    cxGrid1DBTableView1: TcxGridDBTableView;
    cxGrid1Level1: TcxGridLevel;
    cxGrid1: TcxGrid;
  private
    FPresenter: IProductsPresenter;
    FMain: IMainView;
    { Private declarations }
  public
    procedure SetPresenter(APresenter: IProductsPresenter);
    procedure SetMainAndPanel(AMain: IMainView; APanel: IPanelFrame);
  end;

implementation

{$R *.dfm}

{ TFrame1 }

procedure TProductsView.SetMainAndPanel(AMain: IMainView; APanel: IPanelFrame);
begin
  FMain := AMain;
  Self.Parent := TWinControl(APanel);
end;

procedure TProductsView.SetPresenter(APresenter: IProductsPresenter);
begin
  FPresenter := APresenter;
end;

end.
