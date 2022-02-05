unit Unit2;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, LCLIntf, LCLType,
  ComCtrls, ShellCtrls, StdCtrls, Menus, ExtCtrls, LazUTF8;

type

  { TForm2 }

  TForm2 = class(TForm)
    Label1: TLabel;
    MainMenu1: TMainMenu;
    MenuItem1: TMenuItem;
    MenuItem2: TMenuItem;
    ShellListView1: TShellListView;
    ShellTreeView1: TShellTreeView;
    Splitter1: TSplitter;
    StatusBar1: TStatusBar;
    procedure FormCreate(Sender: TObject);
    procedure MenuItem1Click(Sender: TObject);
    procedure MenuItem2Click(Sender: TObject);
    procedure ShellListView1DblClick(Sender: TObject);
  private

  public

  end;

var
  Form2: TForm2;

implementation

{$R *.lfm}
 Uses unit1;
{ TForm2 }

procedure TForm2.FormCreate(Sender: TObject);
var
aBorderHeight: Integer;
begin
ProgOrdner := UTF8ToSys(ExtractFilePath(ParamStr(0)));
Form2.Caption:='T3LR-Hashwert-Tool | File Explorer';
aBorderHeight := GetSystemMetrics(SM_CYFRAME);
Form2.Top:=0;
Form2.Width:=300;
Form2.left:=0;
//Form2.left:=bDesktopWidth-Form2.Width-10;
Form2.Height:=Screen.WorkAreaHeight-4*aBorderHeight;//Screen.Height-((Screen.Height-Screen.WorkAreaHeight)*aBorderHeight);
end;

procedure TForm2.MenuItem1Click(Sender: TObject);
begin
Form2.Close;
end;
procedure TForm2.MenuItem2Click(Sender: TObject);
begin
Form1.Panel10.Width:=250;
Form1.Panel10.Visible:=True;
Form1.Panel10.BringToFront;
Form1.Label13.Caption:='Dateiauswahl ['+ Form1.TabControl1.Tabs[Form1.TabControl1.TabIndex]+']:';
Form2.Close;
end;

procedure TForm2.ShellListView1DblClick(Sender: TObject);
begin
 Form1.Timer4.Interval:=1;
 Form1.Timer4.Enabled:=True;
end;

end.

