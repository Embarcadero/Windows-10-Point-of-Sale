unit uUpdateProduct;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls,
  Vcl.ComCtrls, Vcl.Buttons, Vcl.WinXCtrls, Vcl.VirtualImage, Vcl.ExtCtrls,
  Data.Bind.EngExt, Vcl.Bind.DBEngExt, System.Rtti, System.Bindings.Outputs,
  Vcl.Bind.Editors, Data.Bind.Components, Data.Bind.DBScope, Vcl.Imaging.jpeg;

type
  TUpdateProductFrame = class(TFrame)
    Panel8: TPanel;
    Label25: TLabel;
    VirtualImage7: TVirtualImage;
    UpdateRelativePanel: TRelativePanel;
    CancelButton: TSpeedButton;
    SaveButton: TSpeedButton;
    ScrollBox1: TScrollBox;
    Panel1: TPanel;
    Label1: TLabel;
    IdEdit: TEdit;
    Panel2: TPanel;
    Label2: TLabel;
    BarcodeEdit: TEdit;
    Panel3: TPanel;
    Label3: TLabel;
    StockCodeEdit: TEdit;
    Panel4: TPanel;
    Label4: TLabel;
    DescEdit: TEdit;
    Panel5: TPanel;
    Label5: TLabel;
    Panel6: TPanel;
    Label6: TLabel;
    Panel7: TPanel;
    Label7: TLabel;
    Panel9: TPanel;
    Label8: TLabel;
    CategoryCB: TComboBox;
    UnitsCB: TComboBox;
    BrandCB: TComboBox;
    GroupCB: TComboBox;
    Panel10: TPanel;
    Label9: TLabel;
    PriceEdit: TEdit;
    Panel11: TPanel;
    Label10: TLabel;
    Misc1Edit: TEdit;
    Panel12: TPanel;
    Label11: TLabel;
    Misc2Edit: TEdit;
    Panel13: TPanel;
    Label12: TLabel;
    Misc3Edit: TEdit;
    MiscBindSourceDB: TBindSourceDB;
    BindingsList1: TBindingsList;
    LinkPropertyToFieldCaption: TLinkPropertyToField;
    LinkPropertyToFieldCaption2: TLinkPropertyToField;
    LinkPropertyToFieldCaption3: TLinkPropertyToField;
    Panel14: TPanel;
    Label13: TLabel;
    StatusCB: TComboBox;
    StatusBindSourceDB: TBindSourceDB;
    LinkFillControlToField1: TLinkFillControlToField;
    GroupBindSourceDB: TBindSourceDB;
    LinkFillControlToField2: TLinkFillControlToField;
    BrandBindSourceDB: TBindSourceDB;
    LinkFillControlToField3: TLinkFillControlToField;
    UnitsBindSourceDB: TBindSourceDB;
    LinkFillControlToField4: TLinkFillControlToField;
    CategoryBindSourceDB: TBindSourceDB;
    LinkFillControlToField5: TLinkFillControlToField;
    ProductsBindSourceDB: TBindSourceDB;
    LinkControlToField1: TLinkControlToField;
    LinkControlToField2: TLinkControlToField;
    LinkControlToField3: TLinkControlToField;
    LinkControlToField4: TLinkControlToField;
    LinkControlToField5: TLinkControlToField;
    Panel15: TPanel;
    ItemImage: TImage;
    OpenDialog: TOpenDialog;
    LinkControlToField6: TLinkControlToField;
    Label14: TLabel;
    LinkControlToField7: TLinkControlToField;
    LinkControlToField8: TLinkControlToField;
    LinkControlToField9: TLinkControlToField;
    BGVirtualImage: TVirtualImage;
    Panel16: TPanel;
    procedure SaveButtonClick(Sender: TObject);
    procedure CancelButtonClick(Sender: TObject);
    procedure ItemImageClick(Sender: TObject);
    procedure UpdateRelativePanelResize(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure Initialize;
  end;

implementation

{$R *.dfm}

uses
  uMainForm, uDM;

procedure TUpdateProductFrame.Initialize;
begin
  MiscBindSourceDB.DataSet := DM.MiscFDTable;
  StatusBindSourceDB.DataSet := DM.StatusFDTable;
  GroupBindSourceDB.DataSet := DM.GroupFDTable;
  BrandBindSourceDB.DataSet := DM.BrandFDTable;
  UnitsBindSourceDB.DataSet := DM.UnitsFDTable;
  CategoryBindSourceDB.DataSet := DM.CategoryFDTable;
  ProductsBindSourceDB.DataSet := DM.ProductsFDTable;
end;

procedure TUpdateProductFrame.CancelButtonClick(Sender: TObject);
begin
  ProductsBindSourceDB.DataSet.Cancel;
  MainForm.SearchProducts;
end;

procedure TUpdateProductFrame.SaveButtonClick(Sender: TObject);
begin
  ProductsBindSourceDB.DataSet.Post;
  MainForm.SearchProducts;
end;

procedure TUpdateProductFrame.ItemImageClick(Sender: TObject);
begin
  if OpenDialog.Execute then
  begin
   ItemImage.Picture.LoadFromFile(OpenDialog.FileName);
   TLinkObservers.ControlChanged(ItemImage);
  end;
end;

procedure TUpdateProductFrame.UpdateRelativePanelResize(Sender: TObject);
begin
  if UpdateRelativePanel.Width<=436 then
  begin
    SaveButton.Caption := '';
    SaveButton.Width := 40;
    CancelButton.Caption := '';
    CancelButton.Width := 40;
  end
  else
  begin
    SaveButton.Caption := SaveButton.Hint;
    SaveButton.Width := 121;
    CancelButton.Caption := CancelButton.Hint;
    CancelButton.Width := 121;
  end;
end;

end.
