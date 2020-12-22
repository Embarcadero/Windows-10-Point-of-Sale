unit uLoginFrame;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Buttons, Vcl.ExtCtrls,
  Vcl.StdCtrls, Vcl.WinXPanels, Vcl.WinXCtrls, Vcl.VirtualImage;

type
  TLoginFrame = class(TFrame)
    VirtualImage1: TVirtualImage;
    RelativePanel1: TRelativePanel;
    RelativePanel2: TRelativePanel;
    StackPanel1: TStackPanel;
    Label1: TLabel;
    UserEdit: TEdit;
    Label2: TLabel;
    PassEdit: TEdit;
    Label3: TLabel;
    Panel1: TPanel;
    LoginButton: TSpeedButton;
    procedure LoginButtonClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

{$R *.dfm}

uses
  uMainForm, uDM;

procedure TLoginFrame.LoginButtonClick(Sender: TObject);
var
  LResult: Integer;
begin
  LResult := DM.Login(UserEdit.Text, PassEdit.Text);
  case LResult of
    -1: begin
          PassEdit.Text := '';
          MainForm.LoginFail(LResult, C_BAD_PASSWORD);
        end;
    -2: MainForm.LoginFail(LResult, C_NO_ACCESS);
    else
    MainForm.LoginSuccess;
  end;
end;

end.
