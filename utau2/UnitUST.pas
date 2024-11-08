unit UnitUST;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, Grids, DBGrids, ADODB, Menus, StdCtrls, DBCtrls,
  acDBGrid, ExtCtrls, sPanel, sDBNavigator, ShellApi;

type
  TForm5 = class(TForm)
    ADOConnection1: TADOConnection;
    ADOTable1: TADOTable;
    DataSource1: TDataSource;
    sDBNavigator1: TsDBNavigator;
    sDBGrid1: TsDBGrid;
    PopupMenu1: TPopupMenu;
    OpenCover1: TMenuItem;
    LinkCover: TDBMemo;
    LinkUST: TDBMemo;
    PopupMenu2: TPopupMenu;
    MenuItem1: TMenuItem;
    procedure A1Click(Sender: TObject);
    procedure C1Click(Sender: TObject);
    procedure OpenCover1Click(Sender: TObject);
    procedure MenuItem1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form5: TForm5;
  LoadStream: TMemoryStream;

implementation

uses about, Unit1;

{$R *.dfm}

procedure TForm5.A1Click(Sender: TObject);
begin
  Form2.ShowModal;
end;

procedure TForm5.C1Click(Sender: TObject);
begin
  Form5.Close;
end;

procedure TForm5.OpenCover1Click(Sender: TObject);
begin
  ShellExecute(handle,nil,PChar(LinkCover.Text),nil,nil,SW_SHOWNORMAL);
end;

procedure TForm5.MenuItem1Click(Sender: TObject);
begin
  ShellExecute(handle,nil,PChar(LinkUST.Text),nil,nil,SW_SHOWNORMAL);
end;

procedure TForm5.FormCreate(Sender: TObject);
begin
  ADOConnection1.ConnectionString:='Provider=Microsoft.Jet.OLEDB.4.0;Data Source='+extractfilepath(application.ExeName)+'ust;Persist Security Info=False;Jet OLEDB:Database Password=;';
  ADOConnection1.Connected:=True;
  ADOTable1.Active:=True;
end;

end.
