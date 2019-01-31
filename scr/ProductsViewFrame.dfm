object ProductsView: TProductsView
  Left = 0
  Top = 0
  Width = 758
  Height = 504
  Align = alClient
  TabOrder = 0
  ExplicitWidth = 451
  ExplicitHeight = 305
  object Panel1: TPanel
    Left = 619
    Top = 0
    Width = 139
    Height = 504
    Align = alRight
    TabOrder = 0
    ExplicitLeft = 312
    ExplicitHeight = 305
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
    Width = 619
    Height = 504
    Align = alClient
    TabOrder = 1
    ExplicitWidth = 312
    ExplicitHeight = 305
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
      object Viewid: TcxGridDBColumn
        DataBinding.FieldName = 'id'
      end
      object Viewdescription: TcxGridDBColumn
        DataBinding.FieldName = 'description'
      end
      object Viewunit: TcxGridDBColumn
        DataBinding.FieldName = 'unit'
      end
      object Viewcost_price: TcxGridDBColumn
        DataBinding.FieldName = 'cost_price'
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Properties.DisplayFormat = '#,###.00;(#,###.00);0.00'
      end
      object Viewprice: TcxGridDBColumn
        DataBinding.FieldName = 'price'
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Properties.DisplayFormat = '#,###.00;(#,###.00);0.00'
      end
      object Viewto_buy: TcxGridDBColumn
        DataBinding.FieldName = 'to_buy'
      end
      object Viewto_sell: TcxGridDBColumn
        DataBinding.FieldName = 'to_sell'
      end
      object Viewis_raw: TcxGridDBColumn
        DataBinding.FieldName = 'is_raw'
      end
    end
    object Level: TcxGridLevel
      GridView = View
    end
  end
  object ProductsDataSource: TDataSource
    DataSet = QProducts
    Left = 336
    Top = 152
  end
  object QProducts: TMyQuery
    Connection = MainView.Con
    SQL.Strings = (
      'SELECT * FROM products')
    Constraints = <>
    Active = True
    Left = 336
    Top = 80
  end
end
