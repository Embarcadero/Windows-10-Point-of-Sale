object UpdateProductFrame: TUpdateProductFrame
  Left = 0
  Top = 0
  Width = 860
  Height = 653
  TabOrder = 0
  object Panel8: TPanel
    AlignWithMargins = True
    Left = 25
    Top = 3
    Width = 832
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
      Width = 237
      Height = 57
      Margins.Top = 5
      Margins.Bottom = 5
      Align = alLeft
      Caption = 'Update Product'
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
      ImageWidth = 0
      ImageHeight = 0
      ImageIndex = 0
      ImageName = 'baseline_list_white'
      ExplicitLeft = -3
    end
    object UpdateRelativePanel: TRelativePanel
      Left = 348
      Top = 0
      Width = 484
      Height = 67
      ControlCollection = <
        item
          Control = CancelButton
          AlignBottomWithPanel = False
          AlignHorizontalCenterWithPanel = False
          AlignLeftWithPanel = False
          AlignRightWithPanel = True
          AlignTopWithPanel = False
          AlignVerticalCenterWithPanel = True
        end
        item
          Control = SaveButton
          AlignBottomWithPanel = False
          AlignHorizontalCenterWithPanel = False
          AlignLeftWithPanel = False
          AlignRightWithPanel = False
          AlignTopWithPanel = False
          AlignVerticalCenterWithPanel = True
          LeftOf = CancelButton
        end>
      Align = alClient
      BevelOuter = bvNone
      FullRepaint = False
      TabOrder = 0
      OnResize = UpdateRelativePanelResize
      DesignSize = (
        484
        67)
      object CancelButton: TSpeedButton
        Left = 363
        Top = 14
        Width = 121
        Height = 38
        Hint = 'Cancel'
        Anchors = []
        Caption = 'Cancel'
        ImageIndex = 3
        ImageName = 'baseline_add_white'
        Images = DM.IconVirtualImageList
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        OnClick = CancelButtonClick
      end
      object SaveButton: TSpeedButton
        Left = 242
        Top = 14
        Width = 121
        Height = 38
        Hint = 'Save'
        Anchors = []
        Caption = 'Save'
        ImageIndex = 3
        ImageName = 'baseline_add_white'
        Images = DM.IconVirtualImageList
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        OnClick = SaveButtonClick
      end
    end
  end
  object ScrollBox1: TScrollBox
    AlignWithMargins = True
    Left = 25
    Top = 76
    Width = 548
    Height = 574
    Margins.Left = 25
    Align = alClient
    BorderStyle = bsNone
    TabOrder = 1
    object Panel1: TPanel
      AlignWithMargins = True
      Left = 3
      Top = 3
      Width = 542
      Height = 30
      Align = alTop
      BevelOuter = bvNone
      TabOrder = 0
      object Label1: TLabel
        AlignWithMargins = True
        Left = 3
        Top = 3
        Width = 99
        Height = 24
        Align = alLeft
        AutoSize = False
        Caption = 'Product Id:'
        Layout = tlCenter
        ExplicitHeight = 35
      end
      object IdEdit: TEdit
        AlignWithMargins = True
        Left = 108
        Top = 3
        Width = 431
        Height = 24
        Align = alClient
        ReadOnly = True
        TabOrder = 0
        Text = '1'
        ExplicitHeight = 21
      end
    end
    object Panel2: TPanel
      AlignWithMargins = True
      Left = 3
      Top = 39
      Width = 542
      Height = 30
      Align = alTop
      BevelOuter = bvNone
      TabOrder = 1
      object Label2: TLabel
        AlignWithMargins = True
        Left = 3
        Top = 3
        Width = 99
        Height = 24
        Align = alLeft
        AutoSize = False
        Caption = 'Barcode:'
        Layout = tlCenter
      end
      object BarcodeEdit: TEdit
        AlignWithMargins = True
        Left = 108
        Top = 3
        Width = 431
        Height = 24
        Align = alClient
        TabOrder = 0
        Text = 'BC99001'
        ExplicitHeight = 21
      end
    end
    object Panel3: TPanel
      AlignWithMargins = True
      Left = 3
      Top = 75
      Width = 542
      Height = 30
      Align = alTop
      BevelOuter = bvNone
      TabOrder = 2
      object Label3: TLabel
        AlignWithMargins = True
        Left = 3
        Top = 3
        Width = 99
        Height = 24
        Align = alLeft
        AutoSize = False
        Caption = 'Stock Code:'
        Layout = tlCenter
        ExplicitTop = 6
      end
      object StockCodeEdit: TEdit
        AlignWithMargins = True
        Left = 108
        Top = 3
        Width = 431
        Height = 24
        Align = alClient
        TabOrder = 0
        Text = '0001'
        ExplicitHeight = 21
      end
    end
    object Panel4: TPanel
      AlignWithMargins = True
      Left = 3
      Top = 111
      Width = 542
      Height = 30
      Align = alTop
      BevelOuter = bvNone
      TabOrder = 3
      object Label4: TLabel
        AlignWithMargins = True
        Left = 3
        Top = 3
        Width = 99
        Height = 24
        Align = alLeft
        AutoSize = False
        Caption = 'Description:'
        Layout = tlCenter
      end
      object DescEdit: TEdit
        AlignWithMargins = True
        Left = 108
        Top = 3
        Width = 431
        Height = 24
        Align = alClient
        TabOrder = 0
        Text = 'Milk'
        ExplicitHeight = 21
      end
    end
    object Panel5: TPanel
      AlignWithMargins = True
      Left = 3
      Top = 183
      Width = 542
      Height = 30
      Align = alTop
      BevelOuter = bvNone
      TabOrder = 4
      object Label5: TLabel
        AlignWithMargins = True
        Left = 3
        Top = 3
        Width = 99
        Height = 24
        Align = alLeft
        AutoSize = False
        Caption = 'Category:'
        Layout = tlCenter
      end
      object CategoryCB: TComboBox
        AlignWithMargins = True
        Left = 108
        Top = 3
        Width = 431
        Height = 21
        Align = alClient
        ItemIndex = 4
        TabOrder = 0
        Text = 'Dairy'
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
    object Panel6: TPanel
      AlignWithMargins = True
      Left = 3
      Top = 219
      Width = 542
      Height = 30
      Align = alTop
      BevelOuter = bvNone
      TabOrder = 5
      object Label6: TLabel
        AlignWithMargins = True
        Left = 3
        Top = 3
        Width = 99
        Height = 24
        Align = alLeft
        AutoSize = False
        Caption = 'Units:'
        Layout = tlCenter
      end
      object UnitsCB: TComboBox
        AlignWithMargins = True
        Left = 108
        Top = 3
        Width = 431
        Height = 21
        Align = alClient
        ItemIndex = 0
        TabOrder = 0
        Text = 'pcs'
        Items.Strings = (
          'pcs'
          'stems')
      end
    end
    object Panel7: TPanel
      AlignWithMargins = True
      Left = 3
      Top = 255
      Width = 542
      Height = 30
      Align = alTop
      BevelOuter = bvNone
      TabOrder = 6
      object Label7: TLabel
        AlignWithMargins = True
        Left = 3
        Top = 3
        Width = 99
        Height = 24
        Align = alLeft
        AutoSize = False
        Caption = 'Brand:'
        Layout = tlCenter
      end
      object BrandCB: TComboBox
        AlignWithMargins = True
        Left = 108
        Top = 3
        Width = 431
        Height = 21
        Align = alClient
        TabOrder = 0
        Text = 'ComboBox1'
      end
    end
    object Panel9: TPanel
      AlignWithMargins = True
      Left = 3
      Top = 291
      Width = 542
      Height = 30
      Align = alTop
      BevelOuter = bvNone
      TabOrder = 7
      object Label8: TLabel
        AlignWithMargins = True
        Left = 3
        Top = 3
        Width = 99
        Height = 24
        Align = alLeft
        AutoSize = False
        Caption = 'Group:'
        Layout = tlCenter
      end
      object GroupCB: TComboBox
        AlignWithMargins = True
        Left = 108
        Top = 3
        Width = 431
        Height = 21
        Align = alClient
        TabOrder = 0
        Text = 'ComboBox1'
      end
    end
    object Panel10: TPanel
      AlignWithMargins = True
      Left = 3
      Top = 147
      Width = 542
      Height = 30
      Align = alTop
      BevelOuter = bvNone
      TabOrder = 8
      object Label9: TLabel
        AlignWithMargins = True
        Left = 3
        Top = 3
        Width = 99
        Height = 24
        Align = alLeft
        AutoSize = False
        Caption = 'Price:'
        Layout = tlCenter
      end
      object PriceEdit: TEdit
        AlignWithMargins = True
        Left = 108
        Top = 3
        Width = 431
        Height = 24
        Align = alClient
        NumbersOnly = True
        TabOrder = 0
        Text = '1.99'
        ExplicitHeight = 21
      end
    end
    object Panel11: TPanel
      AlignWithMargins = True
      Left = 3
      Top = 327
      Width = 542
      Height = 30
      Align = alTop
      BevelOuter = bvNone
      TabOrder = 9
      object Label10: TLabel
        AlignWithMargins = True
        Left = 3
        Top = 3
        Width = 99
        Height = 24
        Align = alLeft
        AutoSize = False
        Caption = 'Size:'
        Layout = tlCenter
      end
      object Misc1Edit: TEdit
        AlignWithMargins = True
        Left = 108
        Top = 3
        Width = 431
        Height = 24
        Align = alClient
        NumbersOnly = True
        TabOrder = 0
        ExplicitHeight = 21
      end
    end
    object Panel12: TPanel
      AlignWithMargins = True
      Left = 3
      Top = 363
      Width = 542
      Height = 30
      Align = alTop
      BevelOuter = bvNone
      TabOrder = 10
      object Label11: TLabel
        AlignWithMargins = True
        Left = 3
        Top = 3
        Width = 99
        Height = 24
        Align = alLeft
        AutoSize = False
        Caption = 'Color:'
        Layout = tlCenter
      end
      object Misc2Edit: TEdit
        AlignWithMargins = True
        Left = 108
        Top = 3
        Width = 431
        Height = 24
        Align = alClient
        NumbersOnly = True
        TabOrder = 0
        ExplicitHeight = 21
      end
    end
    object Panel13: TPanel
      AlignWithMargins = True
      Left = 3
      Top = 399
      Width = 542
      Height = 30
      Align = alTop
      BevelOuter = bvNone
      TabOrder = 11
      object Label12: TLabel
        AlignWithMargins = True
        Left = 3
        Top = 3
        Width = 99
        Height = 24
        Align = alLeft
        AutoSize = False
        Caption = ':'
        Layout = tlCenter
      end
      object Misc3Edit: TEdit
        AlignWithMargins = True
        Left = 108
        Top = 3
        Width = 431
        Height = 24
        Align = alClient
        NumbersOnly = True
        TabOrder = 0
        ExplicitHeight = 21
      end
    end
    object Panel14: TPanel
      AlignWithMargins = True
      Left = 3
      Top = 435
      Width = 542
      Height = 30
      Align = alTop
      BevelOuter = bvNone
      TabOrder = 12
      object Label13: TLabel
        AlignWithMargins = True
        Left = 3
        Top = 3
        Width = 99
        Height = 24
        Align = alLeft
        AutoSize = False
        Caption = 'Status:'
        Layout = tlCenter
      end
      object StatusCB: TComboBox
        AlignWithMargins = True
        Left = 108
        Top = 3
        Width = 431
        Height = 21
        Align = alClient
        ItemIndex = 1
        TabOrder = 0
        Text = 'Enabled'
        Items.Strings = (
          'Disabled'
          'Enabled')
      end
    end
  end
  object Panel15: TPanel
    Left = 576
    Top = 73
    Width = 284
    Height = 580
    Align = alRight
    BevelOuter = bvNone
    TabOrder = 2
    object Label14: TLabel
      Left = 0
      Top = 278
      Width = 284
      Height = 13
      Align = alTop
      Alignment = taCenter
      Caption = 'Click above to load image.'
      ExplicitWidth = 125
    end
    object Panel16: TPanel
      Left = 0
      Top = 0
      Width = 284
      Height = 278
      Align = alTop
      BevelOuter = bvNone
      TabOrder = 0
      object BGVirtualImage: TVirtualImage
        AlignWithMargins = True
        Left = 3
        Top = 3
        Width = 278
        Height = 272
        Align = alClient
        ImageCollection = DM.IconImageCollection
        ImageWidth = 0
        ImageHeight = 0
        ImageIndex = 4
        ImageName = 'baseline_attachment_white'
        ExplicitLeft = 112
        ExplicitTop = 136
        ExplicitWidth = 105
        ExplicitHeight = 105
      end
      object ItemImage: TImage
        AlignWithMargins = True
        Left = 3
        Top = 3
        Width = 278
        Height = 272
        Align = alClient
        Picture.Data = {07544269746D617000000000}
        Proportional = True
        OnClick = ItemImageClick
        ExplicitTop = 0
        ExplicitHeight = 278
      end
    end
  end
  object MiscBindSourceDB: TBindSourceDB
    DataSet = DM.MiscMemTable
    ScopeMappings = <>
    Left = 72
    Top = 568
  end
  object BindingsList1: TBindingsList
    Methods = <>
    OutputConverters = <>
    Left = 20
    Top = 5
    object LinkPropertyToFieldCaption: TLinkPropertyToField
      Category = 'Quick Bindings'
      DataSource = MiscBindSourceDB
      FieldName = 'Misc1'
      Component = Label10
      CustomFormat = '%s+":"'
      ComponentProperty = 'Caption'
    end
    object LinkPropertyToFieldCaption2: TLinkPropertyToField
      Category = 'Quick Bindings'
      DataSource = MiscBindSourceDB
      FieldName = 'Misc2'
      Component = Label11
      CustomFormat = '%s+":"'
      ComponentProperty = 'Caption'
    end
    object LinkPropertyToFieldCaption3: TLinkPropertyToField
      Category = 'Quick Bindings'
      DataSource = MiscBindSourceDB
      FieldName = 'Misc3'
      Component = Label12
      CustomFormat = '%s+":"'
      ComponentProperty = 'Caption'
    end
    object LinkFillControlToField1: TLinkFillControlToField
      Category = 'Quick Bindings'
      DataSource = ProductsBindSourceDB
      FieldName = 'Status'
      Control = StatusCB
      Track = True
      FillDataSource = StatusBindSourceDB
      FillValueFieldName = 'Id'
      FillDisplayFieldName = 'Title'
      AutoFill = True
      FillExpressions = <>
      FillHeaderExpressions = <>
      FillBreakGroups = <>
    end
    object LinkFillControlToField2: TLinkFillControlToField
      Category = 'Quick Bindings'
      DataSource = ProductsBindSourceDB
      FieldName = 'Group'
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
    object LinkFillControlToField3: TLinkFillControlToField
      Category = 'Quick Bindings'
      DataSource = ProductsBindSourceDB
      FieldName = 'Brand'
      Control = BrandCB
      Track = True
      FillDataSource = BrandBindSourceDB
      FillValueFieldName = 'Id'
      FillDisplayFieldName = 'Title'
      AutoFill = True
      FillExpressions = <>
      FillHeaderExpressions = <>
      FillBreakGroups = <>
    end
    object LinkFillControlToField4: TLinkFillControlToField
      Category = 'Quick Bindings'
      DataSource = ProductsBindSourceDB
      FieldName = 'Units'
      Control = UnitsCB
      Track = True
      FillDataSource = UnitsBindSourceDB
      FillValueFieldName = 'Id'
      FillDisplayFieldName = 'Title'
      AutoFill = True
      FillExpressions = <>
      FillHeaderExpressions = <>
      FillBreakGroups = <>
    end
    object LinkFillControlToField5: TLinkFillControlToField
      Category = 'Quick Bindings'
      DataSource = ProductsBindSourceDB
      FieldName = 'Category'
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
    object LinkControlToField1: TLinkControlToField
      Category = 'Quick Bindings'
      DataSource = ProductsBindSourceDB
      FieldName = 'Id'
      Control = IdEdit
      Track = True
    end
    object LinkControlToField2: TLinkControlToField
      Category = 'Quick Bindings'
      DataSource = ProductsBindSourceDB
      FieldName = 'Barcode'
      Control = BarcodeEdit
      Track = True
    end
    object LinkControlToField3: TLinkControlToField
      Category = 'Quick Bindings'
      DataSource = ProductsBindSourceDB
      FieldName = 'Stockcode'
      Control = StockCodeEdit
      Track = True
    end
    object LinkControlToField4: TLinkControlToField
      Category = 'Quick Bindings'
      DataSource = ProductsBindSourceDB
      FieldName = 'Description'
      Control = DescEdit
      Track = True
    end
    object LinkControlToField5: TLinkControlToField
      Category = 'Quick Bindings'
      DataSource = ProductsBindSourceDB
      FieldName = 'Price'
      Control = PriceEdit
      Track = True
    end
    object LinkControlToField6: TLinkControlToField
      Category = 'Quick Bindings'
      DataSource = ProductsBindSourceDB
      FieldName = 'Image'
      Control = ItemImage
      Track = False
    end
    object LinkControlToField7: TLinkControlToField
      Category = 'Quick Bindings'
      DataSource = ProductsBindSourceDB
      FieldName = 'Misc1'
      Control = Misc1Edit
      Track = True
    end
    object LinkControlToField8: TLinkControlToField
      Category = 'Quick Bindings'
      DataSource = ProductsBindSourceDB
      FieldName = 'Misc2'
      Control = Misc2Edit
      Track = True
    end
    object LinkControlToField9: TLinkControlToField
      Category = 'Quick Bindings'
      DataSource = ProductsBindSourceDB
      FieldName = 'Misc3'
      Control = Misc3Edit
      Track = True
    end
  end
  object StatusBindSourceDB: TBindSourceDB
    ScopeMappings = <>
    Left = 304
    Top = 568
  end
  object GroupBindSourceDB: TBindSourceDB
    DataSet = DM.GroupMemTable
    ScopeMappings = <>
    Left = 400
    Top = 560
  end
  object BrandBindSourceDB: TBindSourceDB
    DataSet = DM.BrandMemTable
    ScopeMappings = <>
    Left = 480
    Top = 560
  end
  object UnitsBindSourceDB: TBindSourceDB
    DataSet = DM.UnitsMemTable
    ScopeMappings = <>
    Left = 592
    Top = 560
  end
  object CategoryBindSourceDB: TBindSourceDB
    DataSet = DM.CategoryMemTable
    ScopeMappings = <>
    Left = 720
    Top = 560
  end
  object ProductsBindSourceDB: TBindSourceDB
    DataSet = DM.ProductsMemTable
    ScopeMappings = <>
    Left = 416
    Top = 312
  end
  object OpenDialog: TOpenDialog
    Filter = 'Images (*.jpg, *.png)|*.jpg|*.png'
    Left = 704
    Top = 369
  end
end
