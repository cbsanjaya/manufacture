object AssembleView: TAssembleView
  Left = 0
  Top = 0
  Width = 679
  Height = 496
  Align = alClient
  TabOrder = 0
  object PnlTop: TPanel
    Left = 0
    Top = 0
    Width = 679
    Height = 145
    Align = alTop
    TabOrder = 0
    object Label1: TLabel
      Left = 8
      Top = 19
      Width = 33
      Height = 13
      Caption = 'Produk'
    end
    object Label2: TLabel
      Left = 159
      Top = 64
      Width = 86
      Height = 13
      Caption = 'Tanggal Transaksi'
    end
    object Memo: TLabeledEdit
      Left = 8
      Top = 116
      Width = 326
      Height = 23
      EditLabel.Width = 28
      EditLabel.Height = 13
      EditLabel.Caption = 'Memo'
      TabOrder = 0
    end
    object Product: TComboBox
      Left = 8
      Top = 37
      Width = 326
      Height = 21
      Style = csDropDownList
      TabOrder = 1
    end
    object Quantity: TLabeledEdit
      Left = 8
      Top = 79
      Width = 145
      Height = 21
      Alignment = taRightJustify
      EditLabel.Width = 42
      EditLabel.Height = 13
      EditLabel.Caption = 'Quantity'
      NumbersOnly = True
      TabOrder = 2
      Text = '0'
    end
    object DateTimePicker1: TDateTimePicker
      Left = 159
      Top = 79
      Width = 175
      Height = 21
      Date = 43496.598812361110000000
      Time = 43496.598812361110000000
      TabOrder = 3
    end
  end
  object Grid: TcxGrid
    Left = 0
    Top = 145
    Width = 679
    Height = 351
    Align = alClient
    TabOrder = 1
    ExplicitLeft = 360
    ExplicitTop = 256
    ExplicitWidth = 250
    ExplicitHeight = 200
    object View: TcxGridDBTableView
      Navigator.Buttons.CustomButtons = <>
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      OptionsData.CancelOnExit = False
      OptionsData.Deleting = False
      OptionsData.DeletingConfirmation = False
      OptionsData.Editing = False
      OptionsData.Inserting = False
      OptionsSelection.MultiSelect = True
      OptionsView.ColumnAutoWidth = True
      OptionsView.GroupByBox = False
      object ViewColumn1: TcxGridDBColumn
        Caption = 'ID'
        HeaderAlignmentHorz = taCenter
        Width = 20
      end
      object ViewColumn2: TcxGridDBColumn
        Caption = 'Bahan Baku'
        Width = 120
      end
      object ViewColumn3: TcxGridDBColumn
        Caption = 'Qty'
        HeaderAlignmentHorz = taCenter
        Width = 20
      end
      object ViewColumn4: TcxGridDBColumn
        Caption = 'Harga'
        HeaderAlignmentHorz = taRightJustify
        Width = 50
      end
    end
    object Level: TcxGridLevel
      GridView = View
    end
  end
end
