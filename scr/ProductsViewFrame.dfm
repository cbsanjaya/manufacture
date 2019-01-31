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
      NewItemRow.InfoText = 'Tekan di sini Untuk Menambah Data Baru'
      NewItemRow.Visible = True
      OptionsBehavior.CellHints = True
      OptionsBehavior.DragDropText = True
      OptionsSelection.UnselectFocusedRecordOnExit = False
      OptionsView.ColumnAutoWidth = True
      OptionsView.GroupByBox = False
      object Viewid: TcxGridDBColumn
        DataBinding.FieldName = 'id'
        Visible = False
      end
      object Viewdescription: TcxGridDBColumn
        Caption = 'Deskripsi'
        DataBinding.FieldName = 'description'
      end
      object Viewunit: TcxGridDBColumn
        Caption = 'Satuan'
        DataBinding.FieldName = 'unit'
      end
      object Viewcost_price: TcxGridDBColumn
        Caption = 'Harga Beli'
        DataBinding.FieldName = 'cost_price'
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Properties.DisplayFormat = '#,###.00;(#,###.00);0.00'
      end
      object Viewprice: TcxGridDBColumn
        Caption = 'Harga Jual'
        DataBinding.FieldName = 'price'
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Properties.DisplayFormat = '#,###.00;(#,###.00);0.00'
      end
      object Viewto_buy: TcxGridDBColumn
        Caption = 'di Beli'
        DataBinding.FieldName = 'to_buy'
        HeaderAlignmentHorz = taCenter
      end
      object Viewto_sell: TcxGridDBColumn
        Caption = 'di Jual'
        DataBinding.FieldName = 'to_sell'
        HeaderAlignmentHorz = taCenter
      end
      object Viewis_raw: TcxGridDBColumn
        Caption = 'Baku'
        DataBinding.FieldName = 'is_raw'
        HeaderAlignmentHorz = taCenter
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
