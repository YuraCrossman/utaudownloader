{
 Author Yura Crossman
 yes, random phahaha, funny
}

unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Mask, sMaskEdit, sCustomComboEdit, sToolEdit,
  ExtCtrls, sLabel, ShellAPI, sSkinProvider, sSkinManager, TlHelp32,
  ComCtrls, acProgressBar, XPMan, sGauge, Math, MMSystem;

type
  TForm1 = class(TForm)
    sSkinManager1: TsSkinManager;
    sSkinProvider1: TsSkinProvider;
    Timer1: TTimer;
    Timer2: TTimer;
    ProgressBar2: TProgressBar;
    sGauge1: TsGauge;
    Timer3: TTimer;
    procedure Timer1Timer(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Timer2Timer(Sender: TObject);
    procedure Timer3Timer(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;
  p: string;
  y:integer;

implementation

{$R *.dfm}

procedure TForm1.Timer1Timer(Sender: TObject);
begin
  y:=RandomRange(17,100);
  Timer1.Interval:=y;
  sGauge1.Progress:=sGauge1.Progress + 1;
  if sGauge1.Progress = 100 then begin ProgressBar2.Position:=100; Timer1.Enabled:=False; PlaySound(PChar('SYSTEMSTART'), 0, SND_ASYNC); end
end;

procedure TForm1.Timer2Timer(Sender: TObject);
begin
  if ProgressBar2.Position = 100 then begin
    Timer2.Enabled:=False;
    ShellExecute(handle, 'runas', PChar(p), nil, nil, SW_SHOWNORMAL);
    Form1.Close;
  end
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
 p:=extractfilepath(application.ExeName)+'utaudl.exe';
end;

procedure TForm1.Timer3Timer(Sender: TObject);
begin
 if Form1.AlphaBlendValue < 255 then Form1.AlphaBlendValue:= Form1.AlphaBlendValue + 5 else Timer3.Enabled:=False;
end;

end.