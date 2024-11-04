unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, IdBaseComponent, IdComponent,
  IdTCPConnection, IdTCPClient, IdHTTP, IdAntiFreezeBase, IdAntiFreeze, MPlayer, inifiles,
  ShellAPI, OleCtrls, ExtCtrls, XPMan, sSkinManager, sSkinProvider, sDialogs,
  MMSystem, RzTray, Registry, acTitleBar, Menus, StdCtrls, sLabel,
  IdCookieManager, IdMessage, IdMessageClient, IdSMTP, IdServerIOHandler,
  IdSSLOpenSSL, IdIOHandler, IdIOHandlerSocket;

type
  TForm1 = class(TForm)
    Label1: TLabel;
    IdHTTP1: TIdHTTP;
    SaveDialog1: TSaveDialog;
    IdAntiFreeze1: TIdAntiFreeze;
    InstallVCV: TButton;
    Label2: TLabel;
    TrackBar1: TTrackBar;
    Timer1: TTimer;
    XPManifest1: TXPManifest;
    MainMenu1: TMainMenu;
    File1: TMenuItem;
    Aboute1: TMenuItem;
    Close1: TMenuItem;
    Checkupdate1: TMenuItem;
    Label3: TLabel;
    cvcdl: TButton;
    MediaPlayer2: TMediaPlayer;
    InstallCVC: TButton;
    MediaPlayer1: TMediaPlayer;
    vcvdl: TButton;
    TrackBar2: TTrackBar;
    ProgressBar1: TProgressBar;
    sSkinProvider1: TsSkinProvider;
    Icon: TRzTrayIcon;
    N1: TMenuItem;
    U1: TMenuItem;
    IdCookieManager1: TIdCookieManager;
    PopupMenu1: TPopupMenu;
    C1: TMenuItem;
    A1: TMenuItem;
    S1: TMenuItem;
    IdSMTP1: TIdSMTP;
    IdMessage1: TIdMessage;
    IdSSLIOHandlerSocket1: TIdSSLIOHandlerSocket;
    procedure vcvdlClick(Sender: TObject);
    procedure IdHTTP1Work(Sender: TObject; AWorkMode: TWorkMode;
      const AWorkCount: Integer);
    procedure IdHTTP1WorkBegin(Sender: TObject; AWorkMode: TWorkMode;
      const AWorkCountMax: Integer);
    procedure FormCreate(Sender: TObject);
    procedure InstallVCVClick(Sender: TObject);
    procedure cvcdlClick(Sender: TObject);
    procedure InstallCVCClick(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure Close1Click(Sender: TObject);
    procedure Aboute1Click(Sender: TObject);
    procedure Checkupdate1Click(Sender: TObject);
    procedure N1Click(Sender: TObject);
    procedure U1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Private declarations }
  end;

var
  Form1: TForm1;
  i: integer;
  LoadStream: TMemoryStream;
  pathINI: string;
  ini: TIniFile;
  Reg:TRegistry;
  n: string;
  vcv: string;
  cvc: string;

implementation

uses about, Unit3, UnitSet, UnitUST, Unit6;

{$R *.dfm}

procedure TForm1.FormCreate(Sender: TObject);
begin
 Reg:=TRegistry.Create;
 Reg.RootKey:=HKEY_CLASSES_ROOT;
 Reg.OpenKey('utaudl',true);
 Reg.WriteString('','UTAU Downloader');
 Reg.WriteString('URL Protocol','');
 Reg.OpenKey('DefaultIcon',true);
 Reg.WriteString('','"utaudl.exe,1"');
 Reg.CloseKey;
 Reg.OpenKey('utaudl',true);
 Reg.OpenKey('shell',true);
 Reg.OpenKey('open',true);
 Reg.WriteString('','Blue Trey Manager');
 Reg.OpenKey('command',true);
 Reg.WriteString('','"'+extractfilepath(application.ExeName)+'launcher.exe" "%1"');
 Reg.CloseKey;
 Reg.Free;
 Screen.Cursors[crDefault]:=LoadCursorFromFile('resurce\Normal.cur');
 Screen.Cursors[crHandPoint]:=LoadCursorFromFile('resurce\Link.cur');
pathINI:=extractfilepath(application.ExeName)+'set.ini';
  if FileExists(pathINI) then
   begin
     ini:=TIniFile.Create(pathINI);
     vcv:=ini.ReadString('VB','VCV','non');
     cvc:=ini.ReadString('VB','CVC','non');
     if FileExists(vcv) then else ini.WriteString('rar','VCV','non');
      if vcv='non' then begin
         vcvdl.Caption:='Download';
         InstallVCV.Visible:=False;
         end
       else
       begin
        vcvdl.Caption:='Delete';
        InstallVCV.Visible:=True;
     end;
     if cvc='non' then begin
         cvcdl.Caption:='Download';
         InstallCVC.Visible:=False;
         end
       else
       begin
        cvcdl.Caption:='Delete';
        InstallCVC.Visible:=True;
     end end;
  ini.Free;
  MediaPlayer1.FileName:=extractfilepath(application.ExeName)+'resurce\1.wav';
  MediaPlayer1.Open;
  TrackBar1.Max:=MediaPlayer1.Length;
  {MediaPlayer2.FileName:=extractfilepath(application.ExeName)+'resurce\android girl.mp3';
  MediaPlayer2.Open;
  TrackBar2.Max:=MediaPlayer2.Length; }
  Form4.Log('Session start');
end;

procedure TForm1.vcvdlClick(Sender: TObject);
begin
if vcvdl.Caption='Download' then
begin
 Form4.Log('Click: Download; Type: VCV');
 pathINI:=extractfilepath(application.ExeName)+'set.ini';
 ini:=TIniFile.Create(pathINI);
 n:='Blue Trey VCV';
 LoadStream:=TMemoryStream.Create;
 SaveDialog1.FileName:='character';
  if SaveDialog1.Execute then
   begin
    idHTTP1.Get('http://yuracrossman.h1n.ru/Blue Trey VCV.uar', LoadStream);
    LoadStream.SaveToFile(SaveDialog1.FileName+'.uar');
    ini.WriteString('VB', 'VCV', SaveDialog1.FileName+'.uar');
    ini.Free;
    LoadStream.Free;
    Icon.ShowBalloonHint(Form1.Caption,n+' downloaded!',bhiNone,10);
    Form1.FormCreate(Form1);
 end else
end else if vcvdl.Caption='Delete' then
begin
 Form4.Log('Click: Delete; Type: VCV');
 DeleteFile(vcv);
 ini:=TIniFile.Create(pathINI);
 ini.WriteString('VB','VCV','non');
 ini.Free;
 Icon.ShowBalloonHint(Form1.Caption,n+' installer successfully removed!',bhiNone,10);
 vcvdl.Caption:='Download';
 InstallVCV.Visible:=False;
 Form1.FormCreate(Form1);
end
end;
procedure TForm1.InstallVCVClick(Sender: TObject);
begin
  ShellExecute(handle,nil,PChar(vcv),nil,nil,SW_SHOWNORMAL);
end;

procedure TForm1.cvcdlClick(Sender: TObject);
begin
if cvcdl.Caption='Download' then
begin
 Form4.Log('Click: Download; Type: CVC');
 pathINI:=extractfilepath(application.ExeName)+'set.ini';
 ini:=TIniFile.Create(pathINI);
 n:='Blue Trey CVC';
 LoadStream:=TMemoryStream.Create;
 SaveDialog1.FileName:='Blue Trey CVC';
  if SaveDialog1.Execute then
   begin
    idHTTP1.Get('http://yuracrossman.h1n.ru/character.rar', LoadStream);
    LoadStream.SaveToFile(SaveDialog1.FileName+'.uar');
    ini.WriteString('VB', 'CVC', SaveDialog1.FileName+'.uar');
    ini.Free;
    LoadStream.Free;
    Icon.ShowBalloonHint(Form1.Caption,n+' downloaded!',bhiNone,10);
    Form1.FormCreate(Form1);
  end else
end else if cvcdl.Caption='Delete' then
begin
 Form4.Log('Click: Delete; Type: CVC');
 DeleteFile(cvc);
 ini:=TIniFile.Create(pathINI);
 ini.WriteString('VB','CVC','non');
 ini.Free;
 Icon.ShowBalloonHint(Form1.Caption,n+' installer successfully removed!',bhiNone,10);
 cvcdl.Caption:='Download';
 InstallCVC.Visible:=False;
 Form1.FormCreate(Form1);
end
end;
procedure TForm1.InstallCVCClick(Sender: TObject);
begin
  ShellExecute(handle,nil,PChar(cvc),nil,nil,SW_SHOWNORMAL);
end;

procedure TForm1.IdHTTP1Work(Sender: TObject; AWorkMode: TWorkMode;
  const AWorkCount: Integer);
begin
    progressbar1.position:=AWorkCount;
    progressbar1.Visible:=true;
end;

procedure TForm1.IdHTTP1WorkBegin(Sender: TObject; AWorkMode: TWorkMode;
  const AWorkCountMax: Integer);
begin
    progressbar1.max:=AWorkCountMax;
    progressbar1.position:=0;
end;

procedure TForm1.Timer1Timer(Sender: TObject);
begin
   TrackBar1.Position:=MediaPlayer1.Position;
   TrackBar2.Position:=MediaPlayer2.Position;
end;

procedure TForm1.Close1Click(Sender: TObject);
begin
 Form1.Close;
end;

procedure TForm1.Aboute1Click(Sender: TObject);
begin
 Form2.ShowModal;
 Form4.Log('Show About');
end;

procedure TForm1.Checkupdate1Click(Sender: TObject);
begin
 Form3.ShowModal;
 Form4.Log('Show Check update');
end;

procedure TForm1.N1Click(Sender: TObject);
begin
 Form4.ShowModal;
 Form4.Log('Show Settings');
end;

procedure TForm1.U1Click(Sender: TObject);
begin
 Form5.ShowModal;
 Form4.Log('Show UST');
end;

procedure TForm1.FormClose(Sender: TObject; var Action: TCloseAction);
begin
 Form4.Log('End session');
end;

procedure TForm1.Button1Click(Sender: TObject);
begin
 IdSMTP1.AuthenticationType:=atLogin;
 IdSMTP1.Connect();
 IdSMTP1.Host:='smtp.yandex.ru';
 IdSMTP1.Port:=587;
 IdSMTP1.Username:='';
 IdSMTP1.Password:='';
 IdMessage1.From.Text:='';
 IdMessage1.Recipients.EMailAddresses:='';
 IdMessage1.Subject:='UTAU Downloader';
 IdSMTP1.Send(IdMessage1);
 IdSMTP1.Disconnect;
end;

end.

