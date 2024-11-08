unit UnitSet;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, iniFiles, StdCtrls, sLabel, ComCtrls, sComboBoxes, sSkinManager;

type
  TForm4 = class(TForm)
    sSkinSelector1: TsSkinSelector;
    sLabel1: TsLabel;
    SManager: TsSkinManager;
    procedure FormCreate(Sender: TObject);
    procedure SManagerSkinChanging(Sender: TObject;
      const NewSkinName: String; var AllowChanging: Boolean);
  private
    { Private declarations }
  public
    { Private declarations }
    procedure Log(Text:string);
  end;

var
  Form4: TForm4;
  pathINI: string;
  ini: TIniFile;
  sett: string;

implementation

uses Unit1;

{$R *.dfm}

function ComputerName: string;
var
  Buf: array[0..Windows.MAX_COMPUTERNAME_LENGTH] of Char;
  BufSize: Windows.DWORD;
begin
  BufSize := SizeOf(Buf);
  if Windows.GetComputerName(Buf, BufSize) then
    Result := Buf
  else
    Result := '';
end;

function UserName: string;
 const
   cnMaxUserNameLen = 254;
 var
   sUserName: string;
   dwUserNameLen: DWORD;
 begin
   dwUserNameLen := cnMaxUserNameLen - 1;
   SetLength(sUserName, cnMaxUserNameLen);
   GetUserName(PChar(sUserName), dwUserNameLen);
   SetLength(sUserName, dwUserNameLen);
   Result := sUserName;
 end;

procedure TForm4.FormCreate(Sender: TObject);
begin
  pathINI:=extractfilepath(application.ExeName)+'set.ini';
    if FileExists(pathINI) then
      begin
        ini:=TIniFile.Create(pathINI);
        SManager.SkinName:=ini.ReadString('ui','Style','');
      end;
  ini.Free;
end;

procedure TForm4.SManagerSkinChanging(Sender: TObject;
  const NewSkinName: String; var AllowChanging: Boolean);
begin
  sett:=SManager.SkinName;
  pathINI:=extractfilepath(application.ExeName)+'set.ini';
    if FileExists(pathINI) then
      begin
        ini:=TIniFile.Create(pathINI);
        ini.WriteString('ui','Style',sett);
      end;
  Form4.Log('Settings: change skin '+sett);
end;

procedure TForm4.Log(Text:string);
var F: TextFile; FileName: String; dt: String;
begin
  FileName:=ExtractFilePath(Application.ExeName)+'log.txt';
  AssignFile(F, FileName);
  if FileExists(FileName) then Append(F)
  else
  Rewrite(F);
  dt:=DateToStr(Date);
  dt:=ComputerName+' / '+UserName+' / '+dt+' / '+TimeToStr(Time);
  WriteLn(F,dt,' : ',text);
  CloseFile(F);
end;

end.
