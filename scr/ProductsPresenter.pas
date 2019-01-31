unit ProductsPresenter;

interface

uses
  Interfaces, Aurelius.Engine.ObjectManager, DataModels,
  Aurelius.Drivers.Interfaces;

type
  TProductsPresenter = class(TInterfacedObject, IProductsPresenter)
  private
    FView: IProductsView;
    FManager: TObjectManager;
  public
    constructor Create(AView: IProductsView; AConnection:IDBConnection);
    destructor Destroy;
    procedure Start;
    procedure LoadData;
  end;

implementation

{ TProductsPresenter }

constructor TProductsPresenter.Create(AView: IProductsView; AConnection:IDBConnection);
begin
  FView := AView;
  AView.SetPresenter(Self);
  FManager := TObjectManager.Create(AConnection);
end;

destructor TProductsPresenter.Destroy;
begin
  FManager.Free;
end;

procedure TProductsPresenter.LoadData;
begin
  FView.ShowData(FManager.Find<TProducts>.List);
end;

procedure TProductsPresenter.Start;
begin
//  FObjectManager
end;

end.
