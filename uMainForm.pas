unit uMainForm;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ComCtrls, Vcl.WinXCtrls,
  Vcl.VirtualImage, System.ImageList, Vcl.ImgList, Vcl.VirtualImageList,
  Vcl.BaseImageCollection, Vcl.ImageCollection, Vcl.ExtCtrls, Vcl.StdCtrls,
  Vcl.Imaging.pngimage, uProductsFrame, uReportsFrame, uLoginFrame, uUsersFrame,
  uRegisterFrame, uUpdateProduct, Vcl.TitleBarCtrls;

type
  TMainForm = class(TForm)
    PageControl: TPageControl;
    LoginTab: TTabSheet;
    UsersTab: TTabSheet;
    HeaderPanel: TPanel;
    ImageCollection1: TImageCollection;
    VirtualImageList1: TVirtualImageList;
    MenuVirtualImage: TVirtualImage;
    SplitView: TSplitView;
    NavPanel: TPanel;
    Image5: TImage;
    LoginButton: TButton;
    RegisterButton: TButton;
    ProductsButton: TButton;
    ReportsButton: TButton;
    UsersButton: TButton;
    Label1: TLabel;
    ProductsTab: TTabSheet;
    ReportsTab: TTabSheet;
    ProductsFrame1: TProductsFrame;
    RegisterTab: TTabSheet;
    UpdateProductTab: TTabSheet;
    FullScreenVirtualImage: TVirtualImage;
    LoginFrame1: TLoginFrame;
    ReportsFrame1: TReportsFrame;
    UpdateProductFrame1: TUpdateProductFrame;
    VCLFrameThemeCB: TComboBox;
    VCLBodyThemeCB: TComboBox;
    UsersFrame1: TUsersFrame;
    RegisterFrame1: TRegisterFrame;
    procedure MenuVirtualImageClick(Sender: TObject);
    procedure FullScreenVirtualImageClick(Sender: TObject);
    procedure LoginButtonClick(Sender: TObject);
    procedure RegisterButtonClick(Sender: TObject);
    procedure ProductsButtonClick(Sender: TObject);
    procedure ReportsButtonClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure VCLFrameThemeCBChange(Sender: TObject);
    procedure VCLFrameThemeCBKeyPress(Sender: TObject; var Key: Char);
    procedure UsersButtonClick(Sender: TObject);
    procedure PageControlChange(Sender: TObject);
    procedure VCLBodyThemeCBChange(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure LoginSuccess;
    procedure LoginFail(AStatus: Integer; const AMessage: String);
    procedure LogoutComplete;
    procedure MessageDialog(const AMessage: String);
    procedure SearchProducts;
    procedure UpdateProduct;
    procedure Reports;
    procedure Users;
    procedure ToggleMenu;
    procedure Logout;
  end;

var
  MainForm: TMainForm;

implementation

{$R *.dfm}

uses
  System.UITypes, Vcl.Themes, uDM;

procedure TMainForm.MessageDialog(const AMessage: String);
begin
  ShowMessage(AMessage);
end;

procedure TMainForm.PageControlChange(Sender: TObject);
begin
  case PageControl.ActivePageIndex of
    0: LoginButton.SetFocus;
    1: RegisterButton.SetFocus;
    2: ProductsButton.SetFocus;
    3: ReportsButton.SetFocus;
    4: UsersButton.SetFocus;
  end;
end;

procedure TMainForm.ProductsButtonClick(Sender: TObject);
begin
  SearchProducts;
end;

procedure TMainForm.RegisterButtonClick(Sender: TObject);
begin
  PageControl.ActivePage := RegisterTab;
  RegisterFrame1.CodeEdit.SetFocus;
end;

procedure TMainForm.ReportsButtonClick(Sender: TObject);
begin
  Reports;
end;

procedure TMainForm.MenuVirtualImageClick(Sender: TObject);
begin
  if DM.FCurrentUser<>'' then
    ToggleMenu;
end;

procedure TMainForm.LoginSuccess;
begin
  RegisterFrame1.CashierLabel.Caption := Format(C_CASHIER_LABEL,[DM.FCurrentUser]);
  PageControl.ActivePage := RegisterTab;
  if DM.CheckPermissions(C_MANAGER_ACCESS) then
    ToggleMenu;
  RegisterFrame1.CodeEdit.SetFocus;
end;

procedure TMainForm.FormCreate(Sender: TObject);
begin
  for var StyleName in TStyleManager.StyleNames do
    if (StyleName<>'Windows') AND (StyleName<>'Windows10') then
      VCLFrameThemeCB.Items.Add(StyleName);

  VCLFrameThemeCB.ItemIndex := VCLFrameThemeCB.Items.IndexOf(VCLFrameThemeCB.StyleName);

  VCLBodyThemeCB.Items.AddStrings(VCLFrameThemeCB.Items);
  VCLBodyThemeCB.ItemIndex := VCLBodyThemeCB.Items.IndexOf(TStyleManager.ActiveStyle.Name);

  DM.InitializeDatabase;

  RegisterFrame1.Initialize;
  UsersFrame1.Initialize;
  UpdateProductFrame1.Initialize;
  ReportsFrame1.Initialize;
  ProductsFrame1.Initialize;

  LoginTab.TabVisible := False;
  RegisterTab.TabVisible := False;
  ProductsTab.TabVisible := False;
  ReportsTab.TabVisible := False;
  UsersTab.TabVisible := False;
  UpdateProductTab.TabVisible := False;

  PageControl.ActivePage := LoginTab;
end;

procedure TMainForm.FullScreenVirtualImageClick(Sender: TObject);
begin
  case Self.Tag of
   0: begin
        Self.BorderStyle := bsNone;
        Self.WindowState := wsMaximized;
        Self.Tag := 1;
      end;
   1: begin
        Self.BorderStyle := bsSizeable;
        Self.WindowState := wsNormal;
        Self.Tag := 0;
      end;
  end;
end;

procedure TMainForm.Logout;
begin
  if MessageDlg(C_LOGOUT_DIALOG, mtConfirmation, [mbYes, mbNo], 0, mbYes) = mrYes then
  begin
    RegisterFrame1.ResetSale;
    DM.Logout;
    LogoutComplete;
  end;
end;

procedure TMainForm.LoginButtonClick(Sender: TObject);
begin
  Logout;
end;

procedure TMainForm.LoginFail(AStatus: Integer; const AMessage: String);
begin
  MessageDialog(AMessage);
end;

procedure TMainForm.LogoutComplete;
begin
  RegisterFrame1.CashierLabel.Caption := C_CASHIER_LABEL;
  PageControl.ActivePage := LoginTab;
  SplitView.Opened := False;
end;

procedure TMainForm.SearchProducts;
begin
  PageControl.ActivePage := ProductsTab;
end;

procedure TMainForm.Reports;
begin
  if DM.CheckPermissions(C_MANAGER_ACCESS) then
    PageControl.ActivePage := ReportsTab
  else
    MessageDialog(C_ACCESS_DENIED);
end;

procedure TMainForm.Users;
begin
  if DM.CheckPermissions(C_MANAGER_ACCESS) then
    PageControl.ActivePage := UsersTab
  else
    MessageDialog(C_ACCESS_DENIED);
end;

procedure TMainForm.ToggleMenu;
begin
  SplitView.Opened := not SplitView.Opened;
end;

procedure TMainForm.UsersButtonClick(Sender: TObject);
begin
  Users;
end;

procedure TMainForm.VCLBodyThemeCBChange(Sender: TObject);
begin
  TStyleManager.TrySetStyle(VCLBodyThemeCB.Text)
end;

procedure TMainForm.VCLFrameThemeCBChange(Sender: TObject);
begin
  SplitView.StyleName := VCLFrameThemeCB.Text;
  HeaderPanel.StyleName := VCLFrameThemeCB.Text;
  NavPanel.StyleName := VCLFrameThemeCB.Text;
  LoginButton.StyleName := VCLFrameThemeCB.Text;
  ProductsButton.StyleName := VCLFrameThemeCB.Text;
  RegisterButton.StyleName := VCLFrameThemeCB.Text;
  ReportsButton.StyleName := VCLFrameThemeCB.Text;
  UsersButton.StyleName := VCLFrameThemeCB.Text;
  VCLFrameThemeCB.StyleName := VCLFrameThemeCB.Text;
  VCLBodyThemeCB.StyleName := VCLFrameThemeCB.Text;
end;

procedure TMainForm.VCLFrameThemeCBKeyPress(Sender: TObject; var Key: Char);
begin
  Key := #0;
end;

procedure TMainForm.UpdateProduct;
begin
  PageControl.ActivePage := UpdateProductTab;
end;


end.
