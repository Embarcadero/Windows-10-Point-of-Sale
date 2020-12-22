unit uReportForm;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.OleCtrls, SHDocVw,
  Data.Bind.Controls, Vcl.Buttons, Vcl.Bind.Navigator, Vcl.Grids, Vcl.WinXCtrls,
  Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.WinXPanels;

type
  TReportForm = class(TForm)
    WebBrowser: TWebBrowser;
    NavPanel: TPanel;
    CloseButton: TButton;
    procedure CloseButtonClick(Sender: TObject);
  private
    { Private declarations }
    procedure LoadDocument(const ADocument: String);
  public
    { Public declarations }
    procedure LoadReport(const ADocument: String);
  end;

var
  ReportForm: TReportForm;

implementation

{$R *.dfm}

uses
  uDM;

procedure TReportForm.CloseButtonClick(Sender: TObject);
begin
  Close;
end;

procedure TReportForm.LoadReport(const ADocument: String);
begin
  LoadDocument(ADocument);
end;

procedure TReportForm.LoadDocument(const ADocument: String);
var
  LDoc: Variant;
begin
  if not Assigned(WebBrowser.Document) then
    WebBrowser.Navigate('about:blank');

  LDoc := WebBrowser.Document;
  LDoc.Clear;
  LDoc.Write(ADocument);
  LDoc.Close;
end;

end.
