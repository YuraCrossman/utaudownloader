program utaudl;

uses
  Forms,
  Unit1 in 'Unit1.pas' {Form1},
  about in 'about.pas' {Form2},
  Unit3 in 'Unit3.pas' {Form3},
  UnitSet in 'UnitSet.pas' {Form4},
  UnitUST in 'UnitUST.pas' {Form5},
  Unit6 in 'Unit6.pas' {Form6};

{$R *.res}

begin
  Application.Initialize;
  Application.Title := 'Blue Trey Download Manager';
  Application.CreateForm(TForm1, Form1);
  Application.CreateForm(TForm2, Form2);
  Application.CreateForm(TForm3, Form3);
  Application.CreateForm(TForm4, Form4);
  Application.CreateForm(TForm5, Form5);
  Application.CreateForm(TForm6, Form6);
  Application.Run;
end.
