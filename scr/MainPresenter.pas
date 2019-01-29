unit MainPresenter;

interface

uses
  Interfaces;

type
  TMainPresenter = class(TInterfacedObject, IMainPresenter)
  private
    FView: IMainView;
  public
    constructor Create(AView: IMainView);
    procedure Start;
  end;

implementation

{ TMainPresenter }

constructor TMainPresenter.Create(AView: IMainView);
begin
  FView := AView;
  AView.SetPresenter(Self);
end;

procedure TMainPresenter.Start;
begin
  FView.CreateMenuPage;
end;

end.
