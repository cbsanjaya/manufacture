unit ChromeTabsControl;

interface
uses
  System.Classes,
  DSharp.Bindings.Collections,
  DSharp.Bindings.CollectionView,
  DSharp.Bindings.CollectionView.Adapters,
  DSharp.Bindings.Notifications,
  Spring,
  ChromeTabs,
  ChromeTabsClasses;

type
  TCollectionViewTabsAdapter = class(TCollectionViewAdapter)
  private
    FTabs: TChromeTabsList;
  protected
    function AddDisplayItem: NativeInt; override;
    procedure ClearDisplayItems; override;
    function FindDisplayItem(AItem: TObject): NativeInt; override;
    function GetDisplayItemsCount: NativeInt; override;
    procedure RemoveDisplayItem(AIndex: NativeInt); override;
    procedure UpdateDisplayItem(AIndex: NativeInt; AItem: TObject); override;
  public
    constructor Create(AOwner: TPersistent; ATabs: TChromeTabsList);
    destructor Destroy; override;
  end;

  TChromeTabs = class(ChromeTabs.TChromeTabs, INotifyPropertyChanged, ICollectionView)
  private
    FNotifyPropertyChanged: TNotifyPropertyChanged;
    FView: TCollectionView;
    property NotifyPropertyChanged: TNotifyPropertyChanged
      read FNotifyPropertyChanged implements INotifyPropertyChanged;
  protected
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    property View: TCollectionView read FView implements ICollectionView;
  end;

implementation

{ TChromeTabs }

constructor TChromeTabs.Create(AOwner: TComponent);
begin
  inherited;
  FNotifyPropertyChanged := TNotifyPropertyChanged.Create(Self);
  FView := TCollectionViewTabsAdapter.Create(Self, Tabs);
end;

destructor TChromeTabs.Destroy;
begin
  FView.Free();
  inherited;
end;


{ TCollectionViewTabsAdapter }

function TCollectionViewTabsAdapter.AddDisplayItem: NativeInt;
begin
  Result := FTabs.Add.Index;
end;

procedure TCollectionViewTabsAdapter.ClearDisplayItems;
begin
  FTabs.Clear;
end;

constructor TCollectionViewTabsAdapter.Create(AOwner: TPersistent;
  ATabs: TChromeTabsList);
begin
  FTabs := ATabs;
  FOwner := AOwner;
end;

destructor TCollectionViewTabsAdapter.Destroy;
begin
  FTabs.Free;
  inherited;
end;

function TCollectionViewTabsAdapter.FindDisplayItem(AItem: TObject): NativeInt;
begin
  Result := FTabs.IndexOf(AItem as TChromeTab);
end;

function TCollectionViewTabsAdapter.GetDisplayItemsCount: NativeInt;
begin
  FTabs.Count;
end;

procedure TCollectionViewTabsAdapter.RemoveDisplayItem(AIndex: NativeInt);
begin
  if AIndex = ItemIndex then
  begin
    FTabs.DeleteTab(AIndex, True);
    UpdateItemIndex(nil);
    NotifyPropertyChanged(FOwner, Self, 'View');
  end
  else
  begin
    FTabs.DeleteTab(AIndex, True);
  end;
end;

procedure TCollectionViewTabsAdapter.UpdateDisplayItem(AIndex: NativeInt;
  AItem: TObject);
begin
//  FTabs[AIndex] := ItemTemplate.GetText(AItem, -1);
  FTabs.Items[AIndex] := AItem as TChromeTab;
end;

end.
