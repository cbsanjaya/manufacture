unit MenuViewFrame;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Buttons, MainViewForm;

type
  TMenuView = class(TFrame)
    SpeedButton1: TSpeedButton;
    procedure SpeedButton1Click(Sender: TObject);
  private
    FMain: TMainView;
    { Private declarations }
  public
    property Main: TMainView read FMain write FMain;
  end;

implementation

{$R *.dfm}

uses ProductsViewFrame;

{ TMenuView }

procedure TMenuView.SpeedButton1Click(Sender: TObject);
var
  LFrame : TProductsView;
begin
  FMain.OpenFrame('Daftar Barang',
    procedure (AOwner: TWinControl)
    begin
      LFrame := TProductsView.Create(AOwner, FMain);
    end
  );
end;

end.
