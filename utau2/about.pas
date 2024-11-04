unit about;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, IniFiles;

type
  TForm2 = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    procedure FormDeactivate(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form2: TForm2;

implementation

{$R *.dfm}

procedure TForm2.FormDeactivate(Sender: TObject);
begin
 Form2.Close;
end;

procedure TForm2.FormCreate(Sender: TObject);
var pathINI: string; ini: TIniFile;
begin
 pathINI:=extractfilepath(application.ExeName)+'set.ini';
 ini:=TIniFile.Create(pathINI);
 ini.WriteString('ui','ver','0.4');
 Label3.Caption:='Version '+ini.ReadString('ui','ver','');
end;

end.
