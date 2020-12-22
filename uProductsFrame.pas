unit uProductsFrame;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.Bind.Controls,
  Vcl.ComCtrls, Vcl.Grids, Vcl.Buttons, Vcl.StdCtrls, Vcl.WinXCtrls,
  Vcl.VirtualImage, Vcl.ExtCtrls, Vcl.Bind.Navigator, Data.Bind.EngExt,
  Vcl.Bind.DBEngExt, Vcl.Bind.Grid, System.Rtti, System.Bindings.Outputs,
  Vcl.Bind.Editors, Data.Bind.Components, Data.Bind.Grid, Data.Bind.DBScope;

type
  TProductsFrame = class(TFrame)
    BindNavigator5: TBindNavigator;
    Panel8: TPanel;
    Label25: TLabel;
    VirtualImage7: TVirtualImage;
    ProductsRelativePanel: TRelativePanel;
    SearchBox: TSearchBox;
    DeleteButton: TSpeedButton;
    EditButton: TSpeedButton;
    AllStringGrid: TStringGrid;
    AddButton: TSpeedButton;
    PageControl: TPageControl;
    ProductsTab: TTabSheet;
    CategoriesTab: TTabSheet;
    BrandsTab: TTabSheet;
    GroupsTab: TTabSheet;
    VATab: TTabSheet;
    UnitsTab: TTabSheet;
    ProductsBindSourceDB: TBindSourceDB;
    BindingsList1: TBindingsList;
    LinkGridToDataSourceBindSourceDB: TLinkGridToDataSource;
    CategoryBindSourceDB: TBindSourceDB;
    BrandBindSourceDB: TBindSourceDB;
    GroupBindSourceDB: TBindSourceDB;
    MiscBindSourceDB: TBindSourceDB;
    UnitsBindSourceDB: TBindSourceDB;
    procedure PageControlChange(Sender: TObject);
    procedure SearchBoxInvokeSearch(Sender: TObject);
    procedure AddButtonClick(Sender: TObject);
    procedure EditButtonClick(Sender: TObject);
    procedure DeleteButtonClick(Sender: TObject);
    procedure ProductsRelativePanelResize(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure Initialize;
  end;

implementation

{$R *.dfm}

uses
  Data.DB, uMainForm, uDM;

procedure TProductsFrame.Initialize;
begin
  ProductsBindSourceDB.DataSet := DM.ProductsFDTable;
  CategoryBindSourceDB.DataSet := DM.CategoryFDTable;
  BrandBindSourceDB.DataSet := DM.BrandFDTable;
  GroupBindSourceDB.DataSet := DM.GroupFDTable;
  MiscBindSourceDB.DataSet := DM.MiscFDTable;
  UnitsBindSourceDB.DataSet := DM.UnitsFDTable;
end;

procedure TProductsFrame.AddButtonClick(Sender: TObject);
var
  LNewValue: String;
begin

  case PageControl.ActivePageIndex of
    0: begin
        ProductsBindSourceDB.DataSet.Append;
        MainForm.UpdateProduct;
       end;
    4: begin
         // do nothing
       end;
    else
      begin
        LNewValue := InputBox(C_NEW_RECORD_TITLE, C_NEW_RECORD_DESC, '');
        if LNewValue<>'' then
          TBindSourceDB(LinkGridToDataSourceBindSourceDB.DataSource).DataSet.AppendRecord([nil,LNewValue]);
      end;
  end;

end;

procedure TProductsFrame.DeleteButtonClick(Sender: TObject);
begin
  TBindSourceDB(LinkGridToDataSourceBindSourceDB.DataSource).DataSet.Delete;
end;

procedure TProductsFrame.EditButtonClick(Sender: TObject);
begin
  DM.EditProduct(ProductsBindSourceDB.DataSet);
  MainForm.UpdateProduct;
end;

procedure TProductsFrame.PageControlChange(Sender: TObject);
begin
  case PageControl.ActivePageIndex of
    0: LinkGridToDataSourceBindSourceDB.DataSource := ProductsBindSourceDB;
    1: LinkGridToDataSourceBindSourceDB.DataSource := CategoryBindSourceDB;
    2: LinkGridToDataSourceBindSourceDB.DataSource := BrandBindSourceDB;
    3: LinkGridToDataSourceBindSourceDB.DataSource := GroupBindSourceDB;
    4: LinkGridToDataSourceBindSourceDB.DataSource := MiscBindSourceDB;
    5: LinkGridToDataSourceBindSourceDB.DataSource := UnitsBindSourceDB;
  end;
end;

procedure TProductsFrame.SearchBoxInvokeSearch(Sender: TObject);
begin
  TBindSourceDB(LinkGridToDataSourceBindSourceDB.DataSource).DataSet.Filtered := False;
  TBindSourceDB(LinkGridToDataSourceBindSourceDB.DataSource).DataSet.FilterOptions := [TFilterOption.foCaseInsensitive];
  TBindSourceDB(LinkGridToDataSourceBindSourceDB.DataSource).DataSet.Filter := 'Description LIKE ''%'+SearchBox.Text+'%''';
  TBindSourceDB(LinkGridToDataSourceBindSourceDB.DataSource).DataSet.Filtered := True;
end;

procedure TProductsFrame.ProductsRelativePanelResize(Sender: TObject);
begin
  if ProductsRelativePanel.Width<=520 then
  begin
    AddButton.Caption := '';
    AddButton.Width := 40;
    EditButton.Caption := '';
    EditButton.Width := 40;
    DeleteButton.Caption := '';
    DeleteButton.Width := 40;
  end
  else
  begin
    AddButton.Caption := AddButton.Hint;
    AddButton.Width := 121;
    EditButton.Caption := EditButton.Hint;
    EditButton.Width := 121;
    DeleteButton.Caption := DeleteButton.Hint;
    DeleteButton.Width := 121;
  end;
end;

end.
