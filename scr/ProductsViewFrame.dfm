object ProductsView: TProductsView
  Left = 0
  Top = 0
  Width = 759
  Height = 504
  Align = alClient
  TabOrder = 0
  ExplicitWidth = 451
  ExplicitHeight = 305
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 759
    Height = 40
    Align = alTop
    TabOrder = 0
    DesignSize = (
      759
      40)
    object BtnKeluar: TButton
      Left = 673
      Top = 8
      Width = 75
      Height = 25
      Anchors = [akTop, akRight]
      Caption = 'Keluar'
      TabOrder = 0
      OnClick = BtnKeluarClick
      ExplicitLeft = 672
    end
    object BtnRefresh: TButton
      Left = 8
      Top = 8
      Width = 75
      Height = 25
      Caption = 'Refresh'
      TabOrder = 1
      OnClick = BtnRefreshClick
    end
    object BtnTambah: TButton
      Left = 89
      Top = 8
      Width = 75
      Height = 25
      Caption = 'Tambah'
      TabOrder = 2
    end
  end
  object Grid: TcxGrid
    Left = 0
    Top = 40
    Width = 759
    Height = 464
    Align = alClient
    TabOrder = 1
    ExplicitTop = 0
    ExplicitWidth = 312
    ExplicitHeight = 305
    object View: TcxGridDBTableView
      Navigator.Buttons.CustomButtons = <>
      DataController.DataSource = ProductsDataSource
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      OptionsBehavior.CellHints = True
      OptionsBehavior.DragDropText = True
      OptionsBehavior.IncSearch = True
      OptionsData.Deleting = False
      OptionsData.DeletingConfirmation = False
      OptionsData.Editing = False
      OptionsData.Inserting = False
      OptionsSelection.MultiSelect = True
      OptionsView.ColumnAutoWidth = True
      OptionsView.GroupByBox = False
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
