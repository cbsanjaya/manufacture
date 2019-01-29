unit MenuViewFrame;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Buttons, Interfaces, Spring.Container;

type
  TMenuView = class(TFrame, IMenuView)
    SpeedButton1: TSpeedButton;
    procedure SpeedButton1Click(Sender: TObject);
  private
    FPresenter: IMenuPresenter;
    FMain: IMainView;
    { Private declarations }
  public
    procedure SetPresenter(APresenter: IMenuPresenter);
    procedure SetMainAndPanel(AMain: IMainView; APanel: IPanelFrame);
  end;

implementation

{$R *.dfm}

{ TMenuView }

procedure TMenuView.SetMainAndPanel(AMain: IMainView; APanel: IPanelFrame);
begin
  FMain := AMain;
  Self.Parent := TWinControl(APanel);
end;

procedure TMenuView.SetPresenter(APresenter: IMenuPresenter);
begin
  FPresenter := APresenter;
end;

procedure TMenuView.SpeedButton1Click(Sender: TObject);
var
  LFrame : IProductsView;
begin
  FMain.OpenFrame('Daftar Barang',
    procedure (AOwner: IPanelFrame)
    begin
      LFrame := GlobalContainer.Resolve<IProductsView>;
      LFrame.SetMainAndPanel(Self.FMain, AOwner);
    end

  );
end;

end.
