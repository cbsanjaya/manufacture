object ProductsView: TProductsView
  Left = 0
  Top = 0
  Width = 557
  Height = 512
  Align = alClient
  TabOrder = 0
  object Panel1: TPanel
    Left = 372
    Top = 0
    Width = 185
    Height = 512
    Align = alRight
    TabOrder = 0
    ExplicitLeft = 184
    ExplicitTop = 240
    ExplicitHeight = 41
    object Button1: TButton
      Left = 56
      Top = 248
      Width = 75
      Height = 25
      Caption = 'Button1'
      TabOrder = 0
      OnClick = Button1Click
    end
  end
  object cxGrid1: TcxGrid
    Left = 0
    Top = 0
    Width = 372
    Height = 512
    Align = alClient
    TabOrder = 1
    ExplicitLeft = 64
    ExplicitTop = 200
    ExplicitWidth = 250
    ExplicitHeight = 200
    object cxGrid1DBTableView1: TcxGridDBTableView
      Navigator.Buttons.CustomButtons = <>
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
    end
    object cxGrid1Level1: TcxGridLevel
      GridView = cxGrid1DBTableView1
    end
  end
end
