unit Registrations;

interface

uses
  Spring.Container;

procedure RegisterTypes;

implementation

uses
  Forms,
  Interfaces,
  MainPresenter,
  MainViewForm,
  MenuPresenter,
  MenuViewFrame,
  ProductsPresenter,
  ProductsViewFrame;

procedure RegisterTypes;
var
  container: TContainer;
begin
  container := GlobalContainer;

  container.RegisterType<IMainView, TMainView>.DelegateTo(
    function: TMainView
    begin
      Application.CreateForm(TMainView, Result);
      TMainPresenter.Create(Result);
    end);

  container.RegisterType<IMenuView, TMenuView>.DelegateTo(
    function: TMenuView
    begin
      Result := TMenuView.Create(Application);
      TMenuPresenter.Create(Result);
    end);

  container.RegisterType<IProductsView, TProductsView>.DelegateTo(
    function: TProductsView
    begin
      Result := TProductsView.Create(Application);
      TProductsPresenter.Create(Result);
    end);

  container.Build;
end;

end.
