unit MenuViewFrame;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Buttons, MainViewForm;

type
  TMenuView = class(TFrame)
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
  private
    FMain: TMainView;
    { Private declarations }
  public
    constructor Create(AOwner: TComponent; AMain: TMainView);
  end;

implementation

{$R *.dfm}

uses ProductsViewFrame, AssembleViewFrame;

{ TMenuView }

constructor TMenuView.Create(AOwner: TComponent; AMain: TMainView);
begin
  inherited Create(AOwner);

  Self.Parent := AOwner as TWinControl;
  FMain := AMain;
end;

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

procedure TMenuView.SpeedButton2Click(Sender: TObject);
var
  LFrame : TAssembleView;
begin
  FMain.OpenFrame('Rakit Produk',
    procedure (AOwner: TWinControl)
    begin
      LFrame := TAssembleView.Create(AOwner, FMain);
    end
  );
end;

end.
