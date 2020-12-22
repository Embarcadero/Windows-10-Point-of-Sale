unit uCustomerForm;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.Bind.EngExt, Vcl.Bind.DBEngExt,
  Vcl.Bind.Grid, System.Rtti, System.Bindings.Outputs, Vcl.Bind.Editors,
  Data.Bind.Components, Data.Bind.Grid, Data.Bind.DBScope, Vcl.Grids,
  Vcl.StdCtrls, Vcl.ExtCtrls;

type
  TCustomerForm = class(TForm)
    NavPanel: TPanel;
    CloseButton: TButton;
    CustomersSG: TStringGrid;
    CustomersBindSourceDB: TBindSourceDB;
    BindingsList1: TBindingsList;
    LinkGridToDataSourceCustomersBindSourceDB: TLinkGridToDataSource;
    procedure CloseButtonClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  CustomerForm: TCustomerForm;

implementation

{$R *.dfm}

uses
  uDM;

procedure TCustomerForm.CloseButtonClick(Sender: TObject);
begin
  Close;
end;

procedure TCustomerForm.FormCreate(Sender: TObject);
begin
  CustomersBindSourceDB.DataSet := DM.CustomersFDTable;
end;

end.
