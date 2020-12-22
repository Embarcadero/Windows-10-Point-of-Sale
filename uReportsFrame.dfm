object ReportsFrame: TReportsFrame
  Left = 0
  Top = 0
  Width = 930
  Height = 602
  TabOrder = 0
  object ReportsSG: TStringGrid
    Tag = 4
    AlignWithMargins = True
    Left = 25
    Top = 183
    Width = 880
    Height = 385
    Margins.Left = 25
    Margins.Right = 25
    Align = alClient
    BorderStyle = bsNone
    ColCount = 4
    DoubleBuffered = True
    FixedCols = 0
    RowCount = 2
    Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goColSizing, goRowSelect]
    ParentDoubleBuffered = False
    ScrollBars = ssVertical
    TabOrder = 2
    ColWidths = (
      64
      64
      634
      112)
    ColAligments = (
      1
      1
      0
      0)
  end
  object Panel8: TPanel
    AlignWithMargins = True
    Left = 25
    Top = 3
    Width = 902
    Height = 67
    Margins.Left = 25
    Align = alTop
    BevelOuter = bvNone
    FullRepaint = False
    TabOrder = 1
    object Label25: TLabel
      AlignWithMargins = True
      Left = 108
      Top = 5
      Width = 117
      Height = 57
      Margins.Top = 5
      Margins.Bottom = 5
      Align = alLeft
      Caption = 'Reports'
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
      ImageIndex = 5
      ImageName = 'baseline_calendar_today_white'
      ExplicitLeft = -3
    end
    object UsersRelativePanel: TRelativePanel
      Left = 228
      Top = 0
      Width = 674
      Height = 67
      ControlCollection = <
        item
          Control = SearchBox
          AlignBottomWithPanel = False
          AlignHorizontalCenterWithPanel = False
          AlignLeftWithPanel = False
          AlignRightWithPanel = True
          AlignTopWithPanel = False
          AlignVerticalCenterWithPanel = True
        end
        item
          Control = DeleteButton
          AlignBottomWithPanel = False
          AlignHorizontalCenterWithPanel = False
          AlignLeftWithPanel = False
          AlignRightWithPanel = False
          AlignTopWithPanel = False
          AlignVerticalCenterWithPanel = True
          LeftOf = SearchBox
        end
        item
          Control = ViewButton
          AlignBottomWithPanel = False
          AlignHorizontalCenterWithPanel = False
          AlignLeftWithPanel = False
          AlignRightWithPanel = False
          AlignTopWithPanel = False
          AlignVerticalCenterWithPanel = True
          LeftOf = DeleteButton
        end>
      Align = alClient
      BevelOuter = bvNone
      FullRepaint = False
      TabOrder = 0
      OnResize = UsersRelativePanelResize
      DesignSize = (
        674
        67)
      object SearchBox: TSearchBox
        AlignWithMargins = True
        Left = 488
        Top = 15
        Width = 163
        Height = 36
        Margins.Top = 23
        Margins.Right = 23
        Margins.Bottom = 23
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -20
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
        TextHint = 'Search'
        OnInvokeSearch = SearchBoxInvokeSearch
      end
      object DeleteButton: TSpeedButton
        Left = 364
        Top = 14
        Width = 121
        Height = 38
        Hint = 'Delete'
        Anchors = []
        Caption = 'Delete'
        ImageIndex = 13
        ImageName = 'baseline_remove_white'
        Images = DM.IconVirtualImageList
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        OnClick = DeleteButtonClick
      end
      object ViewButton: TSpeedButton
        Left = 243
        Top = 14
        Width = 121
        Height = 38
        Hint = 'View'
        Anchors = []
        Caption = 'View'
        ImageIndex = 12
        ImageName = 'baseline_launch_white'
        Images = DM.IconVirtualImageList
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        OnClick = ViewButtonClick
      end
    end
  end
  object BindNavigator5: TBindNavigator
    AlignWithMargins = True
    Left = 25
    Top = 574
    Width = 880
    Height = 25
    Margins.Left = 25
    Margins.Right = 25
    DataSource = ReportsBindSourceDB
    Align = alBottom
    Orientation = orHorizontal
    TabOrder = 3
  end
  object FlowPanel1: TFlowPanel
    AlignWithMargins = True
    Left = 25
    Top = 76
    Width = 902
    Height = 101
    Margins.Left = 25
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 4
    DesignSize = (
      902
      101)
    object Panel6: TPanel
      AlignWithMargins = True
      Left = 3
      Top = 3
      Width = 150
      Height = 41
      BevelOuter = bvNone
      TabOrder = 5
      object Label6: TLabel
        Left = 0
        Top = 0
        Width = 150
        Height = 13
        Align = alTop
        Caption = 'Type:'
        ExplicitWidth = 28
      end
      object TypeCB: TComboBox
        AlignWithMargins = True
        Left = 3
        Top = 16
        Width = 144
        Height = 21
        Align = alClient
        Style = csDropDownList
        ItemIndex = 0
        TabOrder = 0
        Text = 'Products'
        OnChange = TypeCBChange
        Items.Strings = (
          'Products'
          'Sales')
      end
    end
    object Panel1: TPanel
      AlignWithMargins = True
      Left = 159
      Top = 3
      Width = 170
      Height = 41
      BevelOuter = bvNone
      TabOrder = 0
      object Label1: TLabel
        Left = 0
        Top = 0
        Width = 170
        Height = 13
        Align = alTop
        Caption = 'From:'
        ExplicitWidth = 28
      end
      object FromDatePicker: TDatePicker
        AlignWithMargins = True
        Left = 3
        Top = 16
        Width = 164
        Height = 22
        Align = alClient
        Date = 44176.000000000000000000
        DateFormat = 'M/d/yyyy'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Segoe UI'
        Font.Style = []
        TabOrder = 0
      end
    end
    object Panel2: TPanel
      AlignWithMargins = True
      Left = 335
      Top = 3
      Width = 170
      Height = 41
      BevelOuter = bvNone
      TabOrder = 1
      object Label2: TLabel
        Left = 0
        Top = 0
        Width = 170
        Height = 13
        Align = alTop
        Caption = 'To:'
        ExplicitWidth = 16
      end
      object ToDatePicker: TDatePicker
        AlignWithMargins = True
        Left = 3
        Top = 16
        Width = 164
        Height = 22
        Align = alClient
        Date = 44176.000000000000000000
        DateFormat = 'M/d/yyyy'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Segoe UI'
        Font.Style = []
        TabOrder = 0
      end
    end
    object ProductPanel: TPanel
      AlignWithMargins = True
      Left = 511
      Top = 3
      Width = 150
      Height = 41
      BevelOuter = bvNone
      TabOrder = 2
      object Label3: TLabel
        Left = 0
        Top = 0
        Width = 150
        Height = 13
        Align = alTop
        Caption = 'Product:'
        ExplicitWidth = 41
      end
      object ProductCB: TComboBox
        AlignWithMargins = True
        Left = 3
        Top = 16
        Width = 144
        Height = 21
        Align = alClient
        TabOrder = 0
        TextHint = 'Product'
        Items.Strings = (
          'Milk'
          'Bread'
          'Coffee'
          'DISCOUNT')
      end
    end
    object CategoryPanel: TPanel
      AlignWithMargins = True
      Left = 667
      Top = 3
      Width = 150
      Height = 41
      BevelOuter = bvNone
      TabOrder = 3
      object Label4: TLabel
        Left = 0
        Top = 0
        Width = 150
        Height = 13
        Align = alTop
        Caption = 'Category:'
        ExplicitWidth = 49
      end
      object CategoryCB: TComboBox
        AlignWithMargins = True
        Left = 3
        Top = 16
        Width = 144
        Height = 21
        Align = alClient
        TabOrder = 0
        TextHint = 'Category'
        Items.Strings = (
          'Beverages'
          'Bread/Bakery'
          'Canned/Jarred Goods'
          'Cleaners'
          'Dairy'
          'Dry/Baking Goods'
          'Frozen Foods'
          'Meat'
          'Other'
          'Paper Goods'
          'Personal Care'
          'Produce')
      end
    end
    object GroupPanel: TPanel
      AlignWithMargins = True
      Left = 3
      Top = 50
      Width = 150
      Height = 41
      BevelOuter = bvNone
      TabOrder = 4
      object Label5: TLabel
        Left = 0
        Top = 0
        Width = 150
        Height = 13
        Align = alTop
        Caption = 'Group:'
        ExplicitWidth = 33
      end
      object GroupCB: TComboBox
        AlignWithMargins = True
        Left = 3
        Top = 16
        Width = 144
        Height = 21
        Align = alClient
        TabOrder = 0
        TextHint = 'Group'
      end
    end
    object CreateButton: TSpeedButton
      AlignWithMargins = True
      Left = 159
      Top = 50
      Width = 73
      Height = 38
      Hint = 'Create'
      Anchors = []
      Caption = 'Create'
      ImageIndex = 3
      ImageName = 'baseline_add_white'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      OnClick = CreateButtonClick
    end
  end
  object ReportCSSMemo: TMemo
    Left = 470
    Top = 188
    Width = 393
    Height = 23
    Lines.Strings = (
      '<style type="text/css">'
      'body {'
      '  font-family: "Helvetica Neue", '
      'Helvetica, Arial;'
      '  font-size: 14px;'
      '  line-height: 20px;'
      '  font-weight: 400;'
      '  color: #3b3b3b;'
      '  -webkit-font-smoothing: '
      'antialiased;'
      '  font-smoothing: antialiased;'
      '  background: #2b2b2b;'
      '}'
      ''
      '.container-fluid {'
      '  margin: 0 auto;'
      '  padding: 40px;'
      '  max-width: 100%;'
      '}'
      ''
      '.table {'
      '  margin: 0 0 40px 0;'
      '  width: 100%;'
      '  box-shadow: 0 1px 3px rgba(0, 0, '
      '0, 0.2);'
      '  display: table;'
      '}'
      '@media screen and (max-width: '
      '100%) {'
      '  .table {'
      '    display: block;'
      '  }'
      '}'
      ''
      '.row {'
      '  display: table-row;'
      '  background: #f6f6f6;'
      '}'
      '.row:nth-of-type(odd) {'
      '  background: #e9e9e9;'
      '}'
      '.row.header {'
      '  font-weight: 900;'
      '  color: #ffffff;'
      '  background: #ea6153;'
      '}'
      '.row.green {'
      '  background: #27ae60;'
      '}'
      '.row.blue {'
      '  background: #2980b9;'
      '}'
      '.row.ltblue {'
      '  background: #3792D1;'
      '}'
      '@media screen and (max-width: '
      '100%) {'
      '  .row {'
      '    padding: 8px 0;'
      '    display: block;'
      '  }'
      '}'
      ''
      '.col-xs-6 {'
      '  padding: 6px 12px;'
      '  display: table-cell;'
      '}'
      '@media screen and (max-width: '
      '100%) {'
      '  .col-xs-6 {'
      '    padding: 2px 12px;'
      '    display: block;'
      '  }'
      '}'
      ''
      '.col-xs-12 {'
      '  padding: 6px 12px;'
      '  display: table-cell;'
      '}'
      '@media screen and (max-width: '
      '100%) {'
      '  .col-xs-12 {'
      '    padding: 2px 12px;'
      '    display: block;'
      '  }'
      '}'
      '</style>')
    TabOrder = 0
    Visible = False
    WordWrap = False
  end
  object ReportsBindSourceDB: TBindSourceDB
    DataSet = DM.ReportsMemTable
    ScopeMappings = <>
    Left = 464
    Top = 248
  end
  object BindingsList1: TBindingsList
    Methods = <>
    OutputConverters = <>
    Left = 20
    Top = 5
    object LinkGridToDataSourceReportsBindSourceDB: TLinkGridToDataSource
      Category = 'Quick Bindings'
      DataSource = ReportsBindSourceDB
      GridControl = ReportsSG
      Columns = <
        item
          MemberName = 'Id'
        end
        item
          MemberName = 'UserId'
        end
        item
          MemberName = 'Type'
          TextWidth = 105
        end
        item
          MemberName = 'Timestamp'
        end>
    end
    object LinkFillControlToField1: TLinkFillControlToField
      Category = 'Quick Bindings'
      Control = ProductCB
      Track = True
      FillDataSource = ProductsBindSourceDB
      FillValueFieldName = 'Id'
      FillDisplayFieldName = 'Description'
      AutoFill = True
      FillExpressions = <>
      FillHeaderExpressions = <>
      FillBreakGroups = <>
    end
    object LinkFillControlToField2: TLinkFillControlToField
      Category = 'Quick Bindings'
      Control = CategoryCB
      Track = True
      FillDataSource = CategoryBindSourceDB
      FillValueFieldName = 'Id'
      FillDisplayFieldName = 'Title'
      AutoFill = True
      FillExpressions = <>
      FillHeaderExpressions = <>
      FillBreakGroups = <>
    end
    object LinkFillControlToField3: TLinkFillControlToField
      Category = 'Quick Bindings'
      Control = GroupCB
      Track = True
      FillDataSource = GroupBindSourceDB
      FillValueFieldName = 'Id'
      FillDisplayFieldName = 'Title'
      AutoFill = True
      FillExpressions = <>
      FillHeaderExpressions = <>
      FillBreakGroups = <>
    end
  end
  object ProductsBindSourceDB: TBindSourceDB
    DataSet = DM.ProductsMemTable
    ScopeMappings = <>
    Left = 608
    Top = 224
  end
  object CategoryBindSourceDB: TBindSourceDB
    DataSet = DM.CategoryMemTable
    ScopeMappings = <>
    Left = 736
    Top = 224
  end
  object GroupBindSourceDB: TBindSourceDB
    DataSet = DM.GroupMemTable
    ScopeMappings = <>
    Left = 680
    Top = 264
  end
end
