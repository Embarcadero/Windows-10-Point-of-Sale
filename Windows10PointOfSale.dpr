program Windows10PointOfSale;

uses
  Vcl.Forms,
  uDM in 'uDM.pas' {DM: TDataModule},
  uMainForm in 'uMainForm.pas' {MainForm},
  uLoginFrame in 'uLoginFrame.pas' {LoginFrame: TFrame},
  uUsersFrame in 'uUsersFrame.pas' {UsersFrame: TFrame},
  uRegisterFrame in 'uRegisterFrame.pas' {RegisterFrame: TFrame},
  uProductsFrame in 'uProductsFrame.pas' {ProductsFrame: TFrame},
  uReportsFrame in 'uReportsFrame.pas' {ReportsFrame: TFrame},
  uReportForm in 'uReportForm.pas' {ReportForm},
  uUpdateProduct in 'uUpdateProduct.pas' {UpdateProductFrame: TFrame},
  Vcl.Themes,
  Vcl.Styles,
  uCustomerForm in 'uCustomerForm.pas' {CustomerForm},
  uReceiptForm in 'uReceiptForm.pas' {ReceiptForm};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  TStyleManager.TrySetStyle('Windows10 SlateGray');
  Application.CreateForm(TDM, DM);
  Application.CreateForm(TMainForm, MainForm);
  Application.CreateForm(TReportForm, ReportForm);
  Application.CreateForm(TCustomerForm, CustomerForm);
  Application.CreateForm(TReceiptForm, ReceiptForm);
  Application.Run;
end.
