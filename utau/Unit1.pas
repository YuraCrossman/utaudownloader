unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, IdBaseComponent, IdComponent,
  IdTCPConnection, IdTCPClient, IdHTTP, IdAntiFreezeBase, IdAntiFreeze, MPlayer, inifiles,
  ShellAPI, OleCtrls, ExtCtrls, XPMan, sSkinManager, sSkinProvider, sDialogs,
  MMSystem, RzTray, Registry, acTitleBar, Menus, StdCtrls;

type
  TForm1 = class(TForm)
    Label1: TLabel;
    IdHTTP1: TIdHTTP;
    SaveDialog1: TSaveDialog;
    IdAntiFreeze1: TIdAntiFreeze;
    Button2: TButton;
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
    Button3: TButton;
    MediaPlayer2: TMediaPlayer;
    Button4: TButton;
    MediaPlayer1: TMediaPlayer;
    Button1: TButton;
    TrackBar2: TTrackBar;
    ProgressBar1: TProgressBar;
    sSkinManager1: TsSkinManager;
    sSkinProvider1: TsSkinProvider;
    sSaveDialog1: TsSaveDialog;
    sTitleBar1: TsTitleBar;
    Icon: TRzTrayIcon;
    procedure Button1Click(Sender: TObject);
    procedure IdHTTP1Work(Sender: TObject; AWorkMode: TWorkMode;
      const AWorkCount: Integer);
    procedure IdHTTP1WorkBegin(Sender: TObject; AWorkMode: TWorkMode;
      const AWorkCountMax: Integer);
    procedure FormCreate(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Label3Click(Sender: TObject);
    procedure Label4Click(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure Close1Click(Sender: TObject);
    procedure Aboute1Click(Sender: TObject);
    procedure Checkupdate1Click(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;
  LoadStream: TMemoryStream;
  pathINI: string;
  ini: TIniFile;
  Reg:TRegistry;
  n: string;
  vcv: string;
  cvc: string;

implementation

uses about, Unit3;

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
pathINI:=extractfilepath(application.ExeName)+'set.ini';
  if FileExists(pathINI) then
   begin
     ini:=TIniFile.Create(pathINI);
     vcv:=ini.ReadString('rar','Save1','non');
     cvc:=ini.ReadString('rar','Save2','non');
      if vcv='non' then begin
         Button1.Caption:='Download';
         Button2.Visible:=False;
         end
       else
       begin
        Button1.Caption:='Delete';
        Button2.Visible:=True;
     end;
     if cvc='non' then begin
         Button3.Caption:='Download';
         Button4.Visible:=False;
         end
       else
       begin
        Button3.Caption:='Delete';
        Button4.Visible:=True;
     end end; ini.Free;
  MediaPlayer1.FileName:=extractfilepath(application.ExeName)+'resurce\1.mp3';
  MediaPlayer1.Open;
  TrackBar1.Max:=MediaPlayer1.Length;
  {MediaPlayer2.FileName:=extractfilepath(application.ExeName)+'resurce\';
  MediaPlayer2.Open;
  TrackBar2.Max:=MediaPlayer2.Length; }
end;

procedure TForm1.Button1Click(Sender: TObject);
begin
if Button1.Caption='Download' then
begin
 pathINI:=extractfilepath(application.ExeName)+'set.ini';
 ini:=TIniFile.Create(pathINI);
 n:='Blue Trey VCV';
 LoadStream:=TMemoryStream.Create;
 sSaveDialog1.FileName:='Blue Trey VCV';
  if sSaveDialog1.Execute then
   begin
   try
    idHTTP1.Get('http://yuracrossman.h1n.ru/Blue Trey VCV.uar', LoadStream);
    LoadStream.SaveToFile(sSaveDialog1.FileName+'.uar');
    ini.WriteString('rar', 'Save1', sSaveDialog1.FileName+'.uar');
    ini.Free;
    LoadStream.Free;
    Icon.ShowBalloonHint(Form1.Caption,n+' downloaded!',bhiNone,10);
    Form1.FormCreate(Form1);
    except messageDlg('Voice Bank does not exist!',mtError,[mbOK],0);
 end end else
end else if Button1.Caption='Delete' then
begin
 DeleteFile(vcv);
 ini:=TIniFile.Create(pathINI);
 ini.WriteString('rar','Save1','non');
 ini.Free;
 Icon.ShowBalloonHint(Form1.Caption,n+' installer successfully removed!',bhiNone,10);
 Button1.Caption:='Download';
 Button2.Visible:=False;
 Form1.FormCreate(Form1);
end
end;
procedure TForm1.Button2Click(Sender: TObject);
begin
  ShellExecute(handle,nil,PChar(vcv),nil,nil,SW_SHOWNORMAL);
end;

procedure TForm1.Button3Click(Sender: TObject);
begin
if Button3.Caption='Download' then
begin
 pathINI:=extractfilepath(application.ExeName)+'set.ini';
 ini:=TIniFile.Create(pathINI);
 n:='Blue Trey CVC';
 LoadStream:=TMemoryStream.Create;
 sSaveDialog1.FileName:='character.rar';
  if sSaveDialog1.Execute then
   begin
    idHTTP1.Get('http://bluetrey.000webhostapp.com/user-files/character.rar', LoadStream);
    LoadStream.SaveToFile(sSaveDialog1.FileName);
    ini.WriteString('rar', 'Save2', sSaveDialog1.FileName);
    ini.Free;
    LoadStream.Free;
    Icon.ShowBalloonHint(Form1.Caption,n+' downloaded!',bhiNone,10);
    Form1.FormCreate(Form1);
  end else
end else if Button3.Caption='Delete' then
begin
 DeleteFile(cvc);
 ini:=TIniFile.Create(pathINI);
 ini.WriteString('rar','Save2','non');
 ini.Free;
 Icon.ShowBalloonHint(Form1.Caption,n+' installer successfully removed!',bhiNone,10);
 Button1.Caption:='Download';
 Button2.Visible:=False;
 Form1.FormCreate(Form1);
end
end;
procedure TForm1.Button4Click(Sender: TObject);
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
    progressbar1.position:=0;
    progressbar1.max:=AWorkCountMax;
end;

procedure TForm1.Label3Click(Sender: TObject);
begin
  ShellExecute(0, 'open', 'https://vk.com/yuy_suyka', '', '', SW_SHOWNORMAL);
end;
procedure TForm1.Label4Click(Sender: TObject);
begin
  ShellExecute(0, 'open', 'https://bluetrey.000webhostapp.com/', '', '', SW_SHOWNORMAL);
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
end;

procedure TForm1.Checkupdate1Click(Sender: TObject);
begin
 Form3.ShowModal;
end;

end.

