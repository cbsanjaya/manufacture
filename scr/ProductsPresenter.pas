unit ProductsPresenter;

interface

uses
  Interfaces;

type
  TProductsPresenter = class(TInterfacedObject, IProductsPresenter)
  private
    FView: IProductsView;
  public
    constructor Create(AView: IProductsView);
    procedure Start;
  end;

implementation

{ TProductsPresenter }

constructor TProductsPresenter.Create(AView: IProductsView);
begin
  FView := AView;
  AView.SetPresenter(Self);
end;

procedure TProductsPresenter.Start;
begin

end;

end.
