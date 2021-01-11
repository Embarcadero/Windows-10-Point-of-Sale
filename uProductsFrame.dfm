object ProductsFrame: TProductsFrame
  Left = 0
  Top = 0
  Width = 882
  Height = 627
  TabOrder = 0
  object BindNavigator5: TBindNavigator
    AlignWithMargins = True
    Left = 25
    Top = 602
    Width = 832
    Height = 25
    Margins.Left = 25
    Margins.Right = 25
    Margins.Bottom = 0
    Align = alBottom
    Orientation = orHorizontal
    TabOrder = 0
  end
  object Panel8: TPanel
    AlignWithMargins = True
    Left = 25
    Top = 3
    Width = 854
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
      Width = 133
      Height = 57
      Margins.Top = 5
      Margins.Bottom = 5
      Align = alLeft
      Caption = 'Products'
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
      ImageIndex = 0
      ImageName = 'baseline_list_white'
      ExplicitLeft = -3
    end
    object ProductsRelativePanel: TRelativePanel
      Left = 244
      Top = 0
      Width = 610
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
          Control = EditButton
          AlignBottomWithPanel = False
          AlignHorizontalCenterWithPanel = False
          AlignLeftWithPanel = False
          AlignRightWithPanel = False
          AlignTopWithPanel = False
          AlignVerticalCenterWithPanel = True
          LeftOf = DeleteButton
        end
        item
          Control = AddButton
          AlignBottomWithPanel = False
          AlignHorizontalCenterWithPanel = False
          AlignLeftWithPanel = False
          AlignRightWithPanel = False
          AlignTopWithPanel = False
          AlignVerticalCenterWithPanel = True
          LeftOf = EditButton
        end>
      Align = alClient
      BevelOuter = bvNone
      FullRepaint = False
      TabOrder = 0
      OnResize = ProductsRelativePanelResize
      DesignSize = (
        610
        67)
      object SearchBox: TSearchBox
        AlignWithMargins = True
        Left = 424
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
        Left = 300
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
      object EditButton: TSpeedButton
        Left = 179
        Top = 14
        Width = 121
        Height = 38
        Hint = 'Edit'
        Anchors = []
        Caption = 'Edit'
        ImageIndex = 12
        ImageName = 'baseline_launch_white'
        Images = DM.IconVirtualImageList
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        OnClick = EditButtonClick
      end
      object AddButton: TSpeedButton
        Left = 58
        Top = 14
        Width = 121
        Height = 38
        Hint = 'Add'
        Anchors = []
        Caption = 'Add'
        ImageIndex = 3
        ImageName = 'baseline_add_white'
        Images = DM.IconVirtualImageList
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        OnClick = AddButtonClick
      end
    end
  end
  object AllStringGrid: TStringGrid
    Tag = 5
    AlignWithMargins = True
    Left = 25
    Top = 100
    Width = 832
    Height = 496
    Margins.Left = 25
    Margins.Right = 25
    Align = alClient
    BorderStyle = bsNone
    DoubleBuffered = True
    FixedCols = 0
    Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goColSizing, goRowSelect]
    ParentDoubleBuffered = False
    TabOrder = 2
    ColWidths = (
      64
      448
      124
      124
      64)
    ColAligments = (
      1
      0
      0
      0
      1)
  end
  object PageControl: TPageControl
    AlignWithMargins = True
    Left = 25
    Top = 76
    Width = 832
    Height = 21
    Margins.Left = 25
    Margins.Right = 25
    Margins.Bottom = 0
    ActivePage = ProductsTab
    Align = alTop
    TabOrder = 3
    OnChange = PageControlChange
    object ProductsTab: TTabSheet
      Caption = 'Products'
    end
    object CategoriesTab: TTabSheet
      Caption = 'Categories'
      ImageIndex = 1
    end
    object BrandsTab: TTabSheet
      Caption = 'Brands'
      ImageIndex = 2
    end
    object GroupsTab: TTabSheet
      Caption = 'Groups'
      ImageIndex = 3
    end
    object VATab: TTabSheet
      Caption = 'Variant Attributes'
      ImageIndex = 4
    end
    object UnitsTab: TTabSheet
      Caption = 'Units'
      ImageIndex = 5
    end
  end
  object ProductsBindSourceDB: TBindSourceDB
    DataSet = DM.ProductsMemTable
    ScopeMappings = <>
    Left = 344
    Top = 312
  end
  object BindingsList1: TBindingsList
    Methods = <>
    OutputConverters = <>
    Left = 20
    Top = 5
    object LinkGridToDataSourceBindSourceDB: TLinkGridToDataSource
      Category = 'Quick Bindings'
      DataSource = ProductsBindSourceDB
      GridControl = AllStringGrid
      Columns = <
        item
          MemberName = 'Id'
        end
        item
          MemberName = 'Description'
          TextWidth = 74
        end
        item
          MemberName = 'Barcode'
          TextWidth = 20
        end
        item
          MemberName = 'Stockcode'
          TextWidth = 20
        end
        item
          MemberName = 'Price'
        end>
    end
  end
  object CategoryBindSourceDB: TBindSourceDB
    DataSet = DM.CategoryMemTable
    ScopeMappings = <>
    Left = 400
    Top = 216
  end
  object BrandBindSourceDB: TBindSourceDB
    DataSet = DM.BrandMemTable
    ScopeMappings = <>
    Left = 480
    Top = 208
  end
  object GroupBindSourceDB: TBindSourceDB
    DataSet = DM.GroupMemTable
    ScopeMappings = <>
    Left = 552
    Top = 232
  end
  object MiscBindSourceDB: TBindSourceDB
    DataSet = DM.MiscMemTable
    ScopeMappings = <>
    Left = 592
    Top = 304
  end
  object UnitsBindSourceDB: TBindSourceDB
    DataSet = DM.UnitsMemTable
    ScopeMappings = <>
    Left = 664
    Top = 312
  end
end
