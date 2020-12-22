object LoginFrame: TLoginFrame
  Left = 0
  Top = 0
  Width = 559
  Height = 495
  TabOrder = 0
  object RelativePanel1: TRelativePanel
    Left = 0
    Top = 0
    Width = 559
    Height = 217
    ControlCollection = <
      item
        Control = VirtualImage1
        AlignBottomWithPanel = False
        AlignHorizontalCenterWithPanel = True
        AlignLeftWithPanel = False
        AlignRightWithPanel = False
        AlignTopWithPanel = False
        AlignVerticalCenterWithPanel = True
      end>
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 0
    DesignSize = (
      559
      217)
    object VirtualImage1: TVirtualImage
      Left = 210
      Top = 97
      Width = 139
      Height = 23
      Anchors = []
      ImageCollection = DM.EMBTImageCollection
      ImageWidth = 0
      ImageHeight = 0
      ImageIndex = 1
      ImageName = 'EMBTWhite'
    end
  end
  object RelativePanel2: TRelativePanel
    Left = 0
    Top = 217
    Width = 559
    Height = 278
    ControlCollection = <
      item
        Control = StackPanel1
        AlignBottomWithPanel = False
        AlignHorizontalCenterWithPanel = True
        AlignLeftWithPanel = False
        AlignRightWithPanel = False
        AlignTopWithPanel = False
        AlignVerticalCenterWithPanel = True
      end>
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 1
    DesignSize = (
      559
      278)
    object StackPanel1: TStackPanel
      Left = 139
      Top = 39
      Width = 280
      Anchors = []
      BevelOuter = bvNone
      ControlCollection = <
        item
          Control = Label1
          HorizontalPositioning = sphpFill
        end
        item
          Control = UserEdit
          HorizontalPositioning = sphpFill
        end
        item
          Control = Label2
          HorizontalPositioning = sphpFill
        end
        item
          Control = PassEdit
          HorizontalPositioning = sphpFill
        end
        item
          Control = Label3
          HorizontalPositioning = sphpRight
        end
        item
          Control = Panel1
        end
        item
          Control = LoginButton
          HorizontalPositioning = sphpFill
        end>
      TabOrder = 0
      DesignSize = (
        280
        200)
      object Label1: TLabel
        Left = 0
        Top = 0
        Width = 280
        Height = 13
        Caption = 'Username:'
      end
      object UserEdit: TEdit
        Left = 0
        Top = 15
        Width = 280
        Height = 21
        TabOrder = 0
        TextHint = 'Username'
      end
      object Label2: TLabel
        Left = 0
        Top = 38
        Width = 280
        Height = 13
        Caption = 'Password:'
      end
      object PassEdit: TEdit
        Left = 0
        Top = 53
        Width = 280
        Height = 21
        PasswordChar = '.'
        TabOrder = 1
        TextHint = 'Password'
      end
      object Label3: TLabel
        Left = 194
        Top = 76
        Width = 86
        Height = 13
        Caption = 'Forgot password?'
      end
      object Panel1: TPanel
        Left = 0
        Top = 91
        Width = 185
        Height = 41
        BevelOuter = bvNone
        TabOrder = 2
      end
      object LoginButton: TSpeedButton
        Left = 0
        Top = 134
        Width = 280
        Height = 38
        Hint = 'Login'
        Anchors = []
        Caption = 'Login'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        OnClick = LoginButtonClick
      end
    end
  end
end
