unit uDM;

interface

uses
  System.SysUtils, System.Classes, System.ImageList, Vcl.ImgList,
  Vcl.VirtualImageList, Vcl.BaseImageCollection, Vcl.ImageCollection,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client, FireDAC.Stan.StorageBin,
  FireDAC.Stan.StorageJSON, Data.Bind.Components, Data.Bind.DBScope,
  FireDAC.UI.Intf, FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Stan.Async,
  FireDAC.Phys, FireDAC.VCLUI.Wait, FireDAC.Stan.ExprFuncs,
  FireDAC.Phys.SQLiteWrapper.Stat, FireDAC.Phys.SQLiteDef, FireDAC.Phys.SQLite,
  FireDAC.DApt;

type
  TDM = class(TDataModule)
    IconImageCollection: TImageCollection;
    IconVirtualImageList: TVirtualImageList;
    EMBTVirtualImageList: TVirtualImageList;
    EMBTImageCollection: TImageCollection;
    UsersMemTable: TFDMemTable;
    ProductsMemTable: TFDMemTable;
    CategoryMemTable: TFDMemTable;
    UnitsMemTable: TFDMemTable;
    BrandMemTable: TFDMemTable;
    GroupMemTable: TFDMemTable;
    MiscMemTable: TFDMemTable;
    StatusMemTable: TFDMemTable;
    CurrentSaleMemTable: TFDMemTable;
    SaleLogMemTable: TFDMemTable;
    RecallSalesMemTable: TFDMemTable;
    CustomersMemTable: TFDMemTable;
    ReportsMemTable: TFDMemTable;
    ProductLogMemTable: TFDMemTable;
    FDStanStorageJSONLink1: TFDStanStorageJSONLink;
    RecallSalesBindSourceDB: TBindSourceDB;
    FDConnection1: TFDConnection;
    FDPhysSQLiteDriverLink1: TFDPhysSQLiteDriverLink;
    ProductsFDTable: TFDTable;
    CategoryFDTable: TFDTable;
    UnitsFDTable: TFDTable;
    BrandFDTable: TFDTable;
    GroupFDTable: TFDTable;
    MiscFDTable: TFDTable;
    UsersFDTable: TFDTable;
    StatusFDTable: TFDTable;
    SaleLogFDTable: TFDTable;
    ReportsFDTable: TFDTable;
    ProductLogFDTable: TFDTable;
    CustomersFDTable: TFDTable;
    RecallSalesFDTable: TFDTable;
    FDSQLiteSecurity1: TFDSQLiteSecurity;
    UsersBindSourceDB: TBindSourceDB;
    ProductsBindSourceDB: TBindSourceDB;
    ProductLogBindSourceDB: TBindSourceDB;
    SaleLogBindSourceDB: TBindSourceDB;
    ReportsBindSourceDB: TBindSourceDB;
    CustomersBindSourceDB: TBindSourceDB;
  private
    { Private declarations }
    procedure AddReportLine(const S: String; AStrings: TStrings);
    procedure AddReportHeaderLine(const S1, S2: String; AStrings: TStrings);
    procedure AddReportFooterLine(const S1: String; AStrings: TStrings);
    procedure AddReportSubHeader(const S1: String; Astrings: Tstrings);
    procedure AddReportSubHeaderInfo(const S1, S2, S3, S4: String; Astrings: Tstrings);
    procedure AddReportSection(ALineItemsDataSet: TDataSet; AStrings: TStrings);
    procedure AddReceiptSection(ALineItemsDataSet: TDataSet; AStrings: TStrings);
    procedure AddReceiptData(ALeft, AMid, ARight: String; AStrings: TStrings);
    procedure AddProductReportSection(ALineItemsDataSet: TDataSet; AStrings: TStrings);
    procedure AddSaleReportSection(ALineItemsDataSet: TDataSet; AStrings: TStrings);
    procedure AddProductReportData(const AName, AQuantity, APrice, ATotal: String; AStrings: TStrings);
    procedure AddSaleReportData(const ATimestamp, AUserId, ASubTotal, ATaxTotal, ATotal: String; AStrings: TStrings);
    function GenerateProductReport(const ACSSStyle: String; const ATotal: String; ADataSet, ALineItemsDataSet: TDataSet): String;
    function GenerateSaleReport(const ACSSStyle: String; const ATotal: String; ADataSet, ALineItemsDataSet: TDataSet): String;
  public
    { Public declarations }
    FPriceMode: Boolean;
    FSaleInMemory: Boolean;
    FCurrentUser: String;
    FCurrentUserId: Integer;
    FCurrentStatus: Integer;
    FCurrentPermissions: Integer;
    function CreateUser(const AUsername, APassword: String): String;
    function Login(const AUsername, APassword: String): Integer;
    function ResetPassword(const AUsername, APassword: String): String;
    procedure Logout;
    function AddCurrentProduct(ASaleDataSet, AProductDataSet: TDataSet): String;
    procedure EditProduct(AProductDataSet: TDataSet);
    function DeleteCurrentItem(ASaleDataSet: TDataSet): String;
    function UpdateCurrentItemQuantity(AQuantity: Integer; ASaleDataSet: TDataSet): String;
    function UpdateCurrentItemPrice(APrice: Currency; ASaleDataSet: TDataSet): String;
    function IncCurrentItemQuantity(ASaleDataSet: TDataSet): String;
    function DecCurrentItemQuantity(ASaleDataSet: TDataSet): String;
    function LogCurrentSale(ASaleDataSet, ALogDataSet: TDataSet): String;
    function LogProductSale(ASaleDataSet, AProductDataSet, AProductLogLogDataSet: TDataSet): String;
    function AddStockCode(const ACode: String; ASaleDataSet, AProductDataSet: TDataSet): String;
    function GetCurrentTotal(ASaleDataSet: TDataSet): Currency;
    procedure Log(const AMessage: String);
    procedure ClearCurrentSale(ASaleDataSet: TDataSet);
    function SaveCurrentSale(ASaleDataSet: TDataSet): String;
    function SuspendCurrentSale(ASaleDataSet: TDataSet): String;
    function RecallToCurrentSale(ASaleDataSet: TDataSet): String;
    function RecallSale(AMemoryDataSet, ASaleDataSet: TDataSet): String;
    function CreateReport(AType: String; AFromDate, AToDate: TDateTime; const AProduct, ACategory, AGroup, ACSSStyle: String): String;
    function GenerateReceipt(APayment: Currency; ADataSet, ASaleDataSet: TDataSet; const ACSSStyle: String = ''): String;
    function CheckPermissions(AAccess: Integer): Boolean;
    procedure InitializeTable(ATable: TFDTable; AMemTable: TFDMemTable);
    procedure InitializeDatabase;
  end;
  const
    DB_FILENAME = 'w10posdb.sdb';
    DB_PASSWORD = 'SecretPassword';
    DB_ENCRYPTION = 'aes-256';
    DB_PRODUCTSTABLE = 'Products';
    DB_CATEGORIESTABLE = 'Categories';
    DB_UNITSTABLE = 'Units';
    DB_BRANDSTABLE = 'Brands';
    DB_GROUPSTABLE = 'Groups';
    DB_MISCTABLE = 'Misc';
    DB_STATUSTABLE = 'Status';
    DB_CUSTOMERSTABLE = 'Customers';
    DB_RECALLSALESTABLE = 'RecallSales';
    DB_SALELOGTABLE = 'SaleLog';
    DB_PRODUCTLOGTABLE = 'ProductLog';
    DB_REPORTSTABLE = 'Reports';
    DB_USERSTABLE = 'Users';

    EmptyLBRow = '<tr class="row header ltblue"><td>&nbsp;</td><td><h3>&nbsp;</h3></td></tr>';
    TableTRStart = '<tr class="row header ltblue"><td><b>';
    TableTDMid = '</b></td><td>';
    TableTREnd = '</td></tr>';
    TableTR2Start = '<tr class="row"><td colspan="2"><b>';
    TableTR2End = '</b></td></tr>';
    ReportTStart = '<tr class="row"><td colspan="2"><table width="100%" align="center" cellspacing="0" cellpadding="10" border="0">';
    ReportTHStart = '<tr class="row"><th><b>';
    ReportTHMid = '</b></th><th><b>';
    ReportTHEnd = '</b></th></tr>';
    ReportTRStart = '<tr class="row" align="center"><td>';
    ReportTRMid = '</td><td>';
    ReportTREnd = '</td></tr>';
    ReportTEnd = '</table></td></tr>';

    C_COMPANY_NAME = 'Supermarket';

    C_RECEIPT = 'Receipt';

    C_USER_ACCESS = 0;
    C_MANAGER_ACCESS = 1;
    C_ADMIN_ACCESS = 2;

    C_DEFAULT_TAX_RATE = 0.07;

    C_BAD_PASSWORD = 'Login failed. User or password incorrect.';
    C_NO_ACCESS = 'Login failed. User account is not active.';
    C_NO_PRODUCT = 'Failed to find product.';
    C_SALE_VOIDED = 'Sale has been voided.';
    C_ACCESS_DENIED = 'Access denied.';
    C_LOGOUT_DIALOG = 'Are you sure you want to log out?';

    C_UPDATE_QUANTITY_TITLE = 'Update Quantity';
    C_UPDATE_QUANTITY_DESC = 'Enter a new quantity for this item:';

    C_UPDATE_PRICE_TITLE = 'Update Price';
    C_UPDATE_PRICE_DESC = 'Enter a new price for this item:';

    C_PAYMENT_TITLE = 'Enter Payment';
    C_PAYMENT_DESC = 'Enter payment amount received:';

    C_DISCOUNT_TITLE = 'Discount';
    C_DISCOUNT_DESC = 'Enter discount code:';
    C_DISCOUNT_DEFAULT_CODE = 'DISCOUNT';

    C_DATASET_INACTIVE = 'Current Sale DataSet is not active.';

    C_CASHIER_LABEL = 'Cashier: %s';
    C_TOTAL_LABEL = 'Total: %m';
    C_TAX_LABEL = 'Tax: %m';

    C_NEW_RECORD_TITLE = 'New Record';
    C_NEW_RECORD_DESC = 'Enter the title for this new record:';

    C_NEW_USER_TITLE = 'New User';
    C_NEW_USERNAME_DESC = 'Enter a username:';
    C_NEW_PASSWORD_DESC = 'Enter a password:';

    C_RESET_PASS_TITLE = 'Reset Password';
    C_RESET_PASS_DESC = 'Enter anew  password:';

    C_THANK_YOU = 'Thank you for your business!&nbsp;';
    C_CHANGE_MESSAGE = 'Change: ';

    C_PRICE_MODE = 'Price Mode: ';
    C_PRICE_MODE_NORMAL = 'Normal';
    C_PRICE_MODE_SALE = 'Sale';
    C_PRICE_MODE_RATE = 0.90; // default 10% off

    C_PRODUCT_SALES = 'Product Sales';
    C_SALES = 'Sales';

    C_SUSPEND_SALE = 'Suspend Sale';
    C_RECALL_SALE = 'Recall Sale';


var
  DM: TDM;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

uses
  uMainForm, System.NetEncoding, System.Variants, System.StrUtils, System.IOUtils, System.Math, System.Hash;


procedure TDM.InitializeTable(ATable: TFDTable; AMemTable: TFDMemTable);
begin
  ATable.FieldDefs.Clear;
  ATable.FieldDefs.Assign(AMemTable.FieldDefs);
  ATable.CreateTable(False);
  ATable.CopyDataSet(AMemTable, [coStructure, coRestart, coAppend]);
end;

procedure TDM.InitializeDatabase;
begin
  FDConnection1.Params.Values['Database'] := TPath.Combine(TPath.GetDocumentsPath, DB_FILENAME);

  UsersFDTable.TableName := DB_USERSTABLE;
  ProductsFDTable.TableName := DB_PRODUCTSTABLE;
  CategoryFDTable.TableName := DB_CATEGORIESTABLE;
  UnitsFDTable.TableName := DB_UNITSTABLE;
  BrandFDTable.TableName := DB_BRANDSTABLE;
  GroupFDTable.TableName := DB_GROUPSTABLE;
  MiscFDTable.TableName := DB_MISCTABLE;
  StatusFDTable.TableName := DB_STATUSTABLE;
  SaleLogFDTable.TableName := DB_SALELOGTABLE;
  RecallSalesFDTable.TableName := DB_RECALLSALESTABLE;
  CustomersFDTable.TableName := DB_CUSTOMERSTABLE;
  ReportsFDTable.TableName := DB_REPORTSTABLE;
  ProductLogFDTable.TableName := DB_PRODUCTLOGTABLE;

  if TFile.Exists(FDConnection1.Params.Values['Database'])=True then
    begin
      FDSQLiteSecurity1.Database := FDConnection1.Params.Values['Database'];
    end
  else
    begin
      FDConnection1.Open;
      try
        InitializeTable(UsersFDTable, UsersMemTable);
        InitializeTable(ProductsFDTable, ProductsMemTable);
        InitializeTable(CategoryFDTable, CategoryMemTable);
        InitializeTable(UnitsFDTable, UnitsMemTable);
        InitializeTable(BrandFDTable, BrandMemTable);
        InitializeTable(GroupFDTable, GroupMemTable);
        InitializeTable(MiscFDTable, MiscMemTable);
        InitializeTable(StatusFDTable, StatusMemTable);
        InitializeTable(SaleLogFDTable, SaleLogMemTable);
        InitializeTable(RecallSalesFDTable, RecallSalesMemTable);
        InitializeTable(CustomersFDTable, CustomersMemTable);
        InitializeTable(ReportsFDTable, ReportsMemTable);
        InitializeTable(ProductLogFDTable, ProductLogMemTable);
      finally
        FDConnection1.Close;
      end;
      FDSQLiteSecurity1.Database := FDConnection1.Params.Values['Database'];
      FDSQLiteSecurity1.Password := DB_ENCRYPTION + ':' + DB_PASSWORD;
      FDSQLiteSecurity1.SetPassword;
    end;

  FDConnection1.Params.Values['Encrypt'] := DB_ENCRYPTION;
  FDConnection1.Params.Password := DB_PASSWORD;
  FDConnection1.Open;

  UsersFDTable.Open;
  ProductsFDTable.Open;
  CategoryFDTable.Open;
  UnitsFDTable.Open;
  BrandFDTable.Open;
  GroupFDTable.Open;
  MiscFDTable.Open;
  StatusFDTable.Open;
  SaleLogFDTable.Open;
  RecallSalesFDTable.Open;
  CustomersFDTable.Open;
  ReportsFDTable.Open;
  ProductLogFDTable.Open;

  UsersBindSourceDB.DataSet := UsersFDTable;
  ProductsBindSourceDB.DataSet := ProductsFDTable;
  ProductLogBindSourceDB.DataSet := ProductLogFDTable;
  SaleLogBindSourceDB.DataSet := SaleLogFDTable;
  ReportsBindSourceDB.DataSet := ReportsFDTable;
  CustomersBindSourceDB.DataSet := CustomersFDTable;
  RecallSalesBindSourceDB.DataSet := RecallSalesFDTable;

  UsersMemTable.Free;
  ProductsMemTable.Free;
  CategoryMemTable.Free;
  UnitsMemTable.Free;
  BrandMemTable.Free;
  GroupMemTable.Free;
  MiscMemTable.Free;
  StatusMemTable.Free;
  SaleLogMemTable.Free;
  RecallSalesMemTable.Free;
  CustomersMemTable.Free;
  ReportsMemTable.Free;
  ProductLogMemTable.Free;
end;

procedure TDM.Log(const AMessage: String);
begin
  MainForm.MessageDialog(AMessage);
end;

function TDM.CheckPermissions(AAccess: Integer): Boolean;
begin
  if FCurrentPermissions>=AAccess then
    Result := True
  else
    Result := False;
end;

function TDM.Login(const AUsername, APassword: String): Integer;
var
  LResults: Variant;
  LSalt: Variant;
begin
  Result := -1;
  LSalt := UsersBindSourceDB.DataSet.Lookup('Name; Status', VarArrayOf([AUsername, 1]), 'Salt'); // Status must be 1 to log in
  if not VarIsNull(LSalt) then
    LResults := UsersBindSourceDB.DataSet.Lookup('Name; Password', VarArrayOf([AUsername, THashSHA2.GetHashString(APassword + LSalt,THashSHA2.TSHA2Version.SHA256).ToUpper]), 'Permissions; Status; Id');
  if not VarIsNull(LResults) AND not VarIsEmpty(LResults) then
  begin
    if LResults[1]=1 then
    begin
      FCurrentUser := AUsername;
      FCurrentUserId := LResults[2];
      FCurrentStatus := LResults[1];
      FCurrentPermissions := LResults[0];
      Result := FCurrentPermissions;
    end
    else
      Result := -2;
  end;
end;

function TDM.CreateUser(const AUsername, APassword: String): String;
var
  LGUID: TGUID;
  LSalt: String;
begin
  try
    CreateGUID(LGuid);
    LSalt := GUIDToString(LGuid);
    LSalt := LSalt.Substring(1,LSalt.Length-2);
    UsersBindSourceDB.DataSet.AppendRecord([nil,AUsername,THashSHA2.GetHashString(APassword + LSalt,THashSHA2.TSHA2Version.SHA256).ToUpper,LSalt,0,1]);
  except
    on E: Exception do
      begin
        Result := E.Message;
      end;
  end;
end;

function TDM.ResetPassword(const AUsername, APassword: String): String;
var
  LGUID: TGUID;
  LSalt: String;
begin
  try
    CreateGUID(LGuid);
    LSalt := GUIDToString(LGuid);
    LSalt := LSalt.Substring(1,LSalt.Length-2);

    if UsersBindSourceDB.DataSet.FieldByName('Name').AsWideString<>AUsername then
      UsersBindSourceDB.DataSet.Locate('Name',VarArrayOf([AUsername]),[]);

    UsersBindSourceDB.DataSet.Edit;
    UsersBindSourceDB.DataSet.FieldByName('Password').AsWideString := THashSHA2.GetHashString(APassword + LSalt,THashSHA2.TSHA2Version.SHA256).ToUpper;
    UsersBindSourceDB.DataSet.FieldByName('Salt').AsWideString := LSalt;
    UsersBindSourceDB.DataSet.Post;
  except
    on E: Exception do
      begin
        Result := E.Message;
      end;
  end;
end;


procedure TDM.Logout;
begin
  FCurrentPermissions := 0;
  FCurrentStatus := 0;
  FCurrentUserId := 0;
  FCurrentUser := '';
end;

procedure TDM.EditProduct(AProductDataSet: TDataSet);
begin
  AProductDataSet.Edit;
end;

procedure TDM.ClearCurrentSale(ASaleDataSet: TDataSet);
begin
  if ASaleDataSet is TFDMemTable then
    TFDMemTable(ASaleDataSet).EmptyDataSet;
end;

function TDM.AddCurrentProduct(ASaleDataSet, AProductDataSet: TDataSet): String;
var
  LPrice: Currency;
begin
  Result := '';
  try
    ASaleDataSet.Append;
    ASaleDataSet.FieldByName('ItemId').AsInteger := AProductDataSet.FieldByName('Id').AsInteger;
    ASaleDataSet.FieldByName('Description').AsWideString := AProductDataSet.FieldByName('Description').AsWideString;
    if FPriceMode=True then
    begin
      LPrice := AProductDataSet.FieldByName('Price').AsCurrency * C_PRICE_MODE_RATE;
    end
    else
    begin
      LPrice := AProductDataSet.FieldByName('Price').AsCurrency;
    end;
    ASaleDataSet.FieldByName('Price').AsCurrency := LPrice;
    ASaleDataSet.FieldByName('Quantity').AsInteger := 1;
    ASaleDataSet.FieldByName('Subtotal').AsCurrency := ASaleDataSet.FieldByName('Price').AsCurrency * ASaleDataSet.FieldByName('Quantity').AsInteger;
    ASaleDataSet.Post;
  except
    on E: Exception do
    begin
      Result := E.Message;
    end;
  end;
end;

function TDM.DeleteCurrentItem(ASaleDataSet: TDataSet): String;
begin
  Result := '';
  try
    ASaleDataSet.Delete;
  except
    on E: Exception do
    begin
      Result := E.Message;
    end;
  end;
end;

function TDM.GetCurrentTotal(ASaleDataSet: TDataSet): Currency;
var
  LCurrentRecord: Integer;
begin
  Result := 0.00;
  try
    if ASaleDataSet.Active then
    begin
      LCurrentRecord := ASaleDataSet.FieldByName('Id').AsInteger;
      ASaleDataSet.First;
      while not ASaleDataSet.Eof do
      begin
        Result := Result + ASaleDataSet.FieldByName('Subtotal').AsCurrency;
        ASaleDataSet.Next;
      end;
      ASaleDataSet.Locate('Id', VarArrayOf([LCurrentRecord]), []);
    end
    else
      raise Exception.Create(C_DATASET_INACTIVE);
  except
    on E: Exception do
    begin
      Log(E.Message);
    end;
  end;
end;

function TDM.GenerateReceipt(APayment: Currency; ADataSet, ASaleDataSet: TDataSet; const ACSSStyle: String = ''): String;
var
  LCurrentRecord: Integer;
  LReceipt: TStringList;
  LSubTotal: Currency;
  LTaxTotal: Currency;
  LTotal: Currency;
  LChange: Currency;
  LFormatSettings: TFormatSettings;
begin
  Result := '';
  try
    if ASaleDataSet.Active then
    begin
      LSubTotal := GetCurrentTotal(ASaleDataSet);
      LTaxTotal := RoundTo(LSubTotal*C_DEFAULT_TAX_RATE, -2);
      LTotal := LSubTotal + LTaxTotal;
      LChange := LTotal - APayment;

      LFormatSettings := TFormatSettings.Create;

      LCurrentRecord := ASaleDataSet.FieldByName('Id').AsInteger;
      ASaleDataSet.First;

        LReceipt := TStringList.Create;
        try

           AddReportLine('<!DOCTYPE html>',LReceipt);
           AddReportLine('<html lang="en"><head>',LReceipt);
           AddReportLine('<meta name="viewport" content="width=device-width; initial-scale=1" />',LReceipt);
           AddReportLine(ACSSStyle,LReceipt);
           AddReportLine('</head><body><table width="100%" align="center" cellspacing="0" cellpadding="10" border="0">',LReceipt);
           AddReportHeaderLine(TNetEncoding.HTML.Encode(C_COMPANY_NAME), TNetEncoding.HTML.Encode(C_RECEIPT),LReceipt);
           AddReportLine(EmptyLBRow, LReceipt);
           AddReportSubHeader(TNetEncoding.HTML.Encode(DateTimeToStr(Now)),LReceipt);
           AddReportSubHeaderInfo(TNetEncoding.HTML.Encode(ADataSet.FieldByName('CustomerName').AsString),
                                  TNetEncoding.HTML.Encode(ADataSet.FieldByName('Address1').AsString),
                                  TNetEncoding.HTML.Encode(ADataSet.FieldByName('Address2').AsString),
                                  TNetEncoding.HTML.Encode(ADataSet.FieldByName('Phone').AsString),LReceipt);
           AddReportLine(EmptyLBRow, LReceipt);
           AddReportLine(EmptyLBRow, LReceipt);
           AddReceiptSection(ASaleDataSet, LReceipt);
           LReceipt.Append(TableTRStart + '</b></td><td align="right">'  + '<h2>Subtotal</h2>' + TableTREnd);
           LReceipt.Append(TableTRStart + '</b></td><td align="right">' + LFormatSettings.CurrencyString + CurrToStr(LSubTotal) + TableTREnd);
           LReceipt.Append(TableTRStart + '</b></td><td align="right">'  + '<h2>Tax</h2>' + TableTREnd);
           LReceipt.Append(TableTRStart + '</b></td><td align="right">' + LFormatSettings.CurrencyString + CurrToStr(LTaxTotal) + TableTREnd);
           LReceipt.Append(TableTRStart + '</b></td><td align="right">'  + '<h2>Total</h2>' + TableTREnd);
           LReceipt.Append(TableTRStart + '</b></td><td align="right">' + LFormatSettings.CurrencyString + CurrToStr(LTotal) + TableTREnd);
           LReceipt.Append(TableTRStart + '</b></td><td align="right">'  + '<h2>Payment</h2>' + TableTREnd);
           LReceipt.Append(TableTRStart + '</b></td><td align="right">' + LFormatSettings.CurrencyString + CurrToStr(APayment) + TableTREnd);
           LReceipt.Append(TableTRStart + '</b></td><td align="right">'  + '<h2>Change</h2>' + TableTREnd);
           LReceipt.Append(TableTRStart + '</b></td><td align="right">' + LFormatSettings.CurrencyString + CurrToStr(LChange) + TableTREnd);
           AddReportLine(EmptyLBRow, LReceipt);
           AddReportLine(EmptyLBRow, LReceipt);
           AddReportLine(EmptyLBRow, LReceipt);
           AddReportFooterLine(C_THANK_YOU,LReceipt);
           LReceipt.Append('</table></body></html>');
           Result := LReceipt.Text;

        finally
          LReceipt.Free;
        end;




      ASaleDataSet.Locate('Id', VarArrayOf([LCurrentRecord]), []);
    end
    else
      raise Exception.Create(C_DATASET_INACTIVE);
  except
    on E: Exception do
    begin
      Log(E.Message);
    end;
  end;
end;

function TDM.RecallToCurrentSale(ASaleDataSet: TDataSet): String;
begin
  Result := RecallSale(RecallSalesBindSourceDB.DataSet, ASaleDataSet);
end;

function TDM.RecallSale(AMemoryDataSet, ASaleDataSet: TDataSet): String;
var
  LRecallItemsData: TStringStream;
begin
  Result := '';
  try
    AMemoryDataSet.First;

    if (ASaleDataSet is TFDMemTable) OR (ASaleDataSet is TFDTable) then
    begin
      LRecallItemsData := TStringStream.Create('', TEncoding.UTF8);
      try
        LRecallItemsData.WriteString(AMemoryDataSet.FieldByName('ItemsData').AsWideString);
        LRecallItemsData.Position := 0;

        if (ASaleDataSet is TFDMemTable) then
          TFDMemTable(ASaleDataSet).LoadFromStream(LRecallItemsData, sfJSON)
        else
        if (ASaleDataSet is TFDTable) then
          TFDTable(ASaleDataSet).LoadFromStream(LRecallItemsData, sfJSON);
      finally
        LRecallItemsData.Free;
      end;

      AMemoryDataSet.Delete;
    end;
  except
    on E: Exception do
    begin
      Result := E.Message;
    end;
  end;
end;

function TDM.CreateReport(AType: String; AFromDate, AToDate: TDateTime; const AProduct, ACategory, AGroup, ACSSStyle: String): String;
var
  LFilter: String;
  LReport: String;
  LTotal: Currency;
begin
  if AType='Products' then
  begin
    ProductLogBindSourceDB.DataSet.Filtered := False;

    LFilter := IfThen(AProduct<>'','ItemId = ' + QuotedStr(AProduct),'');
    LFilter := LFilter + IfThen((LFilter<>'') AND (ACategory<>''),' AND ','') + IfThen(ACategory<>'','Category = ' + QuotedStr(ACategory),'');
    LFilter := LFilter + IfThen((LFilter<>'') AND (AGroup<>''),' AND ','') + IfThen(AGroup<>'','Group = ' + QuotedStr(AGroup),'');

    ProductLogBindSourceDB.DataSet.Filter := 'Timestamp >= {d ' + (FormatDateTime('yyyy-mm-dd', AFromDate)) + '} AND ' +
                                 'Timestamp <= {d ' + (FormatDateTime('yyyy-mm-dd', AToDate)) + '}' + IfThen(LFilter<>'',' AND ','') + LFilter;

    ProductLogBindSourceDB.DataSet.Filtered := True;

    LTotal := 0;
    ProductLogBindSourceDB.DataSet.First;
    while not ProductLogBindSourceDB.DataSet.Eof do
    begin
      LTotal := LTotal + ProductLogBindSourceDB.DataSet.FieldByName('Total').AsCurrency;
      ProductLogBindSourceDB.DataSet.Next;
    end;

    try
      LReport := GenerateProductReport(ACSSStyle,CurrToStr(LTotal),CustomersBindSourceDB.DataSet,ProductLogBindSourceDB.DataSet);
    except
      on E: Exception do
      begin
        Log(E.Message);
      end;
    end;
  end
  else
  if AType='Sales' then
  begin
    SaleLogBindSourceDB.DataSet.Filtered := False;

    SaleLogBindSourceDB.DataSet.Filter := 'Timestamp >= {d ' + (FormatDateTime('yyyy-mm-dd', AFromDate)) + '} AND ' +
                                 'Timestamp <= {d ' + (FormatDateTime('yyyy-mm-dd', AToDate)) + '}' + IfThen(LFilter<>'',' AND ','') + LFilter;

    SaleLogBindSourceDB.DataSet.Filtered := True;

    LTotal := 0;
    SaleLogBindSourceDB.DataSet.First;
    while not SaleLogBindSourceDB.DataSet.Eof do
    begin
      LTotal := LTotal + SaleLogBindSourceDB.DataSet.FieldByName('Total').AsCurrency;
      SaleLogBindSourceDB.DataSet.Next;
    end;

    try
      LReport := GenerateSaleReport(ACSSStyle,CurrToStr(LTotal),CustomersBindSourceDB.DataSet,SaleLogBindSourceDB.DataSet);
    except
      on E: Exception do
      begin
        Log(E.Message);
      end;
    end;
  end;

  ReportsBindSourceDB.DataSet.Append;
  ReportsBindSourceDB.DataSet.FieldByName('UserId').AsInteger := FCurrentUserId;
  ReportsBindSourceDB.DataSet.FieldByName('Type').AsWideString := AType;
  ReportsBindSourceDB.DataSet.FieldByName('ReportData').AsWideString := LReport;
  ReportsBindSourceDB.DataSet.FieldByName('Timestamp').AsDateTime := Now;
  ReportsBindSourceDB.DataSet.Post;

  if AType='Products' then
  begin
    ProductLogBindSourceDB.DataSet.Filtered := False;
    ProductLogBindSourceDB.DataSet.Filter := '';
    ProductLogBindSourceDB.DataSet.Filtered := True;
  end
  else
  if AType='Sales' then
  begin
    SaleLogBindSourceDB.DataSet.Filtered := False;
    SaleLogBindSourceDB.DataSet.Filter := '';
    SaleLogBindSourceDB.DataSet.Filtered := True;
  end;
end;

function TDM.SuspendCurrentSale(ASaleDataSet: TDataSet): String;
begin
  Result := LogCurrentSale(ASaleDataSet,RecallSalesBindSourceDB.DataSet);
end;

function TDM.SaveCurrentSale(ASaleDataSet: TDataSet): String;
var
  LMessage: String;
begin
  Result := LogCurrentSale(ASaleDataSet,SaleLogBindSourceDB.DataSet);
  LMessage := LogProductSale(ASaleDataSet, ProductsBindSourceDB.DataSet, ProductLogBindSourceDB.DataSet);
  if LMessage<>'' then
    Log(LMessage);
end;

function TDM.LogProductSale(ASaleDataSet, AProductDataSet, AProductLogLogDataSet: TDataSet): String;
var
  LTimestamp: TDateTime;
begin
  Result := '';
  try
    LTimestamp := Now;
    ASaleDataSet.First;
    while not ASaleDataSet.Eof do
    begin
      if AProductDataSet.Locate('Id',VarArrayOf([ASaleDataSet.FieldByName('ItemId').AsInteger]),[]) then
      begin
        AProductLogLogDataSet.Append;
        AProductLogLogDataSet.FieldByName('ItemId').AsInteger := ASaleDataSet.FieldByName('ItemId').AsInteger;
        AProductLogLogDataSet.FieldByName('UserId').AsInteger := FCurrentUserId;
        AProductLogLogDataSet.FieldByName('Price').AsInteger := AProductDataSet.FieldByName('Price').AsInteger;
        AProductLogLogDataSet.FieldByName('Quantity').AsInteger := ASaleDataSet.FieldByName('Quantity').AsInteger;
        AProductLogLogDataSet.FieldByName('Total').AsInteger := ASaleDataSet.FieldByName('Subtotal').AsInteger;
        AProductLogLogDataSet.FieldByName('Category').AsInteger := AProductDataSet.FieldByName('Category').AsInteger;
        AProductLogLogDataSet.FieldByName('Brand').AsInteger := AProductDataSet.FieldByName('Brand').AsInteger;
        AProductLogLogDataSet.FieldByName('Units').AsInteger := AProductDataSet.FieldByName('Units').AsInteger;
        AProductLogLogDataSet.FieldByName('Group').AsInteger := AProductDataSet.FieldByName('Group').AsInteger;
        AProductLogLogDataSet.FieldByName('Timestamp').AsDateTime := LTimestamp;
        AProductLogLogDataSet.Post;
      end;
      ASaleDataSet.Next;
    end;
  except
    on E: Exception do
    begin
      Result := E.Message;
    end;
  end;
end;

function TDM.LogCurrentSale(ASaleDataSet, ALogDataSet: TDataSet): String;
var
  LSubTotal: Currency;
  LTaxTotal: Currency;
  LTotal: Currency;
  LSaleItemsData: TStringStream;
begin
  Result := '';
  try
    LSubTotal := GetCurrentTotal(ASaleDataSet);
    LTaxTotal := RoundTo(LSubTotal*C_DEFAULT_TAX_RATE,-2);
    LTotal := LSubTotal + LTaxTotal;

    if (ASaleDataSet is TFDMemTable) or (ASaleDataSet is TFDTable) then
    begin
      LSaleItemsData := TStringStream.Create('', TEncoding.UTF8);
      try
        if (ASaleDataSet is TFDMemTable) then
          TFDMemTable(ASaleDataSet).SaveToStream(LSaleItemsData, sfJSON)
        else
        if (ASaleDataSet is TFDTable) then
          TFDTable(ASaleDataSet).SaveToStream(LSaleItemsData, sfJSON);

        ALogDataSet.Append;
        ALogDataSet.FieldByName('UserId').AsInteger := FCurrentUserId;
        ALogDataSet.FieldByName('Subtotal').AsCurrency := LSubTotal;
        ALogDataSet.FieldByName('TaxRate').AsFloat := C_DEFAULT_TAX_RATE;
        ALogDataSet.FieldByName('TaxTotal').AsCurrency := LTaxTotal;
        ALogDataSet.FieldByName('Total').AsCurrency := LTotal;
        ALogDataSet.FieldByName('ItemsData').AsWideString := LSaleItemsData.DataString;
        ALogDataSet.FieldByName('Timestamp').AsDateTime := Now;
        ALogDataSet.Post;
      finally
        LSaleItemsData.Free;
      end;
    end;
  except
    on E: Exception do
    begin
      Result := E.Message;
    end;
  end;
end;

function TDM.UpdateCurrentItemPrice(APrice: Currency; ASaleDataSet: TDataSet): String;
begin
  Result := '';
  try
    ASaleDataSet.Edit;
    ASaleDataSet.FieldByName('Price').AsCurrency := APrice;
    ASaleDataSet.FieldByName('Subtotal').AsCurrency := ASaleDataSet.FieldByName('Price').AsCurrency * ASaleDataSet.FieldByName('Quantity').AsInteger;
    ASaleDataSet.Post;
  except
    on E: Exception do
    begin
      Result := E.Message;
    end;
  end;
end;

function TDM.UpdateCurrentItemQuantity(AQuantity: Integer; ASaleDataSet: TDataSet): String;
begin
  Result := '';
  try
    ASaleDataSet.Edit;
    ASaleDataSet.FieldByName('Quantity').AsInteger := AQuantity;
    ASaleDataSet.FieldByName('Subtotal').AsCurrency := ASaleDataSet.FieldByName('Price').AsCurrency * ASaleDataSet.FieldByName('Quantity').AsInteger;
    ASaleDataSet.Post;
  except
    on E: Exception do
    begin
      Result := E.Message;
    end;
  end;
end;

function TDM.IncCurrentItemQuantity(ASaleDataSet: TDataSet): String;
begin
  Result := UpdateCurrentItemQuantity(ASaleDataSet.FieldByName('Quantity').AsInteger+1, ASaleDataSet);
end;

function TDM.DecCurrentItemQuantity(ASaleDataSet: TDataSet): String;
begin
  Result := UpdateCurrentItemQuantity(ASaleDataSet.FieldByName('Quantity').AsInteger-1, ASaleDataSet);
end;

function TDM.AddStockCode(const ACode: String; ASaleDataSet, AProductDataSet: TDataSet): String;
begin
  Result := '';

  if AProductDataSet.Locate('Barcode', VarArrayOf([ACode]), []) then
  begin
    Result := AddCurrentProduct(ASaleDataSet, AProductDataSet);
  end
  else
  if AProductDataSet.Locate('Stockcode', VarArrayOf([ACode]), []) then
  begin
    Result := AddCurrentProduct(ASaleDataSet, AProductDataSet);
  end
  else
  if AProductDataSet.Locate('Description', VarArrayOf([ACode]), []) then
  begin
    Result := AddCurrentProduct(ASaleDataSet, AProductDataSet);
  end
  else
    Result := C_NO_PRODUCT;
end;


function TDM.GenerateProductReport(const ACSSStyle: String; const ATotal: String; ADataSet, ALineItemsDataSet: TDataSet): String;
var
  LReport: TStringList;
begin
  LReport := TStringList.Create;
  try

     AddReportLine('<!DOCTYPE html>',LReport);
     AddReportLine('<html lang="en"><head>',LReport);
     AddReportLine('<meta name="viewport" content="width=device-width; initial-scale=1" />',LReport);
     AddReportLine(ACSSStyle,LReport);
     AddReportLine('</head><body><table width="100%" align="center" cellspacing="0" cellpadding="10" border="0">',LReport);
     AddReportHeaderLine(TNetEncoding.HTML.Encode(C_COMPANY_NAME), TNetEncoding.HTML.Encode(C_PRODUCT_SALES),LReport);
     AddReportLine(EmptyLBRow, LReport);
     AddReportSubHeader(TNetEncoding.HTML.Encode(DateTimeToStr(Now)),LReport);
     AddReportLine(EmptyLBRow, LReport);
     AddReportLine(EmptyLBRow, LReport);
     AddProductReportSection(ALineItemsDataset, LReport);
     LReport.Append(TableTRStart + '</b></td><td align="right">'  + '<h2>Total</h2>' + TableTREnd);
     LReport.Append(TableTRStart + '</b></td><td align="right">$' + ATotal + TableTREnd);
     AddReportLine(EmptyLBRow, LReport);
     AddReportLine(EmptyLBRow, LReport);
     AddReportLine(EmptyLBRow, LReport);
     AddReportFooterLine('&nbsp;',LReport);
     LReport.Append('</table></body></html>');
     Result := LReport.Text;

  finally
    LReport.Free;
  end;
end;

function TDM.GenerateSaleReport(const ACSSStyle: String; const ATotal: String; ADataSet, ALineItemsDataSet: TDataSet): String;
var
  LReport: TStringList;
begin
  LReport := TStringList.Create;
  try

     AddReportLine('<!DOCTYPE html>',LReport);
     AddReportLine('<html lang="en"><head>',LReport);
     AddReportLine('<meta name="viewport" content="width=device-width; initial-scale=1" />',LReport);
     AddReportLine(ACSSStyle,LReport);
     AddReportLine('</head><body><table width="100%" align="center" cellspacing="0" cellpadding="10" border="0">',LReport);
     AddReportHeaderLine(TNetEncoding.HTML.Encode(C_COMPANY_NAME), TNetEncoding.HTML.Encode(C_SALES),LReport);
     AddReportLine(EmptyLBRow, LReport);
     AddReportSubHeader(TNetEncoding.HTML.Encode(DateTimeToStr(Now)),LReport);
     AddReportLine(EmptyLBRow, LReport);
     AddReportLine(EmptyLBRow, LReport);
     AddSaleReportSection(ALineItemsDataset, LReport);
     LReport.Append(TableTRStart + '</b></td><td align="right">'  + '<h2>Total</h2>' + TableTREnd);
     LReport.Append(TableTRStart + '</b></td><td align="right">$' + ATotal + TableTREnd);
     AddReportLine(EmptyLBRow, LReport);
     AddReportLine(EmptyLBRow, LReport);
     AddReportLine(EmptyLBRow, LReport);
     AddReportFooterLine('&nbsp;',LReport);
     LReport.Append('</table></body></html>');
     Result := LReport.Text;

  finally
    LReport.Free;
  end;
end;

procedure TDM.AddReportLine(const S: String; AStrings: TStrings);
begin
  AStrings.Append(S);
end;

procedure TDM.AddReportHeaderLine(const S1, S2: String; AStrings: TStrings);
begin
  AStrings.Append('<tr class="row header blue"><td><h3><p class="bg-primary">' + S1 + '</p></h3></td>'
                  + '<td align="right"><h3><p class="bg-primary">' + S2 + '</p></h3></td></tr>');
end;

procedure TDM.AddReportSubHeader(const S1: String; AStrings: TStrings);
begin
  AStrings.Append('<tr class="row header blue"><td align="left"><p class="bg-info"><b></b></p></td><td align="right">'
                  + '<p class="bg-info"><b>Date: ' + S1 + '</b></p></td></tr>');
end;

procedure TDM.AddReportSubHeaderInfo(const S1, S2, S3, S4: String; AStrings: TStrings);
begin
  AStrings.Append('<tr class="row header ltblue"><td align="left"><h4>'
                    +'<p class="bg-info">'+ S1 +'</p>'
                    +'<p class="bg-info">'+ S2 +'</p>'
                    +'<p class="bg-info">'+ S3 +'</p>'
                    +'<p class="bg-info">'+ S4 +'</p>'
                    +'</h4></td><td></td></tr>');
end;

procedure TDM.AddReportFooterLine(const S1: String; AStrings: TStrings);
begin
  AStrings.Append('<tr class="row header blue"><td colspan="2"><h3><p class="bg-primary" align="center">' + S1 + '</p></h3></td></tr>');
end;

procedure TDM.AddReportSection(ALineItemsDataSet: TDataSet; AStrings: TStrings);
begin
  AddReportLine(ReportTStart + ReportTHStart + 'Name' + ReportTHMid + 'Quantity' + ReportTHMid + 'Price' + ReportTHEnd, AStrings);
  ALineItemsDataSet.First;
  while not ALineItemsDataSet.EOF do
   begin
     AddReceiptData(ALineItemsDataSet.FieldByName('Title').AsString,
                    ALineItemsDataSet.FieldByName('Quantity').AsString,
                    ALineItemsDataSet.FieldByName('Price').AsString, AStrings);
     ALineItemsDataSet.Next;
   end;
  AddReportLine(ReportTEnd, AStrings);
end;

procedure TDM.AddProductReportSection(ALineItemsDataSet: TDataSet; AStrings: TStrings);
begin
  AddReportLine(ReportTStart + ReportTHStart + 'Item Id' + ReportTHMid + 'Quantity' + ReportTHMid + 'Price' + ReportTHMid + 'Total' + ReportTHEnd, AStrings);
  ALineItemsDataSet.First;
  while not ALineItemsDataSet.EOF do
   begin
     AddProductReportData(ALineItemsDataSet.FieldByName('ItemId').AsString,
                    ALineItemsDataSet.FieldByName('Quantity').AsString,
                    ALineItemsDataSet.FieldByName('Price').AsString,
                    ALineItemsDataSet.FieldByName('Total').AsString, AStrings);
     ALineItemsDataSet.Next;
   end;
  AddReportLine(ReportTEnd, AStrings);
end;

procedure TDM.AddSaleReportSection(ALineItemsDataSet: TDataSet; AStrings: TStrings);
begin
  AddReportLine(ReportTStart + ReportTHStart + 'Timestamp' + ReportTHMid + 'User Id' + ReportTHMid + 'SubTotal' + ReportTHMid + 'TaxTotal' + ReportTHMid + 'Total' + ReportTHEnd, AStrings);
  ALineItemsDataSet.First;
  while not ALineItemsDataSet.EOF do
   begin
     AddSaleReportData(ALineItemsDataSet.FieldByName('Timestamp').AsString,
                    ALineItemsDataSet.FieldByName('UserId').AsString,
                    ALineItemsDataSet.FieldByName('SubTotal').AsString,
                    ALineItemsDataSet.FieldByName('TaxTotal').AsString,
                    ALineItemsDataSet.FieldByName('Total').AsString, AStrings);
     ALineItemsDataSet.Next;
   end;
  AddReportLine(ReportTEnd, AStrings);
end;

procedure TDM.AddReceiptSection(ALineItemsDataSet: TDataSet; AStrings: TStrings);
begin
  AddReportLine(ReportTStart + ReportTHStart + 'Name' + ReportTHMid + '...' + ReportTHMid + 'Cost' + ReportTHEnd, AStrings);
  ALineItemsDataSet.First;
  while not ALineItemsDataSet.EOF do
   begin
     AddReceiptData(ALineItemsDataSet.FieldByName('Description').AsString,
                    '...',
                    ALineItemsDataSet.FieldByName('Subtotal').AsString, AStrings);
     if ALineItemsDataSet.FieldByName('Quantity').AsInteger>1 then
     begin
       AddReceiptData(ALineItemsDataSet.FieldByName('Quantity').AsString,
                      ' X ',
                      ALineItemsDataSet.FieldByName('Price').AsString, AStrings);
     end;
     ALineItemsDataSet.Next;
   end;
  AddReportLine(ReportTEnd, AStrings);
end;


procedure TDM.AddReceiptData(ALeft, AMid, ARight: String; AStrings: TStrings);
begin
  AddReportLine(ReportTRStart + ALeft + ReportTRMid + AMid + ReportTRMid + ARight + ReportTREnd, AStrings);
end;

procedure TDM.AddProductReportData(const AName, AQuantity, APrice, ATotal: String; AStrings: TStrings);
begin
  AddReportLine(ReportTRStart + AName + ReportTRMid + AQuantity + ReportTRMid + APrice + ReportTRMid + ATotal + ReportTREnd, AStrings);
end;

procedure TDM.AddSaleReportData(const ATimestamp, AUserId, ASubTotal, ATaxTotal, ATotal: String; AStrings: TStrings);
begin
  AddReportLine(ReportTRStart + ATimeStamp + ReportTRMid + AUserId + ReportTRMid + ASubTotal + ReportTRMid + ATaxTotal + ReportTRMid + ATotal + ReportTREnd, AStrings);
end;

end.
