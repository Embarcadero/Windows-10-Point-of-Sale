object ReceiptForm: TReceiptForm
  Left = 0
  Top = 0
  Caption = 'Receipt Preview'
  ClientHeight = 558
  ClientWidth = 328
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  PixelsPerInch = 96
  TextHeight = 13
  object WebBrowser: TWebBrowser
    AlignWithMargins = True
    Left = 3
    Top = 3
    Width = 322
    Height = 511
    Align = alClient
    TabOrder = 0
    ExplicitLeft = -506
    ExplicitWidth = 834
    ExplicitHeight = 584
    ControlData = {
      4C000000325600005C3C00000000000000000000000000000000000000000000
      000000004C000000000000000000000001000000E0D057007335CF11AE690800
      2B2E126208000000000000004C0000000114020000000000C000000000000046
      8000000000000000000000000000000000000000000000000000000000000000
      00000000000000000100000000000000000000000000000000000000}
  end
  object NavPanel: TPanel
    Left = 0
    Top = 517
    Width = 328
    Height = 41
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 1
    ExplicitLeft = -512
    ExplicitTop = 590
    ExplicitWidth = 840
    object CloseButton: TButton
      AlignWithMargins = True
      Left = 192
      Top = 3
      Width = 133
      Height = 35
      Align = alRight
      Cancel = True
      Caption = 'Close'
      TabOrder = 0
      OnClick = CloseButtonClick
      ExplicitLeft = 704
    end
  end
end
