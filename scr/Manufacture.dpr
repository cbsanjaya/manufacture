program Manufacture;

uses
  Vcl.Forms,
  MainViewForm in 'MainViewForm.pas' {MainView},
  MenuViewFrame in 'MenuViewFrame.pas' {MenuView: TFrame},
  ProductsViewFrame in 'ProductsViewFrame.pas' {ProductsView: TFrame};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TMainView, MainView);
  Application.Run;

  ReportMemoryLeaksOnShutdown := True;
end.
