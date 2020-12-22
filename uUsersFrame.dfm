object UsersFrame: TUsersFrame
  Left = 0
  Top = 0
  Width = 826
  Height = 534
  TabOrder = 0
  object Panel8: TPanel
    AlignWithMargins = True
    Left = 25
    Top = 3
    Width = 798
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
      Width = 81
      Height = 57
      Margins.Top = 5
      Margins.Bottom = 5
      Align = alLeft
      Caption = 'Users'
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
      ImageIndex = 2
      ImageName = 'baseline_account_box_white'
      ExplicitLeft = -3
    end
    object UsersRelativePanel: TRelativePanel
      Left = 192
      Top = 0
      Width = 606
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
          Control = CreateUserButton
          AlignBottomWithPanel = False
          AlignHorizontalCenterWithPanel = False
          AlignLeftWithPanel = False
          AlignRightWithPanel = False
          AlignTopWithPanel = False
          AlignVerticalCenterWithPanel = True
          LeftOf = RemoveUserButton
        end
        item
          Control = RemoveUserButton
          AlignBottomWithPanel = False
          AlignHorizontalCenterWithPanel = False
          AlignLeftWithPanel = False
          AlignRightWithPanel = False
          AlignTopWithPanel = False
          AlignVerticalCenterWithPanel = True
          LeftOf = SearchBox
        end
        item
          Control = ResetButton
          AlignBottomWithPanel = False
          AlignHorizontalCenterWithPanel = False
          AlignLeftWithPanel = False
          AlignRightWithPanel = False
          AlignTopWithPanel = False
          AlignVerticalCenterWithPanel = True
          LeftOf = CreateUserButton
        end>
      Align = alClient
      BevelOuter = bvNone
      FullRepaint = False
      TabOrder = 0
      OnResize = UsersRelativePanelResize
      DesignSize = (
        606
        67)
      object SearchBox: TSearchBox
        AlignWithMargins = True
        Left = 420
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
      object CreateUserButton: TSpeedButton
        Left = 175
        Top = 14
        Width = 121
        Height = 38
        Hint = 'Create'
        Anchors = []
        Caption = 'Create'
        ImageIndex = 3
        ImageName = 'baseline_add_white'
        Images = DM.IconVirtualImageList
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        OnClick = CreateUserButtonClick
      end
      object RemoveUserButton: TSpeedButton
        Left = 296
        Top = 14
        Width = 121
        Height = 38
        Hint = 'Remove'
        Anchors = []
        Caption = 'Remove'
        ImageIndex = 13
        ImageName = 'baseline_remove_white'
        Images = DM.IconVirtualImageList
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        OnClick = RemoveUserButtonClick
      end
      object ResetButton: TSpeedButton
        Left = 54
        Top = 14
        Width = 121
        Height = 38
        Hint = 'Reset Password'
        Anchors = []
        Caption = 'Reset Password'
        ImageIndex = 12
        ImageName = 'baseline_launch_white'
        Images = DM.IconVirtualImageList
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        OnClick = ResetButtonClick
      end
    end
  end
  object UsersSG: TStringGrid
    Tag = 4
    AlignWithMargins = True
    Left = 25
    Top = 76
    Width = 776
    Height = 424
    Margins.Left = 25
    Margins.Right = 25
    Align = alClient
    BorderStyle = bsNone
    ColCount = 4
    DoubleBuffered = True
    FixedCols = 0
    RowCount = 2
    Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goColSizing, goEditing]
    ParentDoubleBuffered = False
    ScrollBars = ssVertical
    TabOrder = 1
    ColWidths = (
      64
      475
      76
      64)
    ColAligments = (
      1
      0
      1
      1)
  end
  object BindNavigator5: TBindNavigator
    AlignWithMargins = True
    Left = 25
    Top = 506
    Width = 776
    Height = 25
    Margins.Left = 25
    Margins.Right = 25
    DataSource = UsersBindSourceDB
    Align = alBottom
    Orientation = orHorizontal
    TabOrder = 2
  end
  object UsersBindSourceDB: TBindSourceDB
    DataSet = DM.UsersMemTable
    ScopeMappings = <>
    Left = 544
    Top = 320
  end
  object BindingsList1: TBindingsList
    Methods = <>
    OutputConverters = <>
    Left = 20
    Top = 5
    object LinkGridToDataSourceUsersBindSourceDB: TLinkGridToDataSource
      Category = 'Quick Bindings'
      DataSource = UsersBindSourceDB
      GridControl = UsersSG
      Columns = <
        item
          MemberName = 'Id'
          ReadOnly = True
        end
        item
          MemberName = 'Name'
          ReadOnly = True
          Width = 475
        end
        item
          MemberName = 'Permissions'
          TextWidth = 12
        end
        item
          MemberName = 'Status'
        end>
    end
  end
end
