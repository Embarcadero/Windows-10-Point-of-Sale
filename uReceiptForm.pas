unit uReceiptForm;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls,
  Vcl.OleCtrls, SHDocVw;

type
  TReceiptForm = class(TForm)
    WebBrowser: TWebBrowser;
    NavPanel: TPanel;
    CloseButton: TButton;
    procedure CloseButtonClick(Sender: TObject);
  private
    { Private declarations }
    procedure LoadDocument(const ADocument: String);
  public
    { Public declarations }
    procedure LoadReceipt(const ADocument: String);
  end;

var
  ReceiptForm: TReceiptForm;

implementation

{$R *.dfm}

uses
  Vcl.Themes;

procedure TReceiptForm.CloseButtonClick(Sender: TObject);
begin
  Close;
end;

procedure TReceiptForm.LoadReceipt(const ADocument: String);
begin
  LoadDocument(ADocument);
end;

procedure TReceiptForm.LoadDocument(const ADocument: String);
var
  LDoc: Variant;

  function ColorToHex(AColor: TColor): String;
  begin
    Result := IntToHex(GetRValue(AColor), 2) + IntToHex(GetGValue(AColor), 2) + IntToHex(GetBValue(AColor), 2);
  end;
begin
  if not Assigned(WebBrowser.Document) then
    WebBrowser.Navigate('about:blank');

  LDoc := WebBrowser.Document;
  LDoc.Clear;
  LDoc.Write(ADocument+'<style> body { background: #'+ColorToHex(StyleServices.GetStyleColor(scGenericBackground))+
             '; color: #'+ColorToHex(StyleServices.GetStyleFontColor(sfButtonTextNormal))+' } </style>');
  LDoc.Close;
end;

end.
