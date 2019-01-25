program Manufacture;

uses
  Vcl.Forms,
  DSharp.PresentationModel.VCLApplication,
  Interfaces in 'Interfaces.pas',
  Aurelius.Drivers.MyDac in 'Aurelius.Drivers.MyDac.pas',
  DataConnection in 'DataConnection.pas' {MyDacConnection: TDataModule},
  MainViewForm in 'MainViewForm.pas' {MainView},
  MainViewModel in 'MainViewModel.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.Start<IMainViewModel>;
  ReportMemoryLeaksOnShutdown := True;
end.
