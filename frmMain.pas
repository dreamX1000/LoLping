unit frmMain;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, JvExStdCtrls, JvCombobox,
  IdBaseComponent, IdComponent, IdRawBase, IdRawClient, IdIcmpClient,
  JvExControls, JvComCtrls, JvLabel, JvEdit, Vcl.ComCtrls, JvExComCtrls,
  JvStatusBar, IniFiles;

type
  TformMain = class(TForm)
    edIP: TJvIPAddress;
    objICMPClient: TIdIcmpClient;
    comboServer: TJvComboBox;
    lblServer: TJvLabel;
    lblIP: TJvLabel;
    btnPing: TButton;
    edReply: TJvEdit;
    blReply: TJvLabel;
    statusBar: TJvStatusBar;
    procedure comboServerChange(Sender: TObject);
    procedure btnPingClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
    arrSvrIP: array[0..4] of String;
    szBasePath: String;
    iLastServer: Integer;
    iniSource: TIniFile;
  public
    { Public declarations }
  end;

var
  formMain: TformMain;
  // riot servers IPs NA / EUW / EUNE / OCE / LAN
  arrDefSvrIP: array[0..4] of String = ('104.160.131.3', '104.160.141.3', '104.160.142.3', '104.160.156.1', '104.160.136.3');
  arrSvrNames: array[0..4] of String = ('NA' ,'EUW', 'EUNE', 'OCE', 'LAN');

implementation
{$R *.dfm}

procedure TformMain.btnPingClick(Sender: TObject);
var
  i: Byte;
  iSum: Integer;

begin
  iSum := 0;
  statusBar.SimpleText := 'Pinging ' + comboServer.Text + ' server...';
  edReply.Text := '';
  Application.ProcessMessages();
  objICMPClient.Host := arrSvrIP[comboServer.ItemIndex];
  for i := 1 to 10 do
    begin
      objICMPClient.Ping();
      Inc(iSum, objICMPClient.ReplyStatus.MsRoundTripTime);
      Sleep(100);
    end;
  statusBar.SimpleText := 'Done.';
  edReply.Text:=IntToStr(iSum div 10)+' ms';
end;

procedure TformMain.comboServerChange(Sender: TObject);
begin
  edIP.Text := arrSvrIP[comboServer.ItemIndex];
  iLastServer := comboServer.ItemIndex;
end;

procedure TformMain.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  iniSource.WriteInteger('session', 'lastserver', iLastServer);
  iniSource.UpdateFile();
  iniSource.Free();
end;

procedure TformMain.FormShow(Sender: TObject);
var
  i: Integer;
begin
  szBasePath := ExtractFileDir(ParamStr(0));
  iniSource := TIniFile.Create(szBasePath + '\lolping.ini');
  for i := 0 to 4 do arrSvrIP[i] := iniSource.ReadString('servers', arrSvrNames[i], arrDefSvrIP[i]);
  iLastServer := iniSource.ReadInteger('session', 'lastserver', 0);
  if (iLastServer > 4) then iLastServer := 0;
  comboServer.ItemIndex := iLastServer;
  edIP.Text := arrSvrIP[iLastServer];
  comboServer.SetFocus();
end;

end.
