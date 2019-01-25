program Manufacture;

uses
  Vcl.Forms,
  MainViewForm in 'MainViewForm.pas' {MainView},
  Interfaces in 'Interfaces.pas',
  MainViewModel in 'MainViewModel.pas',
  DSharp.PresentationModel.VCLApplication;

{$R *.res}

begin
  Application.Initialize;
  Application.Start<IMainViewModel>;
  ReportMemoryLeaksOnShutdown := True;
end.
