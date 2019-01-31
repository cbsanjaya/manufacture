unit Interfaces;

interface

uses
  System.SysUtils, Vcl.Controls;

type
  IMainView = interface
    ['{062D2FAA-A4AA-46AF-B6EB-92E43F4E47EB}']
    procedure CreateMenuPage;
    procedure OpenFrame(ATitle: string; AProc: TProc<TWinControl>);
    procedure CloseTab(AControl: TWinControl);
  end;

  IMenuView = interface
    ['{2B04293C-2E7C-4BA6-A2E1-214A1700E53B}']
  end;

  IProductsView = interface
    ['{CBB6BF9D-3F30-40C6-AAB9-292CC3B9249A}']
  end;

implementation

end.
