unit uUsersFrame;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.Bind.Controls,
  Vcl.Buttons, Vcl.Bind.Navigator, Vcl.Grids, Vcl.StdCtrls, Vcl.WinXCtrls,
  Vcl.VirtualImage, Vcl.ExtCtrls, Data.Bind.Components, Data.Bind.DBScope,
  Data.Bind.EngExt, Vcl.Bind.DBEngExt, Vcl.Bind.Grid, System.Rtti,
  System.Bindings.Outputs, Vcl.Bind.Editors, Data.Bind.Grid;

type
  TUsersFrame = class(TFrame)
    Panel8: TPanel;
    Label25: TLabel;
    VirtualImage7: TVirtualImage;
    UsersRelativePanel: TRelativePanel;
    SearchBox: TSearchBox;
    CreateUserButton: TSpeedButton;
    RemoveUserButton: TSpeedButton;
    UsersSG: TStringGrid;
    BindNavigator5: TBindNavigator;
    UsersBindSourceDB: TBindSourceDB;
    BindingsList1: TBindingsList;
    LinkGridToDataSourceUsersBindSourceDB: TLinkGridToDataSource;
    ResetButton: TSpeedButton;
    procedure SearchBoxInvokeSearch(Sender: TObject);
    procedure RemoveUserButtonClick(Sender: TObject);
    procedure CreateUserButtonClick(Sender: TObject);
    procedure UsersRelativePanelResize(Sender: TObject);
    procedure ResetButtonClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure Initialize;
  end;

implementation

{$R *.dfm}

uses
  uDM, uMainForm;

procedure TUsersFrame.Initialize;
begin
  UsersBindSourceDB.DataSet := DM.UsersFDTable;
end;

procedure TUsersFrame.CreateUserButtonClick(Sender: TObject);
var
  LUsername, LPassword, LMessage: String;
begin
  LUsername := InputBox(C_NEW_RECORD_TITLE, C_NEW_USERNAME_DESC, '');
  if LUsername<>'' then
  begin
    LPassword := InputBox(C_NEW_RECORD_TITLE, C_NEW_PASSWORD_DESC, '');
    if LPassword<>'' then
    begin
      LMessage := DM.CreateUser(LUsername, LPassword);
      if LMessage<>'' then
        MainForm.MessageDialog(LMessage);
    end;
  end;
end;

procedure TUsersFrame.RemoveUserButtonClick(Sender: TObject);
begin
  UsersBindSourceDB.DataSet.Delete;
end;

procedure TUsersFrame.ResetButtonClick(Sender: TObject);
var
  LPassword: String;
begin
  LPassword := InputBox(C_RESET_PASS_TITLE, C_RESET_PASS_DESC, '');
  if LPassword<>'' then
  begin
    DM.ResetPassword(UsersBindSourceDB.DataSet.FieldByName('Name').AsWideString, LPassword);
  end;
end;

procedure TUsersFrame.SearchBoxInvokeSearch(Sender: TObject);
begin
  UsersBindSourceDB.DataSet.Filtered := False;
  UsersBindSourceDB.DataSet.Filter := 'Name LIKE ''%'+SearchBox.Text+'%''';
  UsersBindSourceDB.DataSet.Filtered := True;
end;

procedure TUsersFrame.UsersRelativePanelResize(Sender: TObject);
begin
  if UsersRelativePanel.Width<=520 then
  begin
    ResetButton.Caption := '';
    ResetButton.Width := 40;
    CreateUserButton.Caption := '';
    CreateUserButton.Width := 40;
    RemoveUserButton.Caption := '';
    RemoveUserButton.Width := 40;
  end
  else
  begin
    ResetButton.Caption := ResetButton.Hint;
    ResetButton.Width := 121;
    CreateUserButton.Caption := CreateUserButton.Hint;
    CreateUserButton.Width := 121;
    RemoveUserButton.Caption := RemoveUserButton.Hint;
    RemoveUserButton.Width := 121;
  end;
end;

end.
