unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, IdAntiFreezeBase, IdAntiFreeze, IdBaseComponent,
  IdComponent, IdTCPConnection, IdTCPClient, IdHTTP, WinInet, ExtCtrls,
  OleCtrls, IniFiles, XPMan, ShellAPI, sSkinProvider, sSkinManager, RzTray,
  Menus, IdIOHandler, IdIOHandlerSocket, IdSSLOpenSSL;

type
  TForm1 = class(TForm)
    Power: TButton;
    Soft: TButton;
    Oto: TButton;
    IdAntiFreeze1: TIdAntiFreeze;
    IdHTTP1: TIdHTTP;
    Timer1: TTimer;
    Normal: TButton;
    sSkinManager1: TsSkinManager;
    sSkinProvider1: TsSkinProvider;
    Icon: TRzTrayIcon;
    PopupMenu1: TPopupMenu;
    E1: TMenuItem;
    Procedure Form1OnCreate(Sender: TObject);
    procedure PowerClick(Sender: TObject);
    procedure SoftClick(Sender: TObject);
    procedure Oto2Click(Sender: TObject);
    procedure NormalClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure E1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;
  LoadStream: TMemoryStream;
  ini: TIniFile;
  pathINI: string;
  lang: string;

implementation

{$R *.dfm}

function IsConnectedToInternet: Boolean;
var
  dwConnectionTypes: DWORD;
begin
  dwConnectionTypes:= INTERNET_CONNECTION_MODEM or INTERNET_CONNECTION_LAN or INTERNET_CONNECTION_PROXY;
  Result := InternetGetConnectedState(@dwConnectionTypes, 0);
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  LoadLibrary('ssleay32.dll');
  LoadLibrary('libeay32.dll');
  Screen.Cursors[crDefault]:=LoadCursorFromFile('img\Normal.cur');
  Screen.Cursors[crHandPoint]:=LoadCursorFromFile('img\Link.cur');
end;

Procedure TForm1.Form1OnCreate(Sender: TObject);
begin
  if IsConnectedToInternet
    then else
     begin
     ShowMessage('Not internet connection');
     Form1.Close;
    end;
end;

procedure TForm1.PowerClick(Sender: TObject);
begin
 Normal.Enabled:=False;
 Power.Enabled:=False;
 Soft.Enabled:=False;
 Oto.Enabled:=False;
 Form1.BorderIcons:=Form1.BorderIcons - [biSystemMenu];
 LoadStream:=TMemoryStream.Create;
 idHTTP1.Get('http://treyfiles.000webhostapp.com/utaudl/forVB/power.map', LoadStream);
 LoadStream.SaveToFile('prefix.map');
 LoadStream.Free;
 Icon.ShowBalloonHint(Form1.Caption,'Install Power',bhiInfo,10);
 Normal.Enabled:=True;
 Power.Enabled:=True;
 Soft.Enabled:=True;
 Oto.Enabled:=True;
 Form1.BorderIcons:=Form1.BorderIcons + [biSystemMenu];
end;

procedure TForm1.SoftClick(Sender: TObject);
begin
 Normal.Enabled:=False;
 Power.Enabled:=False;
 Soft.Enabled:=False;
 Oto.Enabled:=False;
 Form1.BorderIcons:=Form1.BorderIcons - [biSystemMenu];
 LoadStream:=TMemoryStream.Create;
 idHTTP1.Get('http://treyfiles.000webhostapp.com/utaudl/forVB/soft.map', LoadStream);
 LoadStream.SaveToFile('prefix.map');
 LoadStream.Free;
 Icon.ShowBalloonHint(Form1.Caption,'Install Soft',bhiInfo,10);
 Normal.Enabled:=True;
 Power.Enabled:=True;
 Soft.Enabled:=True;
 Oto.Enabled:=True;
 Form1.BorderIcons:=Form1.BorderIcons + [biSystemMenu];
end;

procedure TForm1.Oto2Click(Sender: TObject);
begin
 Normal.Enabled:=False;
 Power.Enabled:=False;
 Soft.Enabled:=False;
 Oto.Enabled:=False;
 Form1.BorderIcons:=Form1.BorderIcons - [biSystemMenu];
 LoadStream:=TMemoryStream.Create;
 idHTTP1.Get('http://treyfiles.000webhostapp.com/utaudl/forVB/Blue_Trey_VCV_oto.zip', LoadStream);
 LoadStream.SaveToFile('oto.zip');
 LoadStream.Free;
 ShellExecute(handle,nil,'oto.zip',nil,nil,SW_SHOWNORMAL);
 ShellExecute(handle,nil,PChar(extractfilepath(application.ExeName)),nil,nil,SW_SHOWNORMAL);
 Icon.ShowBalloonHint(Form1.Caption,'Restored oto.ini',bhiInfo,10);
 Normal.Enabled:=True;
 Power.Enabled:=True;
 Soft.Enabled:=True;
 Oto.Enabled:=True;
 Form1.BorderIcons:=Form1.BorderIcons + [biSystemMenu];
end;

procedure TForm1.NormalClick(Sender: TObject);
begin
 Normal.Enabled:=False;
 Power.Enabled:=False;
 Soft.Enabled:=False;
 Oto.Enabled:=False;
 Form1.BorderIcons:=Form1.BorderIcons - [biSystemMenu];
 LoadStream:=TMemoryStream.Create;
 idHTTP1.Get('https://yuracrossman.github.io/utaudl/forVB/normal.map', LoadStream);
 LoadStream.SaveToFile('prefix.map');
 LoadStream.Free;
 Icon.ShowBalloonHint(Form1.Caption,'Install Normal',bhiInfo,10);
 Normal.Enabled:=True;
 Power.Enabled:=True;
 Soft.Enabled:=True;
 Oto.Enabled:=True;
 Form1.BorderIcons:=Form1.BorderIcons + [biSystemMenu];
end;

procedure TForm1.FormClose(Sender: TObject; var Action: TCloseAction);
begin
DeleteFile('oto.zip');
end;

procedure TForm1.E1Click(Sender: TObject);
begin
  Form1.Close;
end;

end.
