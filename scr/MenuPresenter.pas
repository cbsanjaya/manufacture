unit MenuPresenter;

interface

uses
  Interfaces;

type
  TMenuPresenter = class(TInterfacedObject, IMenuPresenter)
  private
    FView: IMenuView;
  public
    constructor Create(AView: IMenuView);
    procedure Start;
  end;

implementation

{ TMenuPresenter }

constructor TMenuPresenter.Create(AView: IMenuView);
begin
  FView := AView;
  AView.SetPresenter(Self);
end;

procedure TMenuPresenter.Start;
begin
  //
end;

end.
