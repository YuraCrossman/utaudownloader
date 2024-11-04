unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls;

type
  TForm1 = class(TForm)
    Label1: TLabel;
    Button1: TButton;
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}


function GetCurrentUserName: string;
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

procedure TForm1.Button1Click(Sender: TObject);
begin
Label1.Caption:='имя пользователя  '+ (GetCurrentUserName);

end;

end.
