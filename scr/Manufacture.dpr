program Manufacture;

uses
  Vcl.Forms,
  Interfaces in 'Interfaces.pas',
  Spring.Container,
  Aurelius.Drivers.MyDac in 'Aurelius.Drivers.MyDac.pas',
  DataConnection in 'DataConnection.pas' {MyDacConnection: TDataModule},
  MainViewForm in 'MainViewForm.pas' {MainView},
  MainPresenter in 'MainPresenter.pas',
  MenuViewFrame in 'MenuViewFrame.pas' {MenuView: TFrame},
  MenuPresenter in 'MenuPresenter.pas',
  Registrations in 'Registrations.pas',
  ProductsViewFrame in 'ProductsViewFrame.pas' {ProductsView: TFrame},
  ProductsPresenter in 'ProductsPresenter.pas';

{$R *.res}

begin
  RegisterTypes;
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  GlobalContainer.Resolve<IMainView>;
  Application.Run;

  ReportMemoryLeaksOnShutdown := True;
end.
