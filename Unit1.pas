unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ComCtrls, IdBaseComponent, IdComponent,
  IdTCPConnection, IdTCPClient, IdHTTP, IdAntiFreezeBase, IdAntiFreeze, MPlayer, inifiles,
  Gauges, UnRAR, ShellAPI;

type
  TForm1 = class(TForm)
    Button1: TButton;
    Label1: TLabel;
    ProgressBar1: TProgressBar;
    IdHTTP1: TIdHTTP;
    SaveDialog1: TSaveDialog;
    MediaPlayer1: TMediaPlayer;
    IdAntiFreeze1: TIdAntiFreeze;
    Label2: TLabel;
    Button2: TButton;
    Label3: TLabel;
    Label4: TLabel;
    procedure Button1Click(Sender: TObject);
    procedure IdHTTP1Work(Sender: TObject; AWorkMode: TWorkMode;
      const AWorkCount: Integer);
    procedure IdHTTP1WorkBegin(Sender: TObject; AWorkMode: TWorkMode;
      const AWorkCountMax: Integer);
    procedure FormCreate(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Label3Click(Sender: TObject);
    procedure Label4Click(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
  end;

  TRAROpenArchiveData = record
    ArcName: PChar;
    OpenMode: Word;
    OpenResult: Word;
    CmtBuf: PChar;
    CmtBufSize: Word;
    CmtSize: Word;
    CmtState: Word;
  end;
  TRARProcessFile = record
    hArcData: PChar;
    Operation: Word;
    DestPath: PChar;
    DestName: PChar;
  end;
  TRARHeaderData = record
    ArcName: array [0..259] of Char;
    FileName: array [0..259] of Char;
    Flags: Word;
    PackSize: Word;
    UnpSize: Word;
    HostOS: Word;
    FileCRC: Word;
    FileTime: Word;
    UnpVer: Word;
    Method: Word;
    FileAttr: Word;
    CmtBuf: PChar;
    CmtBufSize: Word;
    CmtSize: Word;
    CmtState: Word;
  end;

var
  Form1: TForm1;
  LoadStream: TMemoryStream;
  pathINI: string;
  ini: TIniFile;
  ifile: string;

implementation

{$R *.dfm}

function RAROpenArchive(var ArchiveDate:TRAROpenArchiveData):THandle; stdcall; external 'unrar.dll';
function RARCloseArchive(hArcData : THandle):integer; stdcall; external 'unrar.dll';
function RARReadHeader(hArcData:THandle;var HeaderData:TRARHeaderData):integer; stdcall; external 'unrar.dll';

procedure TForm1.FormCreate(Sender: TObject);
begin

pathINI:=extractfilepath(application.ExeName)+'set.ini';
  if FileExists(pathINI) then
   begin
     ini:=TIniFile.Create(pathINI);
     ifile:=ini.ReadString('rar','Save1','non');
     Label2.Visible:=false;
     Label2.Caption:=ifile;
      if Label2.Caption='non' then
       else
       begin
        Label2.Visible:=true;
        Label2.Caption:='File save in: '+ifile;
        Button1.Caption:='Delete';
        Button2.Visible:=True;
     ini.Free;
     end end
end;

procedure TForm1.Button1Click(Sender: TObject);
begin
if Button1.Caption='Download' then
begin
 pathINI:=extractfilepath(application.ExeName)+'set.ini';
 ini:=TIniFile.Create(pathINI);
 LoadStream:=TMemoryStream.Create;
 SaveDialog1.FileName:='character.rar';
  if SaveDialog1.Execute then
   begin
    idHTTP1.Get('http://bluetrey.000webhostapp.com/user-files/character.rar', LoadStream);
    LoadStream.SaveToFile(SaveDialog1.FileName);
    ini.WriteString('rar', 'Save1', SaveDialog1.FileName);
    ini.Free;
    LoadStream.Free;
    Form1.FormCreate(Form1);
  end else
end else if Button1.Caption='Delete' then
begin
 ini:=TIniFile.Create(pathINI);
 DeleteFile(ifile);
 ini.WriteString('rar','Save1','non');
 ini.Free;
 Button1.Caption:='Download';
 Button2.Visible:=false;
 Form1.FormCreate(Form1);
end
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

procedure ExtractRARArchive;
var RAROpenArchive1:TRAROpenArchiveData;
ProcessFile:TRARProcessFile;
CmtBuf:array [0..16384] of Char;
Handle:THandle;
RARHeaderData:TRARHeaderData;
s:string;
 RARhnd : Integer;
  RARrc : Integer;
begin
  RAROpenArchive1.OpenResult:=99;
  RarOpenArchive1.openmode:=RAR_OM_EXTRACT;
  RAROpenArchive1.arcname:=pchar(ifile);

  RARhnd := RAROpenArchive (RAROpenArchive1);
 if RAROpenArchive1.OpenResult <> 0 then
  begin
    case RAROpenArchive1.OpenResult of
      ERAR_NO_MEMORY   : s:='Not enough memory to initialize data structures';
      ERAR_BAD_DATA    : s:='Archive header broken';
      ERAR_BAD_ARCHIVE : s:='File is not valid RAR archive';
      ERAR_EOPEN       : s:='File open error';
    end;
    MessageDlg('Unable to open rar archive: ' + s + '!',mtError, [mbOK], 0);
  end;
  
end;

procedure TForm1.Button2Click(Sender: TObject);
begin
   ExtractRARArchive;
end;

procedure TForm1.Label3Click(Sender: TObject);
begin
  ShellExecute(0, 'open', 'https://vk.com/yuy_suyka', '', '', SW_SHOWNORMAL);
end;
procedure TForm1.Label4Click(Sender: TObject);
begin
  ShellExecute(0, 'open', 'https://bluetrey.000webhostapp.com/', '', '', SW_SHOWNORMAL);
end;

end.
