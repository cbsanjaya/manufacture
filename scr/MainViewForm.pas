unit MainViewForm;

interface

uses
  Interfaces,
  Spring.Container,
  Winapi.Windows,
  System.SysUtils,
  System.Classes,
  Vcl.Controls,
  Vcl.Forms,
  Vcl.ExtCtrls,
  ChromeTabs,
  ChromeTabsClasses,
  Vcl.Menus;

type
  //interceptor class
  TPanel = class(Vcl.ExtCtrls.TPanel, IPanelFrame)
  private
    FTab: TChromeTab;
  public
    property Tab: TChromeTab read FTab write FTab;
  end;

  TMainView = class(TForm)
    Tabs: TChromeTabs;
    PanelMenu: TPanel;
    PopupTabs: TPopupMenu;
    procedure TabsActiveTabChanged(Sender: TObject; ATab: TChromeTab);
    procedure TabsButtonCloseTabClick(Sender: TObject; ATab: TChromeTab;
      var Close: Boolean);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FormShow(Sender: TObject);
  private
    FPresenter : IMainPresenter;
    PageIndex : Cardinal;
    procedure CreateNewPage(ACaption: string; var APanel: TPanel); overload;
  public
    procedure SetPresenter(APresenter: IMainPresenter);
    procedure CreateMenuPage;
    procedure OpenFrame(ATitle: string; AProc: TProc<IPanelFrame>);
    procedure ShowReport;
    procedure CloseTab(AControl: IPanelFrame);
  end;

var
  MainView : TMainView;

implementation

{$R *.dfm}

{ TMainView }

procedure TMainView.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  CanClose := MessageBox(0, 'Benarkan, Anda akan Keluar dari Applikasi?',
    'Keluar Aplikasi', MB_ICONQUESTION or MB_YESNO) = mrYes;
end;

procedure TMainView.FormShow(Sender: TObject);
begin
  FPresenter.Start;
end;

procedure TMainView.TabsActiveTabChanged(Sender: TObject; ATab: TChromeTab);
var
  LPanel :TPanel;
begin
  if ATab.Tag = 0 then Exit;

  LPanel := FindComponent('Panel' + IntToStr(ATab.Tag)) as TPanel;
  LPanel.BringToFront;
end;

procedure TMainView.TabsButtonCloseTabClick(Sender: TObject; ATab: TChromeTab;
  var Close: Boolean);
var
  LPanel :TPanel;
begin
  Close := False;
  if Tabs.Tabs.Count = 1 then
  begin
    Self.Close;
    Exit;
  end;

  LPanel := FindComponent('Panel' + IntToStr(ATab.Tag)) as TPanel;
  if ATab.Tag = 1 then Exit;
  LPanel.Free;
  Close := True;
end;

procedure TMainView.CloseTab(AControl: IPanelFrame);
var
  LTab : TChromeTab;
  LPanel, LControl :TPanel;
begin
  if Tabs.Tabs.Count = 1 then
  begin
    Self.Close;
    Exit;
  end;
  LControl := AControl as TPanel;

  Tabs.Tabs.DeleteTab(LControl.Tab.Index, False);
  LPanel := FindComponent('Panel' + IntToStr(LControl.Tag)) as TPanel;
  LPanel.Free;
end;

procedure TMainView.CreateMenuPage;
var
  LTab : TChromeTab;
  LPanel :TPanel;
  LFrame : IMenuView;
begin
  OpenFrame('Menu Utama',
    procedure (AOwner: IPanelFrame)
    begin
      LFrame := GlobalContainer.Resolve<IMenuView>;
      LFrame.SetMainAndPanel(Self, TPanel(AOwner));
      TPanel(AOwner).Tab.HideCloseButton := True;
    end
  );
end;

procedure TMainView.CreateNewPage(ACaption: string; var APanel: TPanel);
var
  LTab : TChromeTab;
begin
  Inc(PageIndex);
  LTab := Tabs.Tabs.Add;
  LTab.Caption := ACaption;
  LTab.Tag := PageIndex;

  APanel := TPanel.Create(Self);
  APanel.Parent := TForm(Self);
  APanel.Tab := LTab;
  APanel.Tag := LTab.Tag;
  APanel.Name := 'Panel' + IntToStr(APanel.Tag);
  APanel.Caption := '';
  APanel.Align := alClient;
  APanel.Show;
end;

procedure TMainView.OpenFrame(ATitle: string; AProc: TProc<IPanelFrame>);
var
  LPanel :TPanel;
begin
  CreateNewPage(ATitle, LPanel);
  AProc(LPanel);
end;

procedure TMainView.SetPresenter(APresenter: IMainPresenter);
begin
  FPresenter := APresenter;
end;

procedure TMainView.ShowReport;
var
  LPanel :TPanel;
//  LPreview: TfrxPreviewForm;
begin
  CreateNewPage('Laporan', LPanel);

//  Report.ShowReport;
//  LPreview := Report.PreviewForm as TfrxPreviewForm;
//  LPreview.CancelB.Visible := False;
//  LPreview.BorderStyle := bsNone;
//  LPreview.Parent := LPanel;
//  LPreview.Align := alClient;
end;

end.
