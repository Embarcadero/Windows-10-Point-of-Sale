unit uRegisterFrame;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Buttons, Vcl.StdCtrls,
  Vcl.ExtCtrls, Vcl.Grids, Vcl.WinXPanels, Vcl.WinXCtrls, Vcl.VirtualImage,
  Data.Bind.EngExt, Vcl.Bind.DBEngExt, Vcl.Bind.Grid, System.Rtti,
  System.Bindings.Outputs, Vcl.Bind.Editors, Data.Bind.Components,
  Data.Bind.Grid, Data.Bind.DBScope, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TRegisterFrame = class(TFrame)
    Panel8: TPanel;
    Label25: TLabel;
    VirtualImage7: TVirtualImage;
    UsersRelativePanel: TRelativePanel;
    ItemsStringGrid: TStringGrid;
    GridPanel1: TGridPanel;
    Panel1: TPanel;
    Panel2: TPanel;
    Label1: TLabel;
    CodeEdit: TEdit;
    GridPanel2: TGridPanel;
    Panel3: TPanel;
    EnterButton: TSpeedButton;
    RemoveItemButton: TSpeedButton;
    QuantityButton: TSpeedButton;
    DecQuantityButton: TSpeedButton;
    IncQuantityButton: TSpeedButton;
    TaxLabel: TLabel;
    Panel4: TPanel;
    TotalLabel: TLabel;
    Panel5: TPanel;
    Label4: TLabel;
    SaleTotalLabel: TLabel;
    PriceModeButton: TSpeedButton;
    SpeedButton12: TSpeedButton;
    SpeedButton13: TSpeedButton;
    SpeedButton14: TSpeedButton;
    LogoutButton: TSpeedButton;
    Num1Button: TSpeedButton;
    Num2Button: TSpeedButton;
    Num3Button: TSpeedButton;
    Num4Button: TSpeedButton;
    Num5Button: TSpeedButton;
    Num6Button: TSpeedButton;
    Num7Button: TSpeedButton;
    Num8Button: TSpeedButton;
    Num9Button: TSpeedButton;
    ClearButton: TSpeedButton;
    Num0Button: TSpeedButton;
    BackButton: TSpeedButton;
    Panel6: TPanel;
    CashierLabel: TLabel;
    PriceModeLabel: TLabel;
    CustomerLabel: TLabel;
    CurrentSaleBindSourceDB: TBindSourceDB;
    BindingsList1: TBindingsList;
    LinkGridToDataSourceBindSourceDB1: TLinkGridToDataSource;
    ProductsBindSourceDB: TBindSourceDB;
    SaleLogBindSourceDB: TBindSourceDB;
    Panel7: TPanel;
    DiscountButton: TSpeedButton;
    PayButton: TSpeedButton;
    PriceChangeButton: TSpeedButton;
    SearchButton: TSpeedButton;
    SuspendSaleButton: TSpeedButton;
    VoidSaleButton: TSpeedButton;
    LastReceiptMemo: TMemo;
    CustomersBindSourceDB: TBindSourceDB;
    LinkPropertyToFieldCaption: TLinkPropertyToField;
    CustomerPanel: TPanel;
    Label2: TLabel;
    procedure Num1ButtonClick(Sender: TObject);
    procedure ClearButtonClick(Sender: TObject);
    procedure EnterButtonClick(Sender: TObject);
    procedure QuantityButtonClick(Sender: TObject);
    procedure DecQuantityButtonClick(Sender: TObject);
    procedure IncQuantityButtonClick(Sender: TObject);
    procedure RemoveItemButtonClick(Sender: TObject);
    procedure PayButtonClick(Sender: TObject);
    procedure VoidSaleButtonClick(Sender: TObject);
    procedure SuspendSaleButtonClick(Sender: TObject);
    procedure PriceChangeButtonClick(Sender: TObject);
    procedure DiscountButtonClick(Sender: TObject);
    procedure SearchButtonClick(Sender: TObject);
    procedure SpeedButton13Click(Sender: TObject);
    procedure PriceModeButtonClick(Sender: TObject);
    procedure SpeedButton14Click(Sender: TObject);
    procedure LogoutButtonClick(Sender: TObject);
    procedure SpeedButton12Click(Sender: TObject);
    procedure BackButtonClick(Sender: TObject);
  private
    { Private declarations }
    procedure UpdateTotals(ANewTotal: Currency);
  public
    { Public declarations }
    procedure Initialize;
    procedure ResetSale;
  end;

implementation

{$R *.dfm}

uses
  uMainForm, uReceiptForm, uCustomerForm, uDM, System.Math;

procedure TRegisterFrame.Initialize;
begin
  ProductsBindSourceDB.DataSet := DM.ProductsFDTable;
  SaleLogBindSourceDB.DataSet := DM.SaleLogFDTable;
  CustomersBindSourceDB.DataSet := DM.CustomersFDTable;
end;

procedure TRegisterFrame.BackButtonClick(Sender: TObject);
begin
  CodeEdit.Text := String(CodeEdit.Text).SubString(0, String(CodeEdit.Text).Length-1);
end;

procedure TRegisterFrame.ClearButtonClick(Sender: TObject);
begin
  CodeEdit.Text := '';
end;

procedure TRegisterFrame.EnterButtonClick(Sender: TObject);
var
  LMessage: String;
begin
  LMessage := DM.AddStockCode(CodeEdit.Text, CurrentSaleBindSourceDB.DataSet, ProductsBindSourceDB.DataSet);
  if LMessage<>'' then
    MainForm.MessageDialog(LMessage);
  CodeEdit.Text := '';
  UpdateTotals(DM.GetCurrentTotal(CurrentSaleBindSourceDB.DataSet));
end;

procedure TRegisterFrame.Num1ButtonClick(Sender: TObject);
begin
 CodeEdit.Text := CodeEdit.Text + TSpeedButton(Sender).Hint;
end;

procedure TRegisterFrame.ResetSale;
begin
  DM.ClearCurrentSale(CurrentSaleBindSourceDB.DataSet);
  UpdateTotals(0.00);
end;

procedure TRegisterFrame.PriceChangeButtonClick(Sender: TObject);
var
  LNewPriceStr: String;
  LNewPrice: Currency;
begin
  if CurrentSaleBindSourceDB.DataSet.Active then
  begin
    LNewPriceStr := InputBox(C_UPDATE_PRICE_TITLE, C_UPDATE_PRICE_DESC, CurrentSaleBindSourceDB.DataSet.FieldByName('Price').AsString);
    if LNewPriceStr<>'' then
      try
        LNewPrice := StrToCurr(LNewPriceStr);
        if LNewPrice <> CurrentSaleBindSourceDB.DataSet.FieldByName('Price').AsCurrency then
        begin
          DM.UpdateCurrentItemPrice(LNewPrice, CurrentSaleBindSourceDB.DataSet);
          UpdateTotals(DM.GetCurrentTotal(CurrentSaleBindSourceDB.DataSet));
        end;
      except
        on E: Exception do
        begin
          MainForm.MessageDialog(E.Message);
        end;
      end;
  end
  else
    MainForm.MessageDialog(C_DATASET_INACTIVE);

end;

procedure TRegisterFrame.DiscountButtonClick(Sender: TObject);
var
  LDiscountCode: String;
begin
  if CurrentSaleBindSourceDB.DataSet.Active then
  begin
    LDiscountCode := InputBox(C_DISCOUNT_TITLE, C_DISCOUNT_DESC, C_DISCOUNT_DEFAULT_CODE);
    DM.AddStockCode(LDiscountCode, CurrentSaleBindSourceDB.DataSet, ProductsBindSourceDB.DataSet);
    PriceChangeButtonClick(Sender);
  end
  else
    MainForm.MessageDialog(C_DATASET_INACTIVE);
end;

procedure TRegisterFrame.SearchButtonClick(Sender: TObject);
begin
  MainForm.SearchProducts;
end;

procedure TRegisterFrame.PriceModeButtonClick(Sender: TObject);
begin
  DM.FPriceMode := not DM.FPriceMode;
  if DM.FPriceMode=True then
  begin
    PriceModeLabel.Caption := C_PRICE_MODE + C_PRICE_MODE_SALE;
  end
  else
  begin
    PriceModeLabel.Caption := C_PRICE_MODE + C_PRICE_MODE_NORMAL;
  end;
end;

procedure TRegisterFrame.SpeedButton12Click(Sender: TObject);
begin
  CustomerForm.ShowModal;
end;

procedure TRegisterFrame.SpeedButton13Click(Sender: TObject);
begin
  if LastReceiptMemo.Lines.Text<>'' then
  begin
    ReceiptForm.LoadReceipt(LastReceiptMemo.Lines.Text);
    ReceiptForm.ShowModal;
  end;
end;

procedure TRegisterFrame.SpeedButton14Click(Sender: TObject);
begin
  MainForm.ToggleMenu;
end;

procedure TRegisterFrame.SuspendSaleButtonClick(Sender: TObject);
begin
  if DM.FSaleInMemory=True then
  begin
    ResetSale;
    DM.RecallToCurrentSale(CurrentSaleBindSourceDB.DataSet);
    UpdateTotals(DM.GetCurrentTotal(CurrentSaleBindSourceDB.DataSet));
    SuspendSaleButton.Caption := C_SUSPEND_SALE;
    DM.FSaleInMemory := False;
  end
  else
  begin
    DM.SuspendCurrentSale(CurrentSaleBindSourceDB.DataSet);
    ResetSale;
    SuspendSaleButton.Caption := C_RECALL_SALE;
    DM.FSaleInMemory := True;
  end;
end;

procedure TRegisterFrame.PayButtonClick(Sender: TObject);
var
  LPaymentAmountStr: String;
  LPaymentAmount: Currency;
  LReceiptList: TStringList;
  LSubTotal: Currency;
  LTaxTotal: Currency;
  LTotal: Currency;
  LChange: Currency;
begin
  LPaymentAmountStr := InputBox(C_PAYMENT_TITLE, C_PAYMENT_DESC, '');

  if LPaymentAmountStr <> '' then
  begin
    try
      LPaymentAmount := StrToCurr(LPaymentAmountStr);

      DM.SaveCurrentSale(CurrentSaleBindSourceDB.DataSet);

      LReceiptList := TStringList.Create;
      try
        LReceiptList.Text := DM.GenerateReceipt(LPaymentAmount, CustomersBindSourceDB.DataSet, CurrentSaleBindSourceDB.DataSet);
        LastReceiptMemo.Lines.Text := LReceiptList.Text;
        // print or save receipt
        ReceiptForm.LoadReceipt(LastReceiptMemo.Lines.Text);
        ReceiptForm.ShowModal;
      finally
        LReceiptList.Free;
      end;

      LSubTotal := DM.GetCurrentTotal(CurrentSaleBindSourceDB.DataSet);
      LTaxTotal := RoundTo(LSubTotal*C_DEFAULT_TAX_RATE, -2);
      LTotal := LSubTotal + LTaxTotal;
      LChange := LTotal - LPaymentAmount;

      MainForm.MessageDialog(C_CHANGE_MESSAGE + CurrToStr(LChange));

      ResetSale;
    except
      on E: Exception do
      begin
        MainForm.MessageDialog(E.Message);
      end;
    end;

  end


end;

procedure TRegisterFrame.UpdateTotals(ANewTotal: Currency);
var
  LTaxTotal: Currency;
  LTotal: Currency;
begin
  LTaxTotal := RoundTo(ANewTotal*C_DEFAULT_TAX_RATE, -2);
  LTotal := ANewTotal + LTaxTotal;
  TaxLabel.Caption := Format(C_TAX_LABEL, [LTaxTotal]);
  TotalLabel.Caption := Format(C_TOTAL_LABEL, [LTotal]);
  SaleTotalLabel.Caption := Format('%m', [LTotal]);
end;

procedure TRegisterFrame.VoidSaleButtonClick(Sender: TObject);
begin
  ResetSale;
  MainForm.MessageDialog(C_SALE_VOIDED);
end;

procedure TRegisterFrame.QuantityButtonClick(Sender: TObject);
var
  LNewQuantity: String;
begin
  if CurrentSaleBindSourceDB.DataSet.Active then
  begin
    LNewQuantity := InputBox(C_UPDATE_QUANTITY_TITLE, C_UPDATE_QUANTITY_DESC, CurrentSaleBindSourceDB.DataSet.FieldByName('Quantity').AsString);
    if LNewQuantity <> CurrentSaleBindSourceDB.DataSet.FieldByName('Quantity').AsString then
    begin
      DM.UpdateCurrentItemQuantity(LNewQuantity.ToInteger, CurrentSaleBindSourceDB.DataSet);
      UpdateTotals(DM.GetCurrentTotal(CurrentSaleBindSourceDB.DataSet));
    end;
  end
  else
    MainForm.MessageDialog(C_DATASET_INACTIVE);
end;

procedure TRegisterFrame.RemoveItemButtonClick(Sender: TObject);
begin
  DM.DeleteCurrentItem(CurrentSaleBindSourceDB.DataSet);
  UpdateTotals(DM.GetCurrentTotal(CurrentSaleBindSourceDB.DataSet));
end;

procedure TRegisterFrame.DecQuantityButtonClick(Sender: TObject);
begin
  DM.DecCurrentItemQuantity(CurrentSaleBindSourceDB.DataSet);
  UpdateTotals(DM.GetCurrentTotal(CurrentSaleBindSourceDB.DataSet));
end;

procedure TRegisterFrame.IncQuantityButtonClick(Sender: TObject);
begin
  DM.IncCurrentItemQuantity(CurrentSaleBindSourceDB.DataSet);
  UpdateTotals(DM.GetCurrentTotal(CurrentSaleBindSourceDB.DataSet));
end;

procedure TRegisterFrame.LogoutButtonClick(Sender: TObject);
begin
  MainForm.Logout;
end;

end.
