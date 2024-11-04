unit Unit6;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, sButton, sLabel, sGauge, INIFiles;

type
  TForm6 = class(TForm)
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form6: TForm6;
  i: integer;
  LoadStream: TMemoryStream;
  pathINI: string;
  ini: TIniFile;
  n: string;
  vcv: string;
  cvc: string;


implementation

uses Unit1;

{$R *.dfm}

procedure TForm6.FormCreate(Sender: TObject);
begin
  for i:=0 to ParamCount do
  begin
    if ParamStr(i)='utaudl:vcv' then
      begin
        if Form1.vcvdl.Caption='Download' then
          begin
            Form1.Show;
            Form1.vcvdlClick(Self);
          end
      end
    else if ParamStr(i)='utaudl:cvc' then
      begin
        if Form1.cvcdl.Caption='Download' then
          begin
            Form1.Show;
            Form1.cvcdlClick(Self);
          end;
      end;
  end;
end;

end.

