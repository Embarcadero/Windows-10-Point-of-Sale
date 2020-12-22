object CustomerForm: TCustomerForm
  Left = 0
  Top = 0
  Caption = 'Customers'
  ClientHeight = 631
  ClientWidth = 840
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poOwnerFormCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object NavPanel: TPanel
    Left = 0
    Top = 590
    Width = 840
    Height = 41
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 0
    object CloseButton: TButton
      AlignWithMargins = True
      Left = 704
      Top = 3
      Width = 133
      Height = 35
      Align = alRight
      Cancel = True
      Caption = 'Close'
      TabOrder = 0
      OnClick = CloseButtonClick
    end
  end
  object CustomersSG: TStringGrid
    Tag = 5
    AlignWithMargins = True
    Left = 3
    Top = 3
    Width = 834
    Height = 584
    Align = alClient
    BorderStyle = bsNone
    DoubleBuffered = True
    FixedCols = 0
    RowCount = 2
    Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goColSizing, goRowSelect]
    ParentDoubleBuffered = False
    ScrollBars = ssVertical
    TabOrder = 1
    ColWidths = (
      64
      772
      772
      772
      772)
    ColAligments = (
      1
      0
      0
      0
      0)
  end
  object CustomersBindSourceDB: TBindSourceDB
    DataSet = DM.CustomersMemTable
    ScopeMappings = <>
    Left = 552
    Top = 392
  end
  object BindingsList1: TBindingsList
    Methods = <>
    OutputConverters = <>
    Left = 20
    Top = 5
    object LinkGridToDataSourceCustomersBindSourceDB: TLinkGridToDataSource
      Category = 'Quick Bindings'
      DataSource = CustomersBindSourceDB
      GridControl = CustomersSG
      Columns = <>
    end
  end
end
