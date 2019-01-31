object ProductsView: TProductsView
  Left = 0
  Top = 0
  Width = 451
  Height = 305
  Align = alClient
  TabOrder = 0
  object Panel1: TPanel
    Left = 312
    Top = 0
    Width = 139
    Height = 305
    Align = alRight
    TabOrder = 0
    object Button1: TButton
      Left = 32
      Top = 8
      Width = 75
      Height = 25
      Caption = 'Button1'
      TabOrder = 0
      OnClick = Button1Click
    end
    object Button2: TButton
      Left = 32
      Top = 144
      Width = 75
      Height = 25
      Caption = 'Refresh'
      TabOrder = 1
      OnClick = Button2Click
    end
  end
  object Grid: TcxGrid
    Left = 0
    Top = 0
    Width = 312
    Height = 305
    Align = alClient
    TabOrder = 1
    object View: TcxGridDBTableView
      Navigator.Buttons.CustomButtons = <>
      DataController.DataSource = ProductsDataSource
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      OptionsBehavior.IncSearch = True
      OptionsData.Deleting = False
      OptionsData.DeletingConfirmation = False
      OptionsData.Editing = False
      OptionsData.Inserting = False
      OptionsSelection.MultiSelect = True
      OptionsSelection.CellMultiSelect = True
      OptionsSelection.InvertSelect = False
      OptionsView.ColumnAutoWidth = True
    end
    object Level: TcxGridLevel
      GridView = View
    end
  end
  object ProductsDataSource: TDataSource
    Left = 336
    Top = 152
  end
end
