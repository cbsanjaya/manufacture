unit MenuViewFrame;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Buttons, Interfaces;

type
  TMenuView = class(TFrame, IMenuView)
    SpeedButton1: TSpeedButton;
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

end.
