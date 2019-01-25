program Manufacture;

uses
  Vcl.Forms,
  MainViewForm in 'MainViewForm.pas' {MainView};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TMainView, MainView);
  Application.Run;
end.
