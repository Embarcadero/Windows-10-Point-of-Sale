object RegisterFrame: TRegisterFrame
  Left = 0
  Top = 0
  Width = 1000
  Height = 619
  TabOrder = 0
  object Panel8: TPanel
    AlignWithMargins = True
    Left = 25
    Top = 3
    Width = 972
    Height = 67
    Margins.Left = 25
    Align = alTop
    BevelOuter = bvNone
    FullRepaint = False
    TabOrder = 0
    object Label25: TLabel
      AlignWithMargins = True
      Left = 108
      Top = 5
      Width = 122
      Height = 57
      Margins.Top = 5
      Margins.Bottom = 5
      Align = alLeft
      Caption = 'Register'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -32
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
      Layout = tlCenter
      ExplicitHeight = 45
    end
    object VirtualImage7: TVirtualImage
      Left = 0
      Top = 0
      Width = 105
      Height = 67
      Align = alLeft
      ImageCollection = DM.IconImageCollection
      ImageWidth = 0
      ImageHeight = 0
      ImageIndex = 1
      ImageName = 'baseline_account_balance_white'
      ExplicitLeft = -3
    end
    object UsersRelativePanel: TRelativePanel
      Left = 233
      Top = 0
      Width = 739
      Height = 67
      ControlCollection = <
        item
          Control = Panel5
          AlignBottomWithPanel = False
          AlignHorizontalCenterWithPanel = False
          AlignLeftWithPanel = False
          AlignRightWithPanel = True
          AlignTopWithPanel = False
          AlignVerticalCenterWithPanel = False
        end
        item
          Control = Panel6
          AlignBottomWithPanel = False
          AlignHorizontalCenterWithPanel = False
          AlignLeftWithPanel = True
          AlignRightWithPanel = False
          AlignTopWithPanel = False
          AlignVerticalCenterWithPanel = False
        end>
      Align = alClient
      BevelOuter = bvNone
      FullRepaint = False
      TabOrder = 0
      object Panel5: TPanel
        Left = 480
        Top = -1
        Width = 259
        Height = 68
        Align = alClient
        BevelOuter = bvNone
        TabOrder = 0
        object Label4: TLabel
          Left = 0
          Top = 0
          Width = 259
          Height = 25
          Align = alTop
          Alignment = taRightJustify
          Caption = 'Sale Total'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -21
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          ExplicitLeft = 167
          ExplicitWidth = 92
        end
        object SaleTotalLabel: TLabel
          Left = 0
          Top = 25
          Width = 259
          Height = 39
          Align = alTop
          Alignment = taRightJustify
          Caption = '0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -32
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          ExplicitLeft = 198
          ExplicitWidth = 61
        end
      end
      object Panel6: TPanel
        AlignWithMargins = True
        Left = 50
        Top = -1
        Width = 293
        Height = 68
        Margins.Left = 50
        Align = alClient
        BevelOuter = bvNone
        TabOrder = 1
        object CashierLabel: TLabel
          Left = 0
          Top = 0
          Width = 293
          Height = 19
          Align = alTop
          Caption = 'Cashier: Clerk1'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -16
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          ExplicitWidth = 108
        end
        object PriceModeLabel: TLabel
          Left = 0
          Top = 41
          Width = 293
          Height = 19
          Align = alTop
          Caption = 'Price Mode: Normal'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -16
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          ExplicitWidth = 140
        end
        object CustomerPanel: TPanel
          Left = 0
          Top = 19
          Width = 293
          Height = 22
          Align = alTop
          BevelOuter = bvNone
          TabOrder = 0
          object CustomerLabel: TLabel
            Left = 74
            Top = 0
            Width = 219
            Height = 22
            Align = alClient
            Caption = 'Anonymous'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -16
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
            ExplicitWidth = 85
            ExplicitHeight = 19
          end
          object Label2: TLabel
            Left = 0
            Top = 0
            Width = 74
            Height = 22
            Align = alLeft
            Caption = 'Customer:'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -16
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
            ExplicitHeight = 19
          end
        end
      end
    end
  end
  object GridPanel1: TGridPanel
    AlignWithMargins = True
    Left = 3
    Top = 552
    Width = 994
    Height = 64
    Align = alBottom
    ColumnCollection = <
      item
        Value = 19.833185136613260000
      end
      item
        Value = 20.293782824750440000
      end
      item
        Value = 19.599903368701290000
      end
      item
        Value = 20.000000000000000000
      end
      item
        Value = 20.273128669935010000
      end>
    ControlCollection = <
      item
        Column = 0
        Control = PriceModeButton
        Row = 0
      end
      item
        Column = 1
        Control = SpeedButton12
        Row = 0
      end
      item
        Column = 2
        Control = SpeedButton13
        Row = 0
      end
      item
        Column = 3
        Control = SpeedButton14
        Row = 0
      end
      item
        Column = 4
        Control = LogoutButton
        Row = 0
      end>
    RowCollection = <
      item
        Value = 100.000000000000000000
      end>
    TabOrder = 1
    object PriceModeButton: TSpeedButton
      AlignWithMargins = True
      Left = 4
      Top = 4
      Width = 191
      Height = 56
      Hint = 'Remove'
      Align = alClient
      Caption = 'Price Mode'
      ImageIndex = 13
      ImageName = 'baseline_remove_white'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      OnClick = PriceModeButtonClick
      ExplicitLeft = 88
      ExplicitTop = 21
      ExplicitWidth = 23
      ExplicitHeight = 22
    end
    object SpeedButton12: TSpeedButton
      AlignWithMargins = True
      Left = 201
      Top = 4
      Width = 195
      Height = 56
      Hint = 'Remove'
      Align = alClient
      Caption = 'Customer'
      ImageIndex = 13
      ImageName = 'baseline_remove_white'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      OnClick = SpeedButton12Click
      ExplicitLeft = 88
      ExplicitTop = 21
      ExplicitWidth = 23
      ExplicitHeight = 22
    end
    object SpeedButton13: TSpeedButton
      AlignWithMargins = True
      Left = 402
      Top = 4
      Width = 188
      Height = 56
      Hint = 'Remove'
      Align = alClient
      Caption = 'Print Last Slip'
      ImageIndex = 13
      ImageName = 'baseline_remove_white'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      OnClick = SpeedButton13Click
      ExplicitTop = 3
    end
    object SpeedButton14: TSpeedButton
      AlignWithMargins = True
      Left = 596
      Top = 4
      Width = 193
      Height = 56
      Hint = 'Remove'
      Align = alClient
      Caption = 'Menu'
      ImageIndex = 13
      ImageName = 'baseline_remove_white'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      OnClick = SpeedButton14Click
      ExplicitLeft = 88
      ExplicitTop = 21
      ExplicitWidth = 23
      ExplicitHeight = 22
    end
    object LogoutButton: TSpeedButton
      AlignWithMargins = True
      Left = 795
      Top = 4
      Width = 195
      Height = 56
      Hint = 'Remove'
      Align = alClient
      Caption = 'Logout'
      ImageIndex = 13
      ImageName = 'baseline_remove_white'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      OnClick = LogoutButtonClick
      ExplicitLeft = 88
      ExplicitTop = 21
      ExplicitWidth = 23
      ExplicitHeight = 22
    end
  end
  object Panel1: TPanel
    AlignWithMargins = True
    Left = 3
    Top = 76
    Width = 566
    Height = 470
    Align = alClient
    Caption = 'Panel1'
    TabOrder = 2
    object ItemsStringGrid: TStringGrid
      Tag = 5
      AlignWithMargins = True
      Left = 4
      Top = 4
      Width = 558
      Height = 388
      Align = alClient
      FixedCols = 0
      RowCount = 2
      Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRowSelect, goFixedRowDefAlign]
      ScrollBars = ssVertical
      TabOrder = 0
      ColWidths = (
        64
        124
        64
        64
        64)
      ColAligments = (
        1
        0
        1
        1
        1)
    end
    object Panel2: TPanel
      AlignWithMargins = True
      Left = 4
      Top = 398
      Width = 558
      Height = 68
      Align = alBottom
      BevelOuter = bvNone
      TabOrder = 1
      object RemoveItemButton: TSpeedButton
        AlignWithMargins = True
        Left = 231
        Top = 3
        Width = 70
        Height = 62
        Hint = 'Remove Item'
        Align = alLeft
        Caption = 'Remove'
        ImageIndex = 13
        ImageName = 'baseline_remove_white'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        OnClick = RemoveItemButtonClick
        ExplicitTop = 0
      end
      object QuantityButton: TSpeedButton
        AlignWithMargins = True
        Left = 155
        Top = 3
        Width = 70
        Height = 62
        Hint = 'Quantity'
        Align = alLeft
        Caption = 'Quantity'
        ImageIndex = 13
        ImageName = 'baseline_remove_white'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        OnClick = QuantityButtonClick
        ExplicitLeft = 3
      end
      object DecQuantityButton: TSpeedButton
        AlignWithMargins = True
        Left = 79
        Top = 3
        Width = 70
        Height = 62
        Hint = 'Reduce Quantity'
        Align = alLeft
        Caption = 'Down'
        ImageIndex = 13
        ImageName = 'baseline_remove_white'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        OnClick = DecQuantityButtonClick
        ExplicitLeft = 3
      end
      object IncQuantityButton: TSpeedButton
        AlignWithMargins = True
        Left = 3
        Top = 3
        Width = 70
        Height = 62
        Hint = 'Increase Quantity'
        Align = alLeft
        Caption = 'Up'
        ImageIndex = 13
        ImageName = 'baseline_remove_white'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        OnClick = IncQuantityButtonClick
      end
      object Panel4: TPanel
        Left = 304
        Top = 0
        Width = 254
        Height = 68
        Align = alClient
        BevelOuter = bvNone
        TabOrder = 0
        object TaxLabel: TLabel
          Left = 0
          Top = 0
          Width = 254
          Height = 25
          Align = alTop
          Alignment = taRightJustify
          Caption = 'Tax: 0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -21
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          ExplicitLeft = 168
          ExplicitWidth = 86
        end
        object TotalLabel: TLabel
          Left = 0
          Top = 25
          Width = 254
          Height = 39
          Align = alTop
          Alignment = taRightJustify
          Caption = 'Total: 0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -32
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          ExplicitLeft = 101
          ExplicitWidth = 153
        end
      end
    end
  end
  object Panel3: TPanel
    Left = 572
    Top = 73
    Width = 226
    Height = 476
    Align = alRight
    BevelOuter = bvNone
    TabOrder = 3
    object Label1: TLabel
      AlignWithMargins = True
      Left = 3
      Top = 3
      Width = 220
      Height = 13
      Align = alTop
      Alignment = taCenter
      Caption = 'BARCODE / STOCK CODE / DESCRIPTION'
      ExplicitWidth = 200
    end
    object EnterButton: TSpeedButton
      AlignWithMargins = True
      Left = 3
      Top = 396
      Width = 220
      Height = 70
      Hint = 'Enter'
      Margins.Bottom = 10
      Align = alTop
      Caption = 'Enter'
      ImageIndex = 13
      ImageName = 'baseline_remove_white'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      OnClick = EnterButtonClick
      ExplicitTop = 397
    end
    object CodeEdit: TEdit
      AlignWithMargins = True
      Left = 3
      Top = 22
      Width = 220
      Height = 21
      Align = alTop
      Alignment = taCenter
      TabOrder = 0
      TextHint = 'Enter #'
    end
    object GridPanel2: TGridPanel
      AlignWithMargins = True
      Left = 3
      Top = 49
      Width = 220
      Height = 341
      Align = alTop
      ColumnCollection = <
        item
          Value = 33.543320123513430000
        end
        item
          Value = 33.543320123513430000
        end
        item
          Value = 32.913359752973140000
        end>
      ControlCollection = <
        item
          Column = 0
          Control = Num1Button
          Row = 0
        end
        item
          Column = 1
          Control = Num2Button
          Row = 0
        end
        item
          Column = 2
          Control = Num3Button
          Row = 0
        end
        item
          Column = 0
          Control = Num4Button
          Row = 1
        end
        item
          Column = 1
          Control = Num5Button
          Row = 1
        end
        item
          Column = 2
          Control = Num6Button
          Row = 1
        end
        item
          Column = 0
          Control = Num7Button
          Row = 2
        end
        item
          Column = 1
          Control = Num8Button
          Row = 2
        end
        item
          Column = 2
          Control = Num9Button
          Row = 2
        end
        item
          Column = 0
          Control = ClearButton
          Row = 3
        end
        item
          Column = 1
          Control = Num0Button
          Row = 3
        end
        item
          Column = 2
          Control = BackButton
          Row = 3
        end>
      RowCollection = <
        item
          Value = 26.008910103499770000
        end
        item
          Value = 26.008910103499770000
        end
        item
          Value = 23.073898893318620000
        end
        item
          Value = 24.908280899681840000
        end>
      TabOrder = 1
      object Num1Button: TSpeedButton
        AlignWithMargins = True
        Left = 4
        Top = 4
        Width = 67
        Height = 82
        Hint = '1'
        Align = alClient
        Caption = '1'
        ImageIndex = 13
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        OnClick = Num1ButtonClick
        ExplicitLeft = 12
        ExplicitTop = 12
        ExplicitWidth = 53
        ExplicitHeight = 94
      end
      object Num2Button: TSpeedButton
        AlignWithMargins = True
        Left = 77
        Top = 4
        Width = 67
        Height = 82
        Hint = '2'
        Align = alClient
        Caption = '2'
        ImageIndex = 13
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        OnClick = Num1ButtonClick
        ExplicitLeft = 88
        ExplicitTop = 21
        ExplicitWidth = 23
        ExplicitHeight = 22
      end
      object Num3Button: TSpeedButton
        AlignWithMargins = True
        Left = 150
        Top = 4
        Width = 66
        Height = 82
        Hint = '3'
        Align = alClient
        Caption = '3'
        ImageIndex = 13
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        OnClick = Num1ButtonClick
        ExplicitLeft = 88
        ExplicitTop = 21
        ExplicitWidth = 23
        ExplicitHeight = 22
      end
      object Num4Button: TSpeedButton
        AlignWithMargins = True
        Left = 4
        Top = 92
        Width = 67
        Height = 82
        Hint = '4'
        Align = alClient
        Caption = '4'
        ImageIndex = 13
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        OnClick = Num1ButtonClick
        ExplicitLeft = 88
        ExplicitTop = 21
        ExplicitWidth = 23
        ExplicitHeight = 22
      end
      object Num5Button: TSpeedButton
        AlignWithMargins = True
        Left = 77
        Top = 92
        Width = 67
        Height = 82
        Hint = '5'
        Align = alClient
        Caption = '5'
        ImageIndex = 13
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        OnClick = Num1ButtonClick
        ExplicitLeft = 88
        ExplicitTop = 21
        ExplicitWidth = 23
        ExplicitHeight = 22
      end
      object Num6Button: TSpeedButton
        AlignWithMargins = True
        Left = 150
        Top = 92
        Width = 66
        Height = 82
        Hint = '6'
        Align = alClient
        Caption = '6'
        ImageIndex = 13
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        OnClick = Num1ButtonClick
        ExplicitLeft = 88
        ExplicitTop = 21
        ExplicitWidth = 23
        ExplicitHeight = 22
      end
      object Num7Button: TSpeedButton
        AlignWithMargins = True
        Left = 4
        Top = 180
        Width = 67
        Height = 73
        Hint = '7'
        Align = alClient
        Caption = '7'
        ImageIndex = 13
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        OnClick = Num1ButtonClick
        ExplicitLeft = 88
        ExplicitTop = 21
        ExplicitWidth = 23
        ExplicitHeight = 22
      end
      object Num8Button: TSpeedButton
        AlignWithMargins = True
        Left = 77
        Top = 180
        Width = 67
        Height = 73
        Hint = '8'
        Align = alClient
        Caption = '8'
        ImageIndex = 13
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        OnClick = Num1ButtonClick
        ExplicitLeft = 88
        ExplicitTop = 21
        ExplicitWidth = 23
        ExplicitHeight = 22
      end
      object Num9Button: TSpeedButton
        AlignWithMargins = True
        Left = 150
        Top = 180
        Width = 66
        Height = 73
        Hint = '9'
        Align = alClient
        Caption = '9'
        ImageIndex = 13
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        OnClick = Num1ButtonClick
        ExplicitLeft = 88
        ExplicitTop = 21
        ExplicitWidth = 23
        ExplicitHeight = 22
      end
      object ClearButton: TSpeedButton
        AlignWithMargins = True
        Left = 4
        Top = 259
        Width = 67
        Height = 78
        Hint = 'Remove'
        Align = alClient
        Caption = 'Clear'
        ImageIndex = 13
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        OnClick = ClearButtonClick
        ExplicitLeft = 88
        ExplicitTop = 21
        ExplicitWidth = 23
        ExplicitHeight = 22
      end
      object Num0Button: TSpeedButton
        AlignWithMargins = True
        Left = 77
        Top = 259
        Width = 67
        Height = 78
        Hint = '0'
        Align = alClient
        Caption = '0'
        ImageIndex = 13
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        OnClick = Num1ButtonClick
        ExplicitLeft = 88
        ExplicitTop = 21
        ExplicitWidth = 23
        ExplicitHeight = 22
      end
      object BackButton: TSpeedButton
        AlignWithMargins = True
        Left = 150
        Top = 259
        Width = 66
        Height = 78
        Hint = '<<'
        Align = alClient
        Caption = '<<'
        ImageIndex = 13
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        OnClick = BackButtonClick
        ExplicitLeft = 88
        ExplicitTop = 21
        ExplicitWidth = 23
        ExplicitHeight = 22
      end
    end
  end
  object Panel7: TPanel
    Left = 798
    Top = 73
    Width = 202
    Height = 476
    Align = alRight
    BevelOuter = bvNone
    TabOrder = 4
    object DiscountButton: TSpeedButton
      AlignWithMargins = True
      Left = 3
      Top = 231
      Width = 196
      Height = 70
      Hint = 'Discount'
      Align = alTop
      Caption = 'Discount'
      ImageIndex = 13
      ImageName = 'baseline_remove_white'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      OnClick = DiscountButtonClick
      ExplicitLeft = -41
      ExplicitTop = -17
      ExplicitWidth = 226
    end
    object PayButton: TSpeedButton
      AlignWithMargins = True
      Left = 3
      Top = 3
      Width = 196
      Height = 70
      Hint = 'Remove'
      Align = alTop
      Caption = 'Pay'
      ImageIndex = 13
      ImageName = 'baseline_remove_white'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      OnClick = PayButtonClick
      ExplicitLeft = -1
      ExplicitTop = -1
      ExplicitWidth = 177
    end
    object PriceChangeButton: TSpeedButton
      AlignWithMargins = True
      Left = 3
      Top = 155
      Width = 196
      Height = 70
      Hint = 'Price Change'
      Align = alTop
      Caption = 'Price Change'
      ImageIndex = 13
      ImageName = 'baseline_remove_white'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      OnClick = PriceChangeButtonClick
      ExplicitTop = 65
    end
    object SearchButton: TSpeedButton
      AlignWithMargins = True
      Left = 3
      Top = 79
      Width = 196
      Height = 70
      Hint = 'Remove'
      Align = alTop
      Caption = 'Product Search'
      ImageIndex = 13
      ImageName = 'baseline_remove_white'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      OnClick = SearchButtonClick
      ExplicitLeft = -1
      ExplicitTop = 49
    end
    object SuspendSaleButton: TSpeedButton
      AlignWithMargins = True
      Left = 3
      Top = 307
      Width = 196
      Height = 70
      Hint = 'Remove'
      Align = alTop
      Caption = 'Suspend Sale'
      ImageIndex = 13
      ImageName = 'baseline_remove_white'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      OnClick = SuspendSaleButtonClick
      ExplicitLeft = 6
      ExplicitTop = 343
    end
    object VoidSaleButton: TSpeedButton
      AlignWithMargins = True
      Left = 3
      Top = 383
      Width = 196
      Height = 70
      Hint = 'Remove'
      Align = alTop
      Caption = 'Void Sale'
      ImageIndex = 13
      ImageName = 'baseline_remove_white'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      OnClick = VoidSaleButtonClick
      ExplicitLeft = 19
      ExplicitTop = 419
    end
  end
  object LastReceiptMemo: TMemo
    Left = 25
    Top = 152
    Width = 512
    Height = 25
    TabOrder = 5
    Visible = False
    WordWrap = False
  end
  object CurrentSaleBindSourceDB: TBindSourceDB
    DataSet = DM.CurrentSaleMemTable
    ScopeMappings = <>
    Left = 224
    Top = 184
  end
  object BindingsList1: TBindingsList
    Methods = <>
    OutputConverters = <>
    Left = 20
    Top = 5
    object LinkGridToDataSourceBindSourceDB1: TLinkGridToDataSource
      Category = 'Quick Bindings'
      DataSource = CurrentSaleBindSourceDB
      GridControl = ItemsStringGrid
      Columns = <
        item
          MemberName = 'ItemId'
          Header = 'Item #'
        end
        item
          MemberName = 'Description'
          Header = 'Description'
        end
        item
          MemberName = 'Price'
          Header = 'Price'
        end
        item
          MemberName = 'Quantity'
          Header = 'Quantity'
        end
        item
          MemberName = 'Subtotal'
          Header = 'Subtotal'
        end>
    end
    object LinkPropertyToFieldCaption: TLinkPropertyToField
      Category = 'Quick Bindings'
      DataSource = CustomerForm.CustomersBindSourceDB
      FieldName = 'CustomerName'
      Component = CustomerLabel
      ComponentProperty = 'Caption'
    end
  end
  object ProductsBindSourceDB: TBindSourceDB
    DataSet = DM.ProductsMemTable
    ScopeMappings = <>
    Left = 267
    Top = 300
  end
  object SaleLogBindSourceDB: TBindSourceDB
    DataSet = DM.SaleLogMemTable
    ScopeMappings = <>
    Left = 371
    Top = 268
  end
  object CustomersBindSourceDB: TBindSourceDB
    DataSet = DM.CustomersMemTable
    ScopeMappings = <>
    Left = 448
    Top = 352
  end
end
