unit uReportsFrame;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Grids, Vcl.Buttons,
  Vcl.StdCtrls, Vcl.WinXCtrls, Vcl.VirtualImage, Vcl.ExtCtrls,
  Data.Bind.Components, Data.Bind.DBScope, Data.Bind.Controls, Data.Bind.EngExt,
  Vcl.Bind.DBEngExt, Vcl.Bind.Grid, System.Rtti, System.Bindings.Outputs,
  Vcl.Bind.Editors, Data.Bind.Grid, Vcl.Bind.Navigator, Vcl.WinXPickers;

type
  TReportsFrame = class(TFrame)
    ReportCSSMemo: TMemo;
    Panel8: TPanel;
    Label25: TLabel;
    VirtualImage7: TVirtualImage;
    UsersRelativePanel: TRelativePanel;
    SearchBox: TSearchBox;
    DeleteButton: TSpeedButton;
    ReportsSG: TStringGrid;
    ReportsBindSourceDB: TBindSourceDB;
    ViewButton: TSpeedButton;
    BindNavigator5: TBindNavigator;
    BindingsList1: TBindingsList;
    LinkGridToDataSourceReportsBindSourceDB: TLinkGridToDataSource;
    FlowPanel1: TFlowPanel;
    Panel1: TPanel;
    Label1: TLabel;
    FromDatePicker: TDatePicker;
    Panel2: TPanel;
    Label2: TLabel;
    ToDatePicker: TDatePicker;
    ProductPanel: TPanel;
    Label3: TLabel;
    ProductCB: TComboBox;
    CategoryPanel: TPanel;
    Label4: TLabel;
    CategoryCB: TComboBox;
    GroupPanel: TPanel;
    Label5: TLabel;
    GroupCB: TComboBox;
    ProductsBindSourceDB: TBindSourceDB;
    CategoryBindSourceDB: TBindSourceDB;
    GroupBindSourceDB: TBindSourceDB;
    LinkFillControlToField1: TLinkFillControlToField;
    LinkFillControlToField2: TLinkFillControlToField;
    LinkFillControlToField3: TLinkFillControlToField;
    CreateButton: TSpeedButton;
    TypeCB: TComboBox;
    Panel6: TPanel;
    Label6: TLabel;
    procedure SearchBoxInvokeSearch(Sender: TObject);
    procedure ViewButtonClick(Sender: TObject);
    procedure CreateButtonClick(Sender: TObject);
    procedure UsersRelativePanelResize(Sender: TObject);
    procedure DeleteButtonClick(Sender: TObject);
    procedure TypeCBChange(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure Initialize;
  end;

implementation

{$R *.dfm}

uses
  uDM, uReportForm;

procedure TReportsFrame.DeleteButtonClick(Sender: TObject);
begin
  if ReportsBindSourceDB.DataSet.RecordCount>0 then
    ReportsBindSourceDB.DataSet.Delete;
end;

procedure TReportsFrame.Initialize;
begin
  ReportsBindSourceDB.DataSet := DM.ReportsFDTable;
  ProductsBindSourceDB.DataSet := DM.ProductsFDTable;
  CategoryBindSourceDB.DataSet := DM.CategoryFDTable;
  GroupBindSourceDB.DataSet := DM.GroupFDTable;

  FromDatePicker.Date := Date-7;
  ToDatePicker.Date := Date+1;
end;

procedure TReportsFrame.CreateButtonClick(Sender: TObject);
begin
  DM.CreateReport(TypeCB.Items[TypeCB.ItemIndex], FromDatePicker.Date, ToDatePicker.Date, ProductCB.Text, CategoryCB.Text, GroupCB.Text, ReportCSSMemo.Lines.Text);
  ViewButtonClick(Sender);
end;

procedure TReportsFrame.SearchBoxInvokeSearch(Sender: TObject);
begin
  ReportsBindSourceDB.DataSet.Filtered := False;
  ReportsBindSourceDB.DataSet.Filter := 'UserId LIKE '''+SearchBox.Text+'%''';
  ReportsBindSourceDB.DataSet.Filtered := True;
end;

procedure TReportsFrame.TypeCBChange(Sender: TObject);
begin
  case TypeCB.ItemIndex of
    0: begin
         ProductPanel.Visible := True;
         CategoryPanel.Visible := True;
         GroupPanel.Visible := True;
       end;
    1: begin
         ProductPanel.Visible := False;
         CategoryPanel.Visible := False;
         GroupPanel.Visible := False;
       end;
  end;
end;

procedure TReportsFrame.UsersRelativePanelResize(Sender: TObject);
begin
  if UsersRelativePanel.Width<=400 then
  begin
    ViewButton.Caption := '';
    ViewButton.Width := 40;
    DeleteButton.Caption := '';
    DeleteButton.Width := 40;
  end
  else
  begin
    ViewButton.Caption := ViewButton.Hint;
    ViewButton.Width := 121;
    DeleteButton.Caption := DeleteButton.Hint;
    DeleteButton.Width := 121;
  end;
end;

procedure TReportsFrame.ViewButtonClick(Sender: TObject);
begin
  if ReportsBindSourceDB.DataSet.Active then
  begin
    if ReportsBindSourceDB.DataSet.RecordCount>0 then
    begin
      ReportForm.LoadReport(ReportsBindSourceDB.DataSet.FieldByName('ReportData').AsWideString);
      ReportForm.ShowModal;
    end;
  end;
end;

end.
