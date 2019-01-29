unit Interfaces;

interface

type
  IPanelFrame = interface
    ['{753BD983-6F7C-418F-9D9B-96FFAD37E138}']
    function GetObject: TObject;
  end;

  IBasePresenter = interface
    ['{D11D3023-FDFF-4146-AF07-491FA2B6E52F}']
    procedure Start;
  end;

  IBaseView<T> = interface
    ['{D11D3023-FDFF-4146-AF07-491FA2B6E52F}']
    procedure SetPresenter(APresenter: T);
  end;

  IMainPresenter = interface(IBasePresenter)
    ['{2018CC47-FB09-4883-A910-521D9D9D8A8D}']
  end;

  IMainView = interface(IBaseView<IMainPresenter>)
    ['{062D2FAA-A4AA-46AF-B6EB-92E43F4E47EB}']
    procedure CreateMenuPage;
  end;

  IBaseFrameView<T> = interface(IBaseView<T>)
    ['{7B0AA6F0-3981-4815-B522-6867CDABBF4C}']
    procedure SetMainAndPanel(AMain: IMainView; APanel: IPanelFrame);
  end;

  IMenuPresenter = interface(IBasePresenter)
    ['{BBB01FCD-E79C-432A-80AE-AF016A7AA9AA}']
  end;

  IMenuView = interface(IBaseFrameView<IMenuPresenter>)
    ['{2B04293C-2E7C-4BA6-A2E1-214A1700E53B}']
  end;

implementation

end.
