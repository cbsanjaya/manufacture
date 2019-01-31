unit MenuViewFrame;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Buttons, Interfaces, Spring.Container;

type
  TMenuView = class(TFrame)
    SpeedButton1: TSpeedButton;
    procedure SpeedButton1Click(Sender: TObject);
  private
    FMain: IMainView;
    { Private declarations }
  public
    property Main: IMainView read FMain write FMain;
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
      LFrame := TProductsView.Create(Self);
      LFrame.Main := FMain;
      LFrame.Parent:= AOwner;
    end
  );
end;

end.
