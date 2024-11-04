unit Unit3;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, MPlayer, IdAntiFreezeBase, IdAntiFreeze,
  IdBaseComponent, IdComponent, IdTCPConnection, IdTCPClient, IdHTTP,
  ShellAPI, INIFiles, WinInet, RzTray;

type
  TForm3 = class(TForm)
    IdHTTP1: TIdHTTP;
    IdAntiFreeze1: TIdAntiFreeze;
    Label2: TLabel;
    Button1: TButton;
    Label1: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form3: TForm3;
  ver: string;
  ini: TIniFile;
  pathINI: string;

implementation

uses about, Unit1;

{$R *.dfm}

function IsConnectedToInternet: Boolean;
var
  dwConnectionTypes: DWORD;
begin
  dwConnectionTypes:= INTERNET_CONNECTION_MODEM or INTERNET_CONNECTION_LAN or INTERNET_CONNECTION_PROXY;
  Result := InternetGetConnectedState(@dwConnectionTypes, 0);
end;

procedure TForm3.FormCreate(Sender: TObject);
begin
 pathINI:=extractfilepath(application.ExeName)+'set.ini';
 ini:=TIniFile.Create(pathINI);
 Form2.Label3.Caption:='Version '+ini.ReadString('ui','ver','');
if IsConnectedToInternet
    then ver:=idHTTP1.Get('http://treyfiles.000webhostapp.com/utaudl/ver') else
begin
 ver:=ini.ReadString('ui','ver','error loading in update');
 ShowMessage('No internet connection! „R„t„u„|„p„z „‡„€„„„Ž „‰„„„€„„„€ „q„|„‘„„„Ž');
end;
 Label4.Caption:='Version '+ini.ReadString('ui','ver','error loading in update');
 if ini.ReadString('ui','ver','error loading in update') = ver then else
 begin
 Button1.Visible:=True;
 Label2.Visible:=True;
 Label3.Visible:=True;
 Label4.Visible:=False;
 Form1.Icon.ShowBalloonHint(Form1.Caption,'New Version Available! '+ver,bhiNone,10);
 Label3.Caption:='Current '+ini.ReadString('ui','ver','error loading in update');
 Label1.Caption:='New Version Available';
 Label2.Caption:='New ver '+ver;
 end;
 ini.Free;
end;

procedure TForm3.Button1Click(Sender: TObject);
begin
 ShellExeCute(handle,nil,PChar('http://bluetrey.hostingerapp.com/utaudl/away.php?ver='+ver),nil,nil,SW_SHOWNORMAL);
end;

end.
