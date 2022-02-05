unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, LCLIntf, LCLType,
  ComCtrls, StdCtrls, Menus, Buttons, ExtCtrls, Types, Printers, Grids, Process,
  Translations, LazUTF8, md5, Windows, Clipbrd, ActnList, EditBtn, FileCtrl,
  ShellCtrls, HlpIHashInfo, HlpHashFactory;

type

  { TForm1 }

  TForm1 = class(TForm)
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    Button6: TButton;
    CheckBox1: TCheckBox;
    Edit1: TEdit;
    Edit2: TEdit;
    Edit3: TEdit;
    Edit4: TEdit;
    Edit5: TEdit;
    Edit6: TEdit;
    Edit7: TEdit;
    Image1: TImage;
    Label1: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    ListBox1: TListBox;
    MainMenu1: TMainMenu;
    Memo1: TMemo;
    Memo2: TMemo;
    Memo3: TMemo;
    Memo4: TMemo;
    Memo5: TMemo;
    MenuItem1: TMenuItem;
    MenuItem2: TMenuItem;
    MenuItem3: TMenuItem;
    MenuItem4: TMenuItem;
    MenuItem5: TMenuItem;
    MenuItem6: TMenuItem;
    MenuItem7: TMenuItem;
    MenuItem8: TMenuItem;
    OpenDialog1: TOpenDialog;
    Panel1: TPanel;
    Panel10: TPanel;
    Panel11: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    Panel4: TPanel;
    Panel5: TPanel;
    Panel6: TPanel;
    Panel7: TPanel;
    Panel8: TPanel;
    Panel9: TPanel;
    PopupMenu1: TPopupMenu;
    SaveDialog1: TSaveDialog;
    ScrollBox1: TScrollBox;
    ShellListView1: TShellListView;
    ShellTreeView1: TShellTreeView;
    SpeedButton1: TSpeedButton;
    Splitter1: TSplitter;
    StringGrid1: TStringGrid;
    TabControl1: TTabControl;
    Timer1: TTimer;
    Timer2: TTimer;
    Timer3: TTimer;
    Timer4: TTimer;
    Timer5: TTimer;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button6Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure ListBox1Click(Sender: TObject);
    procedure ListBox1MouseLeave(Sender: TObject);
    procedure MenuItem1Click(Sender: TObject);
    procedure MenuItem2Click(Sender: TObject);
    procedure MenuItem3Click(Sender: TObject);
    procedure MenuItem4Click(Sender: TObject);
    procedure MenuItem5Click(Sender: TObject);
    procedure MenuItem6Click(Sender: TObject);
    procedure MenuItem7Click(Sender: TObject);
    procedure MenuItem8Click(Sender: TObject);
    procedure Panel11Click(Sender: TObject);
    procedure Panel11MouseLeave(Sender: TObject);
    procedure Panel11MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure Panel8DblClick(Sender: TObject);
    procedure ShellListView1DblClick(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure TabControl1Change(Sender: TObject);
    procedure TabControl1MouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure Timer1Timer(Sender: TObject);
    procedure Timer2Timer(Sender: TObject);
    procedure Timer3Timer(Sender: TObject);
    procedure Timer4Timer(Sender: TObject);
    procedure Timer5Timer(Sender: TObject);
  private

  public
    procedure hashalgo(algo:Integer;filname:String);
  end;

var
  Form1: TForm1;
  ProgOrdner:String;
  PODirectory:String;
  InitDirectory:String;
  BoxStyle: Integer;
  Reply: Integer;
  BaseFile:String;
  MyResult:String;
  xitem:Integer;

implementation

{$R *.lfm}
Uses Unit2;
{ TForm1 }

procedure TForm1.FormCreate(Sender: TObject);
var
f: TextFile;
io: integer;
begin
  ProgOrdner := UTF8ToSys(ExtractFilePath(ParamStr(0)));
  PODirectory:=ProgOrdner;
  InitDirectory:=ProgOrdner;
  TranslateUnitResourceStrings('LCLStrConsts',PODirectory+'lclstrconsts.%s.po','de','');
  Edit3.Text:=ProgOrdner;
  Form1.Height:=380;
  Form1.Width:=550;
  Memo5.Text:='';
  TabControl1.TabIndex:=0;
  TabControl1Change(nil);
  Listbox1.Clear;
  Listbox1.Items.Add('MD5');//0+7
  Listbox1.Items.Add('SHA1');//1+9
  Listbox1.Items.Add('SHA2-256');//2+11
  Listbox1.Items.Add('SHA2-512');//3+13
  Listbox1.Items.Add('----------------');//4.....
  Listbox1.Items.Add('MD2');//5
  Listbox1.Items.Add('MD4');//6
  Listbox1.Items.Add('MD5');//0+7
  Listbox1.Items.Add('SHA0');//8
  Listbox1.Items.Add('SHA1');//1+9
  Listbox1.Items.Add('SHA2-224');//10
  Listbox1.Items.Add('SHA2_256');//2+11
  Listbox1.Items.Add('SHA2-384');//12
  Listbox1.Items.Add('SHA2-512');//3+13
  Listbox1.Items.Add('SHA2-512-224');//14
  Listbox1.Items.Add('SHA2-512-256');//15
  Listbox1.Items.Add('SHA3-224');//16
  Listbox1.Items.Add('SHA3-256');//17
  Listbox1.Items.Add('SHA3-384');//18
  Listbox1.Items.Add('SHA3_512');//19
  Listbox1.Items.Add('GOST');//20
  Listbox1.Items.Add('HAS160');//21
  Listbox1.Items.Add('Panama');//22
  Listbox1.Items.Add('RIPEMD');//23
  Listbox1.Items.Add('RIPEMD128');//24
  Listbox1.Items.Add('RIPEMD160');//25
  Listbox1.Items.Add('RIPEMD256');//26
  Listbox1.Items.Add('RIPEMD320');//27
  Listbox1.Items.Add('WhirlPool');//28
  ShellTreeView1.Path:=InitDirectory;

  //Einstellen des Startwertes für die Algorithmusauswahl

  If FileExists(ProgOrdner+'t3lrhashtoll.ini')=False then
  begin
  AssignFile(f, ProgOrdner+'t3lrhashtoll.ini');
  Rewrite(f);
  WriteLn(f, '"Start Hash Algorithmus"=0="Verwendet den entsprechenden Algorithmuseintrag beim Start"'); //Erste Tetxzeile ...
  CloseFile(f);
  io := IOResult;
  if io <> 0 then begin
  ShowMessage('Fehler: ' + IntToStr(io));
  end;
  StringGrid1.LoadFromCSVFile(ProgOrdner+'t3lrhashtoll.ini', '=', True, 0);
  Listbox1.ItemIndex:=StrToInt(StringGrid1.Cells[1,0]);
  xitem:=StrToInt(StringGrid1.Cells[1,0]);
  ListBox1Click(nil);
  end
  else
  begin
  StringGrid1.LoadFromCSVFile(ProgOrdner+'t3lrhashtoll.ini', '=', True, 0);
  Listbox1.ItemIndex:=StrToInt(StringGrid1.Cells[1,0]);
  xitem:=StrToInt(StringGrid1.Cells[1,0]);
  ListBox1Click(nil);
  end;
end;

procedure TForm1.ListBox1Click(Sender: TObject);
var
  i:Integer;
begin
  If Listbox1.ItemIndex<>4 then
  begin
  Panel8.Caption:='Algoritmus: ' + Listbox1.Items[Listbox1.ItemIndex];//'Algoritmus: ' + Listbox1.Items[Listbox1.ItemIndex];
  xitem:=Listbox1.ItemIndex;
  end
  else
  begin
  Listbox1.ItemIndex:=xitem;
  end;
  end;

procedure TForm1.ListBox1MouseLeave(Sender: TObject);
begin
  Panel7.Visible:=False;
end;

procedure TForm1.MenuItem1Click(Sender: TObject);
begin
Application.Terminate;
end;

procedure TForm1.MenuItem2Click(Sender: TObject);
var
ta,tb,tz,tx:string;
jetzt:TDateTime;
i:Integer;
begin
  i:=TabControl1.TabIndex;
  jetzt:=now;
  ta:=FormatDateTime('yyyymmdd',jetzt);
  tb:=FormatDateTime('dd.mm.yyyy',jetzt);
  tz:=FormatDateTime('hhmmss',jetzt);
  tx:=FormatDateTime('hh:mm:ss',jetzt);
  Panel7.Visible:=False;
  Panel10.Visible:=False;
  Panel4.Visible:=True;
  Panel5.Visible:=True;
  Panel6.Visible:=True;
  Label7.Caption:='T3LR-Hashwert-Tool | Bereich: ' + TabControl1.Tabs.ValueFromIndex[i] + ' | Algorithmus: '+Listbox1.Items[ListBox1.ItemIndex];
  Label8.Caption:='Screenshot: '+ tb + ', ' +tx+ ' Uhr'+' | '+ta+tz;
  Timer1.Interval:=10;
  Timer1.Enabled:=True;
end;

procedure TForm1.MenuItem3Click(Sender: TObject);
var
ta,tb,tz,tx:string;
jetzt:TDateTime;
i:Integer;
begin
  i:=TabControl1.TabIndex;
  jetzt:=now;
  ta:=FormatDateTime('yyyymmdd',jetzt);
  tb:=FormatDateTime('dd.mm.yyyy',jetzt);
  tz:=FormatDateTime('hhmmss',jetzt);
  tx:=FormatDateTime('hh:mm:ss',jetzt);
  Panel7.Visible:=False;
  Panel10.Visible:=False;
  Panel4.Visible:=True;
  Panel5.Visible:=True;
  Panel6.Visible:=True;
  Label7.Caption:=Form1.Caption + ' | Bereich: ' + TabControl1.Tabs.ValueFromIndex[i];
  Label8.Caption:='Screenshot: '+ tb + ', ' +tx+ ' Uhr'+' | '+ta+tz;
  Timer2.Interval:=10;
  Timer2.Enabled:=True;
end;

procedure TForm1.MenuItem4Click(Sender: TObject);
begin
  if Panel7.Visible=False then
  begin
   Panel7.Visible:=True;
   ScrollBox1.VertScrollBar.Position:=0;
  end
  else
  begin
  Panel7.Visible:=False;
  end;
end;

procedure TForm1.MenuItem5Click(Sender: TObject);
begin
  Memo5.Clear;
  Label10.Caption:='GNU GENERAL PUBLIC LICENSE';
  Memo5.Lines.LoadFromFile(ProgOrdner+'gnulizenz.txt');
  Panel10.Visible:=False;
  Panel9.Visible:=True;
  Memo5.SelStart:= 0;
  Memo5.SelLength:= 0;
end;

procedure TForm1.MenuItem6Click(Sender: TObject);
var
i:Integer;
s:String;
begin
s:='';
For i:=5 to ListBox1.Count-1 do
begin
s:=s+ListBox1.Items[i]+#13#10;
end;
Memo5.Clear;
Label10.Caption:='Programm-Info';
Memo5.Text:=#13#10+Form1.Caption+#13#10#13#10+
'Autor: Dipl.Ök. Jan Elsässer'+#13#10#13#10+
'Lizenz: GNU GENERAL PUBLIC LICENSE [Siehe Menüpunkt Lizenz]'+#13#10#13#10+
'Diese Tool dient zur Erstellung und Verifikation von kryptographischen Schlüsseln [Hashfunktion] zur Überprüfung von Dateien auf Manipulationen.'+#13#10#13#10+
'Hinweis:'+#13#10+
'MD5 gilt heute als nicht mehr ausreichend sicher.'+#13#10+
'Nachdem Anfang 2017 eine erfolgreiche Kollisionsattacke auf SHA-1 durchgeführt wurde, gelten heute noch SHA-256 oder SHA-3 als sichere Alternativen zu MD5.'+#13#10#13#10+
'Das T3LR-Hashwert-Tool unterstützt folgende Crypto-Schlüssel:'+#13#10+ s;
Panel10.Visible:=False;
Panel9.Visible:=True;
Memo5.SelStart:= 0;
Memo5.SelLength:= 0;
end;

procedure TForm1.MenuItem7Click(Sender: TObject);
begin
Form2.Show;
Form2.ShellTreeView1.Path:=InitDirectory;
Form2.StatusBar1.Panels.Items[1].Text:=InitDirectory;
Form2.Label1.Caption:=Label13.Caption;
Panel10.Width:=10;
end;

procedure TForm1.MenuItem8Click(Sender: TObject);
begin
If Listbox1.ItemIndex<>4 then
begin
StringGrid1.Cells[1,0]:=IntToStr(Listbox1.ItemIndex);
StringGrid1.SaveToCSVFile(ProgOrdner+'t3lrhashtoll.ini', '=', True, False);
end
else
begin
showmessage('Kein speicherbarer Wert setzbar!')
end;
end;

procedure TForm1.Panel11Click(Sender: TObject);
var
s:String;
begin
  If Panel10.Width<20 then
  begin
  Panel10.Width:=250;
  Panel10.BringToFront;
  Panel10.Visible:=True;
  end
  else
  begin
  Panel10.Width:=10;
  end;
  Label13.Caption:='Dateiauswahl ['+ TabControl1.Tabs[TabControl1.TabIndex]+']:';
end;

procedure TForm1.Panel11MouseLeave(Sender: TObject);
begin
  Panel11.Color:=clDefault;
end;

procedure TForm1.Panel11MouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
Panel11.Color:=clSilver; //clMedGray
Panel11.Cursor:=crHSplit;
//Panel11.Color:=clDefault;
end;

procedure TForm1.Panel8DblClick(Sender: TObject);
begin
 if Panel7.Visible=False then
 begin
  Panel7.Visible:=True;
  ScrollBox1.VertScrollBar.Position:=0;
 end
 else
 begin
 Panel7.Visible:=False;
 end;
end;

procedure TForm1.ShellListView1DblClick(Sender: TObject);
var
Filename,Filepath,Fileextend,Hashnamer:String;
a,b:String;
jefile:String;
begin
  jefile:=ShellTreeView1.Path + '\' + ShellListView1.Selected.Caption;

  If TabControl1.TabIndex=0 then //Hashwert prüfen --> Button1
  begin
  if FileExists(jefile)=True then
  begin
  BaseFile:=jefile;
  Memo1.Clear;
  hashalgo(Listbox1.ItemIndex,jefile); // MyResult
  Memo1.Text:= MyResult;
  Filepath:=ExtractFilePath(jefile);
  Filename:=ExtractFilename(jefile);
  Fileextend:=ExtractFileExt(jefile);
  Hashnamer:=StringReplace(Filename,Fileextend,'.hash',[]);
  Memo2.Clear;
  if (FileExists(Filepath+Hashnamer)=True) and (Checkbox1.Checked=True)  then
  begin
  Memo2.Lines.LoadFromFile(Filepath+Hashnamer);
  Button3.Visible:=False;
  a:= Trim(UpCase(Memo1.Text));
  b:= Trim(UpCase(Memo2.Text));
  If Pos(a,b)>0 then   //Trim(Memo1.Text)= Trim(Memo2.Text) then
  begin
  Memo4.Font.Color:=clGreen;
  Label2.Caption:='Die Hashwert-Prüfung wurde ageschlossen.';
  Memo4.Text:='Die überprüfte Datei:'+#13#10+#13#10+'-|> File: "'+BaseFile+'"'+#13#10+'-|> HashFile: "'+Filepath+Hashnamer+'"'+#13#10+#13#10+'... wurde NICHT manipuliert und kann verwendet werden.'+#13#10#13#10+FormatDateTime('DD.MM.YYYY | hh:mm:ss',Now)+' Uhr | ' + FormatDateTime('YYYYMMDDhhmmss',Now);
  Edit5.Text:='Hashwert: '+Trim(Memo1.Text);
  end
  else
  begin
  Memo4.Font.Color:=clRed;
  Label2.Caption:='Die Hashwert-Prüfung wurde ageschlossen.';
  Memo4.Text:='ACHTUNG - Die überprüfte Datei:'+#13#10+#13#10+'-|> File: "'+BaseFile+'"'+#13#10+'-|> HashFile: "'+Filepath+Hashnamer+'"'+#13#10+#13#10+'... konnte nicht erfolgreich verifiziert werden!'+#13#10#13#10+FormatDateTime('DD.MM.YYYY | hh:mm:ss',Now)+' Uhr | ' + FormatDateTime('YYYYMMDDhhmmss',Now);                        ;
  end;
  Button3.Visible:=False;
  end
  else
  begin
  Button3.Visible:=True;
  Memo4.Font.Color:=clDefault;
  Memo4.Text:='Bitte wählen Sie die Hash-Wert-Datei aus.';
  end;
  end;
  Panel10.Width:=10;
  end;

  If TabControl1.TabIndex=1 then //Hashwert erstellen --> Button2
  begin
  if FileExists(jefile)=True then
  begin
  Memo1.Clear;
  hashalgo(Listbox1.ItemIndex,jefile); // MyResult
  Memo1.Text:= UpCase(MyResult);
  Filename:=ExtractFilename(jefile);
  Fileextend:=ExtractFileExt(jefile);
  Hashnamer:=StringReplace(Filename,Fileextend,'',[]);
  Memo1.Lines.SaveToFile(ProgOrdner+Hashnamer+'.hash');
  Label1.Caption:='Der Hashwert ('+Listbox1.Items[Listbox1.ItemIndex]+') wurde für die Datei:';
  Edit1.Text:=jefile;
  Label3.Caption:='erzeugt und unter:';
  Edit2.Text:=ProgOrdner+Hashnamer+'.hash';
  Label5.Caption:='abgelegt.';
  Edit5.Text:='Hashwert: '+Trim(Memo1.Text);
  end;
  Panel10.Width:=10;
  end;

  If TabControl1.TabIndex=2 then //Hashwert ermitteln --> Button4
  begin
  if FileExists(jefile)=True then
  begin
  InitDirectory:=ExtractFilePath(jefile);
  BaseFile:=jefile;
  Edit4.Clear;
  hashalgo(Listbox1.ItemIndex,jefile);
  Edit4.Text:= UpCase(MyResult);
  Label4.Font.Color:=clDefault;
  Label9.Font.Color:=clDefault;
  Label11.Font.Color:=clDefault;
  Edit6.Text:=Listbox1.Items[Listbox1.ItemIndex];
  Edit5.Text:='Hashwert: '+Trim(Edit4.Text);
  Edit7.Text:=IntToStr(Length(Trim(Edit4.Text)));
  If Length(Trim(Edit4.Text))>55 then Label12.Visible:=True
  else
  Label12.Visible:=False;
  end;
  Panel10.Width:=10;
  end;
end;

procedure TForm1.SpeedButton1Click(Sender: TObject);
begin
Form2.Show;
Form2.ShellTreeView1.Path:=InitDirectory;
Form2.StatusBar1.Panels.Items[1].Text:=InitDirectory;
Form2.Label1.Caption:=Label13.Caption;
Panel10.Width:=10;
end;

procedure TForm1.TabControl1Change(Sender: TObject);
begin
  Edit5.Text:='';
  If TabControl1.TabIndex=2 then //Hashwert ermitteln
  begin
  Label6.Caption:='Bitte wählen Sie die Datei aus für die der Hashwert ermittelt werden soll...';
  Panel3.Visible:=True;
  Panel2.Visible:=False;
  Panel1.Visible:=False;
  Checkbox1.Enabled:=False;
  Label4.Font.Color:=clWhite;
  Label9.Font.Color:=clWhite;
  Label11.Font.Color:=clWhite;
  Edit5.Text:='';
  Edit4.Text:='';
  Edit6.Text:='';
  Edit7.Text:='';
  Label12.Visible:=False;
  Panel3.SendToBack;
  //Checkbox1.Visible:=False;
  //Edit3.Left:=15;
  end;
  If TabControl1.TabIndex=1 then //Hashwert erstellen
  begin
  Label1.Caption:='Bitte wählen Sie die Datei aus für die der Hashwert erstellt werden soll...';
  Label3.Caption:='';
  Label5.Caption:='';
  Edit1.Text:='';
  Edit2.Text:='';
  Panel1.Visible:=True;
  Panel2.Visible:=False;
  Panel3.Visible:=False;
  Checkbox1.Enabled:=False;
  Label4.Font.Color:=clWhite;
  Label9.Font.Color:=clWhite;
  Label11.Font.Color:=clWhite;
  Edit5.Text:='';
  Edit4.Text:='';
  Edit6.Text:='';
  Edit7.Text:='';
  Label12.Visible:=False;
  Panel1.SendToBack;
  //Checkbox1.Visible:=False;
  //Edit3.Left:=15;
  end;
  If TabControl1.TabIndex=0 then //Hashwert prüfen
  begin
  Label2.Caption:='Bitte wählen Sie die zu überprüfende Datei aus ...';
  Memo4.Text:='';
  Button3.Visible:=False;
  Panel2.Visible:=True;
  Panel3.Visible:=False;
  Panel1.Visible:=False;
  Checkbox1.Enabled:=True;
  Label4.Font.Color:=clWhite;
  Label9.Font.Color:=clWhite;
  Label11.Font.Color:=clWhite;
  Edit5.Text:='';
  Edit4.Text:='';
  Edit6.Text:='';
  Edit7.Text:='';
  Label12.Visible:=False;
  Panel2.SendToBack;
  //Checkbox1.Visible:=True;
  //Edit3.Left:=Checkbox1.Width+2;
  end;
  Label13.Caption:='Dateiauswahl ['+ TabControl1.Tabs[TabControl1.TabIndex]+']:';
end;

procedure TForm1.TabControl1MouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
Timer5.Interval:=1;
Timer5.Enabled:=True;
end;

procedure TForm1.Timer1Timer(Sender: TObject);
var ScreenDC            :HDC;
    wnd                 :HWnd;
    ta,zeit             :string;
    jetzt               :TDateTime;
    AppName,FormCaption :PChar;
    oBmp: TBitmap;
begin
Timer1.Interval:=0;
  //AppName:=PChar(ExtractFileName(Paramstr(0)));         // 1a
  FormCaption:=PChar(Form1.Caption); // 1b
  //wnd:=FindWindow(AppName,nil);    // 2a
  wnd:=FindWindow(nil,FormCaption);  // 2b
  //ShowWindow(wnd,SW_HIDE);    //
  ShowWindow(wnd,SW_SHOW);    //damit Fenster im Vordergrund
  //Caption:=IntToStr(wnd);
  ScreenDC:= GetDC(wnd);
  //image1.picture.PNG.LoadFromDevice(ScreenDC);
  Image1.Picture.PNG.LoadFromDevice(ScreenDC);  //.PNG.LoadFromDevice(ScreenDC);
  ReleaseDc(wnd,ScreenDC);
  jetzt:=now;
  ta:=FormatDateTime('yymmdd',jetzt);
  zeit:=FormatDateTime('hhmmss',jetzt);
  Clipboard.Assign(Image1.Picture.Bitmap);
  //Image1.Picture.SaveToFile(ProgOrdner+'DispPattern-'+ta+'-'+zeit+'.png');
  Panel4.Visible:=False;
  Panel5.Visible:=False;
  Panel6.Visible:=False;
  Panel10.Visible:=True;
Timer1.Enabled:=False;
end;

procedure TForm1.Timer2Timer(Sender: TObject);
var ScreenDC            :HDC;
    wnd                 :HWnd;
    ta,zeit             :string;
    jetzt               :TDateTime;
    AppName,FormCaption :PChar;
    oBmp: TBitmap;
begin
Timer2.Interval:=0;
  //AppName:=PChar(ExtractFileName(Paramstr(0)));         // 1a
  FormCaption:=PChar(Form1.Caption); // 1b
  //wnd:=FindWindow(AppName,nil);    // 2a
  wnd:=FindWindow(nil,FormCaption);  // 2b
  //ShowWindow(wnd,SW_HIDE);    //
  ShowWindow(wnd,SW_SHOW);    //damit Fenster im Vordergrund
  //Caption:=IntToStr(wnd);
  ScreenDC:= GetDC(wnd);
  Image1.Picture.PNG.LoadFromDevice(ScreenDC);  //.PNG.LoadFromDevice(ScreenDC);
  ReleaseDc(wnd,ScreenDC);
  Panel4.Visible:=False;
  Panel5.Visible:=False;
  Panel6.Visible:=False;
  Panel10.Visible:=False;
  Timer3.Interval:=10;
  Timer3.Enabled:=True;
Timer2.Enabled:=False;
end;

procedure TForm1.Timer3Timer(Sender: TObject);
var
ta,zeit:string;
jetzt:TDateTime;
begin
Timer3.Interval:=0;
  jetzt:=now;
  ta:=FormatDateTime('yymmdd',jetzt);
  zeit:=FormatDateTime('hhmmss',jetzt);
  SaveDialog1.Filter := 'Bilddatei|*.png' ;
  SaveDialog1.InitialDir:=InitDirectory;
  SaveDialog1.FileName:='Hashwert+'+ta+zeit+'.png';
  if SaveDialog1.Execute then
  begin
  Image1.Picture.SaveToFile(SaveDialog1.FileName);
  end;
Timer3.Enabled:=False;
end;

procedure TForm1.Timer4Timer(Sender: TObject);
var
Filename,Filepath,Fileextend,Hashnamer:String;
a,b:String;
jefile:String;
begin
Timer4.Interval:=0;
  jefile:=Form2.ShellTreeView1.Path + '\' + Form2.ShellListView1.Selected.Caption;
  If TabControl1.TabIndex=0 then //Hashwert prüfen --> Button1
  begin
  if FileExists(jefile)=True then
  begin
  BaseFile:=jefile;
  Memo1.Clear;
  hashalgo(Listbox1.ItemIndex,jefile); // MyResult
  Memo1.Text:= MyResult;
  Filepath:=ExtractFilePath(jefile);
  Filename:=ExtractFilename(jefile);
  Fileextend:=ExtractFileExt(jefile);
  Hashnamer:=StringReplace(Filename,Fileextend,'.hash',[]);
  Memo2.Clear;
  if (FileExists(Filepath+Hashnamer)=True) and (Checkbox1.Checked=True)  then
  begin
  Memo2.Lines.LoadFromFile(Filepath+Hashnamer);
  Button3.Visible:=False;
  a:= Trim(UpCase(Memo1.Text));
  b:= Trim(UpCase(Memo2.Text));
  If Pos(a,b)>0 then   //Trim(Memo1.Text)= Trim(Memo2.Text) then
  begin
  Memo4.Font.Color:=clGreen;
  Label2.Caption:='Die Hashwert-Prüfung wurde ageschlossen.';
  Memo4.Text:='Die überprüfte Datei:'+#13#10+#13#10+'-|> File: "'+BaseFile+'"'+#13#10+'-|> HashFile: "'+Filepath+Hashnamer+'"'+#13#10+#13#10+'... wurde NICHT manipuliert und kann verwendet werden.'+#13#10#13#10+FormatDateTime('DD.MM.YYYY | hh:mm:ss',Now)+' Uhr | ' + FormatDateTime('YYYYMMDDhhmmss',Now);
  Edit5.Text:='Hashwert: '+Trim(Memo1.Text);
  end
  else
  begin
  Memo4.Font.Color:=clRed;
  Label2.Caption:='Die Hashwert-Prüfung wurde ageschlossen.';
  Memo4.Text:='ACHTUNG - Die überprüfte Datei:'+#13#10+#13#10+'-|> File: "'+BaseFile+'"'+#13#10+'-|> HashFile: "'+Filepath+Hashnamer+'"'+#13#10+#13#10+'... konnte nicht erfolgreich verifiziert werden!'+#13#10#13#10+FormatDateTime('DD.MM.YYYY | hh:mm:ss',Now)+' Uhr | ' + FormatDateTime('YYYYMMDDhhmmss',Now);                        ;
  end;
  Button3.Visible:=False;
  end
  else
  begin
  Button3.Visible:=True;
  Memo4.Font.Color:=clDefault;
  Memo4.Text:='Bitte wählen Sie die Hash-Wert-Datei aus.';
  end;
  end;
  Panel10.Width:=10;
  end;
  If TabControl1.TabIndex=1 then //Hashwert erstellen --> Button2
  begin
  if FileExists(jefile)=True then
  begin
  Memo1.Clear;
  hashalgo(Listbox1.ItemIndex,jefile); // MyResult
  Memo1.Text:= UpCase(MyResult);
  Filename:=ExtractFilename(jefile);
  Fileextend:=ExtractFileExt(jefile);
  Hashnamer:=StringReplace(Filename,Fileextend,'',[]);
  Memo1.Lines.SaveToFile(ProgOrdner+Hashnamer+'.hash');
  Label1.Caption:='Der Hashwert ('+Listbox1.Items[Listbox1.ItemIndex]+') wurde für die Datei:';
  Edit1.Text:=jefile;
  Label3.Caption:='erzeugt und unter:';
  Edit2.Text:=ProgOrdner+Hashnamer+'.hash';
  Label5.Caption:='abgelegt.';
  Edit5.Text:='Hashwert: '+Trim(Memo1.Text);
  end;
  Panel10.Width:=10;
  end;
  If TabControl1.TabIndex=2 then //Hashwert ermitteln --> Button4
  begin
  if FileExists(jefile)=True then
  begin
  InitDirectory:=ExtractFilePath(jefile);
  BaseFile:=jefile;
  Edit4.Clear;
  hashalgo(Listbox1.ItemIndex,jefile);
  Edit4.Text:= UpCase(MyResult);
  Label4.Font.Color:=clDefault;
  Label9.Font.Color:=clDefault;
  Label11.Font.Color:=clDefault;
  Edit6.Text:=Listbox1.Items[Listbox1.ItemIndex];
  Edit5.Text:='Hashwert: '+Trim(Edit4.Text);
  Edit7.Text:=IntToStr(Length(Trim(Edit4.Text)));
  If Length(Trim(Edit4.Text))>55 then Label12.Visible:=True
  else
  Label12.Visible:=False;
  end;
  Panel10.Width:=10;
  end;
Timer4.Enabled:=False;
end;

procedure TForm1.Timer5Timer(Sender: TObject);
begin
Timer5.Interval:=0;
  Form2.Label1.Caption:=Form1.Label13.Caption;
Timer5.Enabled:=False;
end;

procedure TForm1.Button1Click(Sender: TObject); //Anlegen einer Datei mit Hashwert einer Datei
var
Filename,Fileextend,Hashnamer:String;
begin
  OpenDialog1.Filter := 'Alle Dateien|*.*' ;
  OpenDialog1.InitialDir:=InitDirectory;
  if OpenDialog1.Execute then
  begin
  if FileExists(OpenDialog1.FileName)=True then
  begin
  InitDirectory:=ExtractFilePath(OpenDialog1.FileName);
  Memo1.Clear;
  hashalgo(Listbox1.ItemIndex,OpenDialog1.FileName); // MyResult
  Memo1.Text:= UpCase(MyResult);
  Filename:=ExtractFilename(OpenDialog1.FileName);
  Fileextend:=ExtractFileExt(OpenDialog1.FileName);
  Hashnamer:=StringReplace(Filename,Fileextend,'',[]);
  Memo1.Lines.SaveToFile(ProgOrdner+Hashnamer+'.hash');
  Label1.Caption:='Der Hashwert ('+Listbox1.Items[Listbox1.ItemIndex]+') wurde für die Datei:';
  Edit1.Text:=OpenDialog1.FileName;
  Label3.Caption:='erzeugt und unter:';
  Edit2.Text:=ProgOrdner+Hashnamer+'.hash';
  Label5.Caption:='abgelegt.';
  Edit5.Text:='Hashwert: '+Trim(Memo1.Text);
  end;
  end;
end;

procedure TForm1.Button2Click(Sender: TObject); //Hashwert einer Datei prüfen-->Panel2-->Tabindex0
var
Filename,Filepath,Fileextend,Hashnamer:String;
a,b:String;
begin
  Edit5.Text:='';
  OpenDialog1.Filter := 'Alle Dateien|*.*' ;
  OpenDialog1.InitialDir:=InitDirectory;
  if OpenDialog1.Execute then
  begin
  if FileExists(OpenDialog1.FileName)=True then
  begin
  InitDirectory:=ExtractFilePath(OpenDialog1.FileName);
  BaseFile:=OpenDialog1.FileName;
  Memo1.Clear;
  hashalgo(Listbox1.ItemIndex,OpenDialog1.FileName); // MyResult
  Memo1.Text:= MyResult;
  Filepath:=ExtractFilePath(OpenDialog1.FileName);
  Filename:=ExtractFilename(OpenDialog1.FileName);
  Fileextend:=ExtractFileExt(OpenDialog1.FileName);
  Hashnamer:=StringReplace(Filename,Fileextend,'.hash',[]);
  Memo2.Clear;
  if (FileExists(Filepath+Hashnamer)=True) and (Checkbox1.Checked=True)  then
  begin
  Memo2.Lines.LoadFromFile(Filepath+Hashnamer);
  Button3.Visible:=False;
  a:= Trim(UpCase(Memo1.Text));
  b:= Trim(UpCase(Memo2.Text));
  If Pos(a,b)>0 then   //Trim(Memo1.Text)= Trim(Memo2.Text) then
  begin
  Memo4.Font.Color:=clGreen;
  Label2.Caption:='Die Hashwert-Prüfung wurde ageschlossen.';
  Memo4.Text:='Die überprüfte Datei:'+#13#10+#13#10+'-|> File: "'+BaseFile+'"'+#13#10+'-|> HashFile: "'+Filepath+Hashnamer+'"'+#13#10+#13#10+'... wurde NICHT manipuliert und kann verwendet werden.'+#13#10#13#10+FormatDateTime('DD.MM.YYYY | hh:mm:ss',Now)+' Uhr | ' + FormatDateTime('YYYYMMDDhhmmss',Now);
  Edit5.Text:='Hashwert: '+Trim(Memo1.Text);
  end
  else
  begin
  Memo4.Font.Color:=clRed;
  Label2.Caption:='Die Hashwert-Prüfung wurde ageschlossen.';
  Memo4.Text:='ACHTUNG - Die überprüfte Datei:'+#13#10+#13#10+'-|> File: "'+BaseFile+'"'+#13#10+'-|> HashFile: "'+Filepath+Hashnamer+'"'+#13#10+#13#10+'... konnte nicht erfolgreich verifiziert werden!'+#13#10#13#10+FormatDateTime('DD.MM.YYYY | hh:mm:ss',Now)+' Uhr | ' + FormatDateTime('YYYYMMDDhhmmss',Now);                        ;
  end;
  Button3.Visible:=False;
  end
  else
  begin
  Button3.Visible:=True;
  Memo4.Font.Color:=clDefault;
  Memo4.Text:='Bitte wählen Sie die Hash-Wert-Datei aus.';
  end;
end;
end;
end;

procedure TForm1.Button3Click(Sender: TObject);//Hashwert-Datei für die Prüfung aufrufen-->Panel2-->Tabindex0
var
Filename,Filepath,Fileextend,Hashnamer:String;
a,b:String;
begin
  Edit5.Text:='';
  OpenDialog1.Filter := 'Alle Dateien|*.*' ;
  OpenDialog1.InitialDir:=InitDirectory;
  if OpenDialog1.Execute then
  begin
  if FileExists(OpenDialog1.FileName)=True then   //Hier wird die Hash-Datei aufgerufen...
  begin
  InitDirectory:=ExtractFilePath(OpenDialog1.FileName);
  Filepath:=ExtractFilePath(OpenDialog1.FileName);
  Filename:=ExtractFilename(OpenDialog1.FileName);
  Fileextend:=ExtractFileExt(OpenDialog1.FileName);
  Memo2.Clear;
  Memo3.Clear;
  Memo3.Lines.LoadFromFile(OpenDialog1.FileName);
  a:= Trim(UpCase(Memo1.Text));
  b:= Trim(UpCase(Memo3.Text));
  If Pos(a,b)>0 then
  begin
  Memo2.Text:=a;
  end
  else
  begin
  Memo2.Text:='';
  end;
  If Trim(Memo1.Text)= Trim(Memo2.Text) then
  begin
  Memo4.Font.Color:=clGreen;
  Label2.Caption:='Die Hashwert-Prüfung wurde abgeschlossen.';
  Memo4.Text:='Die überprüfte Datei:'+#13#10+#13#10+'-|> File: "'+BaseFile+'"'+#13#10+'-|> HashFile: "'+OpenDialog1.FileName+'"'+#13#10+#13#10+'... wurde NICHT manipuliert und kann verwendet werden.'+#13#10#13#10+FormatDateTime('DD.MM.YYYY | hh:mm:ss',Now)+' Uhr | ' + FormatDateTime('YYYYMMDDhhmmss',Now);
  Edit5.Text:='Hashwert: '+Trim(Memo2.Text);
  Button3.Visible:=False;
  end
  else
  begin
  Memo4.Font.Color:=clRed;
  Label2.Caption:='Die Hashwert-Prüfung wurde abgeschlossen.';
  Memo4.Text:='ACHTUNG - Die überprüfte Datei:'+#13#10+#13#10+'-|> File: "'+BaseFile+'"'+#13#10+'-|> HashFile: "'+OpenDialog1.FileName+'"'+#13#10+#13#10+'... konnte nicht erfolgreich verifiziert werden!'+#13#10#13#10+FormatDateTime('DD.MM.YYYY | hh:mm:ss',Now)+' Uhr | ' + FormatDateTime('YYYYMMDDhhmmss',Now);                        ;
  end;
  end
  else
  begin
  Memo4.Text:='Die aufgerufene Hash-Datei konnte nicht geladen werden!';
  end;
end;
end;

procedure TForm1.Button4Click(Sender: TObject); //Hashwert einer Datei ermitteln und anzeigen-->Panel3-->Tabindex 2
begin
  OpenDialog1.Filter := 'Alle Dateien|*.*' ;
  OpenDialog1.InitialDir:=InitDirectory;
  if OpenDialog1.Execute then
  begin
  if FileExists(OpenDialog1.FileName)=True then
  begin
  InitDirectory:=ExtractFilePath(OpenDialog1.FileName);
  BaseFile:=OpenDialog1.FileName;
  Edit4.Clear;
  hashalgo(Listbox1.ItemIndex,OpenDialog1.FileName);
  Edit4.Text:= UpCase(MyResult);
  Label4.Font.Color:=clDefault;
  Label9.Font.Color:=clDefault;
  Label11.Font.Color:=clDefault;
  Edit6.Text:=Listbox1.Items[Listbox1.ItemIndex];
  Edit5.Text:='Hashwert: '+Trim(Edit4.Text);
  Edit7.Text:=IntToStr(Length(Trim(Edit4.Text)));
  If Length(Trim(Edit4.Text))>55 then Label12.Visible:=True
  else
  Label12.Visible:=False;
end;
end;
end;

procedure TForm1.Button6Click(Sender: TObject);
begin
Panel9.Visible:=False;
Panel10.Visible:=True;
Panel10.BringToFront;
end;

procedure TForm1.hashalgo(algo:Integer;filname:String);
var
  MyKey:String;
  LHMAC: IHMAC;
  u:textfile;
begin
 case algo of
 0: MyResult := THashFactory.TCrypto.CreateMD5().ComputeFile(filname).ToString();
 1: MyResult := THashFactory.TCrypto.CreateSHA1().ComputeFile(filname).ToString();
 2: MyResult := THashFactory.TCrypto.CreateSHA2_256().ComputeFile(filname).ToString();
 3: MyResult := THashFactory.TCrypto.CreateSHA2_512().ComputeFile(filname).ToString();
 //4: //Ist Leerzeile ;
 5: MyResult := THashFactory.TCrypto.CreateMD2().ComputeFile(filname).ToString();
 6: MyResult := THashFactory.TCrypto.CreateMD4().ComputeFile(filname).ToString();
 7: MyResult := THashFactory.TCrypto.CreateMD5().ComputeFile(filname).ToString();
 8: MyResult := THashFactory.TCrypto.CreateSHA0().ComputeFile(filname).ToString();
 9: MyResult := THashFactory.TCrypto.CreateSHA1().ComputeFile(filname).ToString();
 10: MyResult := THashFactory.TCrypto.CreateSHA2_224().ComputeFile(filname).ToString();
 11: MyResult := THashFactory.TCrypto.CreateSHA2_256().ComputeFile(filname).ToString();
 12: MyResult := THashFactory.TCrypto.CreateSHA2_384().ComputeFile(filname).ToString();
 13: MyResult := THashFactory.TCrypto.CreateSHA2_512().ComputeFile(filname).ToString();
 14: MyResult := THashFactory.TCrypto.CreateSHA2_512_224().ComputeFile(filname).ToString();
 15: MyResult := THashFactory.TCrypto.CreateSHA2_512_256().ComputeFile(filname).ToString();
 16: MyResult := THashFactory.TCrypto.CreateSHA3_224().ComputeFile(filname).ToString();
 17: MyResult := THashFactory.TCrypto.CreateSHA3_256().ComputeFile(filname).ToString();
 18: MyResult := THashFactory.TCrypto.CreateSHA3_384().ComputeFile(filname).ToString();
 19: MyResult := THashFactory.TCrypto.CreateSHA3_512().ComputeFile(filname).ToString();
 20: MyResult := THashFactory.TCrypto.CreateGOST().ComputeFile(filname).ToString();
 21: MyResult := THashFactory.TCrypto.CreateHAS160().ComputeFile(filname).ToString();
 22: MyResult := THashFactory.TCrypto.CreatePanama().ComputeFile(filname).ToString();
 23: MyResult := THashFactory.TCrypto.CreateRIPEMD().ComputeFile(filname).ToString();
 24: MyResult := THashFactory.TCrypto.CreateRIPEMD128().ComputeFile(filname).ToString();
 25: MyResult := THashFactory.TCrypto.CreateRIPEMD160().ComputeFile(filname).ToString();
 26: MyResult := THashFactory.TCrypto.CreateRIPEMD256().ComputeFile(filname).ToString();
 27: MyResult := THashFactory.TCrypto.CreateRIPEMD320().ComputeFile(filname).ToString();
 28: MyResult := THashFactory.TCrypto.CreateWhirlPool().ComputeFile(filname).ToString();
 //else LHMAC := THashFactory.THMAC.CreateHMAC(THashFactory.TCrypto.CreateMD5);
 end;

//
//
//non-cryptographic 32-bits hash algorithms: AP, BKDR, Bernstein, Bernstein1, DEK, DJB,
//ELF, FNV, FNV1a, JS, Jenkins3, Murmur2, MurmurHash3_x86_32, OneAtTime, PJW, RS,
//Rotating, SDBM, ShiftAndXor, SuperFast, XXHash32.

  //LHMAC := THashFactory.THMAC.CreateHMAC(THashFactory.TCrypto.CreateAP);
  //MyResult:= LHMAC.ComputeFile(ProgOrdner+'T3LRAdminBoard.exe').ToString();
  //MyResultsX:=MyResult;
  //LHMAC := THashFactory.THMAC.CreateHMAC(THashFactory.TCrypto.CreateBKDR);
  //MyResult:= LHMAC.ComputeFile(ProgOrdner+'T3LRAdminBoard.exe').ToString();
  //MyResultsX:=MyResultsX+#13#10+MyResult;
  //LHMAC := THashFactory.THMAC.CreateHMAC(THashFactory.TCrypto.CreateBernstein);
  //MyResult:= LHMAC.ComputeFile(ProgOrdner+'T3LRAdminBoard.exe').ToString();
  //MyResultsX:=MyResultsX+#13#10+MyResult;
  //LHMAC := THashFactory.THMAC.CreateHMAC(THashFactory.TCrypto.CreateBernstein1);
  //MyResult:= LHMAC.ComputeFile(ProgOrdner+'T3LRAdminBoard.exe').ToString();
  //MyResultsX:=MyResultsX+#13#10+MyResult;
  //LHMAC := THashFactory.THMAC.CreateHMAC(THashFactory.TCrypto.CreateDEK);
  //MyResult:= LHMAC.ComputeFile(ProgOrdner+'T3LRAdminBoard.exe').ToString();
  //MyResultsX:=MyResultsX+#13#10+MyResult;
  //LHMAC := THashFactory.THMAC.CreateHMAC(THashFactory.TCrypto.CreateDJB);
  //MyResult:= LHMAC.ComputeFile(ProgOrdner+'T3LRAdminBoard.exe').ToString();
  //MyResultsX:=MyResultsX+#13#10+MyResult;
  //LHMAC := THashFactory.THMAC.CreateHMAC(THashFactory.TCrypto.CreateELF);
  //MyResult:= LHMAC.ComputeFile(ProgOrdner+'T3LRAdminBoard.exe').ToString();
  //MyResultsX:=MyResultsX+#13#10+MyResult;
  //LHMAC := THashFactory.THMAC.CreateHMAC(THashFactory.TCrypto.CreateFNV);
  //MyResult:= LHMAC.ComputeFile(ProgOrdner+'T3LRAdminBoard.exe').ToString();
  //MyResultsX:=MyResultsX+#13#10+MyResult;
  //LHMAC := THashFactory.THMAC.CreateHMAC(THashFactory.TCrypto.CreateFNV1a);
  //MyResult:= LHMAC.ComputeFile(ProgOrdner+'T3LRAdminBoard.exe').ToString();
  //MyResultsX:=MyResultsX+#13#10+MyResult;
  //LHMAC := THashFactory.THMAC.CreateHMAC(THashFactory.TCrypto.CreateJS);
  //MyResult:= LHMAC.ComputeFile(ProgOrdner+'T3LRAdminBoard.exe').ToString();
  //MyResultsX:=MyResultsX+#13#10+MyResult;
  //LHMAC := THashFactory.THMAC.CreateHMAC(THashFactory.TCrypto.CreateMurmur2);
  //MyResult:= LHMAC.ComputeFile(ProgOrdner+'T3LRAdminBoard.exe').ToString();
  //MyResultsX:=MyResultsX+#13#10+MyResult;
  //LHMAC := THashFactory.THMAC.CreateHMAC(THashFactory.TCrypto.CreateMurmurHash3_x86_32);
  //MyResult:= LHMAC.ComputeFile(ProgOrdner+'T3LRAdminBoard.exe').ToString();
  //MyResultsX:=MyResultsX+#13#10+MyResult;
  //LHMAC := THashFactory.THMAC.CreateHMAC(THashFactory.TCrypto.CreateOneAtTime);
  //MyResult:= LHMAC.ComputeFile(ProgOrdner+'T3LRAdminBoard.exe').ToString();
  //MyResultsX:=MyResultsX+#13#10+MyResult;
  //LHMAC := THashFactory.THMAC.CreateHMAC(THashFactory.TCrypto.CreatePJW);
  //MyResult:= LHMAC.ComputeFile(ProgOrdner+'T3LRAdminBoard.exe').ToString();
  //MyResultsX:=MyResultsX+#13#10+MyResult;
  //LHMAC := THashFactory.THMAC.CreateHMAC(THashFactory.TCrypto.CreateRS);
  //MyResult:= LHMAC.ComputeFile(ProgOrdner+'T3LRAdminBoard.exe').ToString();
  //MyResultsX:=MyResultsX+#13#10+MyResult;
  //LHMAC := THashFactory.THMAC.CreateHMAC(THashFactory.TCrypto.CreateRotating);
  //MyResult:= LHMAC.ComputeFile(ProgOrdner+'T3LRAdminBoard.exe').ToString();
  //MyResultsX:=MyResultsX+#13#10+MyResult;
  //LHMAC := THashFactory.THMAC.CreateHMAC(THashFactory.TCrypto.CreateSDBM,);
  //MyResult:= LHMAC.ComputeFile(ProgOrdner+'T3LRAdminBoard.exe').ToString();
  //MyResultsX:=MyResultsX+#13#10+MyResult;
  //LHMAC := THashFactory.THMAC.CreateHMAC(THashFactory.TCrypto.CreateShiftAndXor);
  //MyResult:= LHMAC.ComputeFile(ProgOrdner+'T3LRAdminBoard.exe').ToString();
  //MyResultsX:=MyResult;
  //LHMAC := THashFactory.THMAC.CreateHMAC(THashFactory.TCrypto.CreateSuperFast);
  //MyResult:= LHMAC.ComputeFile(ProgOrdner+'T3LRAdminBoard.exe').ToString();
  //MyResultsX:=MyResultsX+#13#10+MyResult;
  //LHMAC := THashFactory.THMAC.CreateHMAC(THashFactory.TCrypto.CreateXXHash32);
  //MyResult:= LHMAC.ComputeFile(ProgOrdner+'T3LRAdminBoard.exe').ToString();
  //MyResultsX:=MyResultsX+#13#10+MyResult;
//
//non-cryptographic 64-bits algorithms: FNV, FNV1a, Murmur2_64, SipHash2_4, XXHash64.

  //LHMAC := THashFactory.THMAC.CreateHMAC(THashFactory.TCrypto.CreateFNV);
  //MyResult:= LHMAC.ComputeFile(ProgOrdner+'T3LRAdminBoard.exe').ToString();
  //MyResultsX:=MyResultsX+#13#10+MyResult;
  //LHMAC := THashFactory.THMAC.CreateHMAC(THashFactory.TCrypto.CreateFNV1a);
  //MyResult:= LHMAC.ComputeFile(ProgOrdner+'T3LRAdminBoard.exe').ToString();
  //MyResultsX:=MyResultsX+#13#10+MyResult;
  //LHMAC := THashFactory.THMAC.CreateHMAC(THashFactory.TCrypto.CreateMurmur2_64);
  //MyResult:= LHMAC.ComputeFile(ProgOrdner+'T3LRAdminBoard.exe').ToString();
  //MyResultsX:=MyResultsX+#13#10+MyResult;
  //LHMAC := THashFactory.THMAC.CreateHMAC(THashFactory.TCrypto.CreateSipHash2_4);
  //MyResult:= LHMAC.ComputeFile(ProgOrdner+'T3LRAdminBoard.exe').ToString();
  //MyResultsX:=MyResultsX+#13#10+MyResult;
  //LHMAC := THashFactory.THMAC.CreateHMAC(THashFactory.TCrypto.CreateXXHash64);
  //MyResult:= LHMAC.ComputeFile(ProgOrdner+'T3LRAdminBoard.exe').ToString();
  //MyResultsX:=MyResultsX+#13#10+MyResult;
//
//non-cryptographic 128-bits algorithms: MurmurHash3_x86_128, MurmurHash3_x64_128.

  //LHMAC := THashFactory.THMAC.CreateHMAC(THashFactory.TCrypto.CreateMurmurHash3_x86_128);
  //MyResult:= LHMAC.ComputeFile(ProgOrdner+'T3LRAdminBoard.exe').ToString();
  //MyResultsX:=MyResultsX+#13#10+MyResult;
  //LHMAC := THashFactory.THMAC.CreateHMAC(THashFactory.TCrypto.CreateMurmurHash3_x64_128);
  //MyResult:= LHMAC.ComputeFile(ProgOrdner+'T3LRAdminBoard.exe').ToString();
  //MyResultsX:=MyResultsX+#13#10+MyResult;
//
//checksum algorithms: Adler32, All CRC Variants from CRC3 to CRC64.

  //LHMAC := THashFactory.THMAC.CreateHMAC(THashFactory.TCrypto.CreateMurmurAdler32);
  //MyResult:= LHMAC.ComputeFile(ProgOrdner+'T3LRAdminBoard.exe').ToString();
  //MyResultsX:=MyResultsX+#13#10+MyResult;
  //LHMAC := THashFactory.THMAC.CreateHMAC(THashFactory.TCrypto.CreateMurmurCRC64);
  //MyResult:= LHMAC.ComputeFile(ProgOrdner+'T3LRAdminBoard.exe').ToString();
  //MyResultsX:=MyResultsX+#13#10+MyResult;


//cryptographic algorithms: GOST, Grindahl, HAS160, Haval, MD2, MD4, MD5, Panama,
//RadioGatun, RIPEMD, RIPEMD128, RIPEMD160, RIPEMD256, RIPEMD320, SHA0, SHA1, SHA2-224,
//SHA2-256, SHA2-384, SHA2-512, SHA2-512-224, SHA2-512-256, SHA3-224, SHA3-256, SHA3-384,
//SHA3-512,Snefru128, Snefru256, Tiger, Tiger2, WhirlPool.


  //LHMAC := THashFactory.THMAC.CreateHMAC(THashFactory.TCrypto.CreateGOST);
  //MyResult:= LHMAC.ComputeFile(ProgOrdner+'T3LRAdminBoard.exe').ToString();
  //MyResultsX:=MyResult;
  ////LHMAC := THashFactory.THMAC.CreateHMAC(THashFactory.TCrypto.CreateGrindahl);
  ////MyResult:= LHMAC.ComputeFile(ProgOrdner+'T3LRAdminBoard.exe').ToString();
  ////MyResultsX:=MyResultsX+#13#10+MyResult;
  //LHMAC := THashFactory.THMAC.CreateHMAC(THashFactory.TCrypto.CreateHAS160);
  //MyResult:= LHMAC.ComputeFile(ProgOrdner+'T3LRAdminBoard.exe').ToString();
  //MyResultsX:=MyResultsX+#13#10+MyResult;
  ////LHMAC := THashFactory.THMAC.CreateHMAC(THashFactory.TCrypto.CreateHaval);
  ////MyResult:= LHMAC.ComputeFile(ProgOrdner+'T3LRAdminBoard.exe').ToString();
  ////MyResultsX:=MyResultsX+#13#10+MyResult;
  //LHMAC := THashFactory.THMAC.CreateHMAC(THashFactory.TCrypto.CreateMD2);
  //MyResult:= LHMAC.ComputeFile(ProgOrdner+'T3LRAdminBoard.exe').ToString();
  //MyResultsX:=MyResultsX+#13#10+MyResult;
  //LHMAC := THashFactory.THMAC.CreateHMAC(THashFactory.TCrypto.CreateMD4);
  //MyResult:= LHMAC.ComputeFile(ProgOrdner+'T3LRAdminBoard.exe').ToString();
  //MyResultsX:=MyResultsX+#13#10+MyResult;
  //LHMAC := THashFactory.THMAC.CreateHMAC(THashFactory.TCrypto.CreateMD5);
  //MyResult:= LHMAC.ComputeFile(ProgOrdner+'T3LRAdminBoard.exe').ToString();
  //MyResultsX:=MyResultsX+#13#10+MyResult;
  //LHMAC := THashFactory.THMAC.CreateHMAC(THashFactory.TCrypto.CreatePanama);
  //MyResult:= LHMAC.ComputeFile(ProgOrdner+'T3LRAdminBoard.exe').ToString();
  //MyResultsX:=MyResultsX+#13#10+MyResult;
  ////LHMAC := THashFactory.THMAC.CreateHMAC(THashFactory.TCrypto.CreateRadioGatun);
  ////MyResult:= LHMAC.ComputeFile(ProgOrdner+'T3LRAdminBoard.exe').ToString();
  ////MyResultsX:=MyResultsX+#13#10+MyResult;
  //LHMAC := THashFactory.THMAC.CreateHMAC(THashFactory.TCrypto.CreateRIPEMD);
  //MyResult:= LHMAC.ComputeFile(ProgOrdner+'T3LRAdminBoard.exe').ToString();
  //MyResultsX:=MyResultsX+#13#10+MyResult;
  //LHMAC := THashFactory.THMAC.CreateHMAC(THashFactory.TCrypto.CreateRIPEMD128);
  //MyResult:= LHMAC.ComputeFile(ProgOrdner+'T3LRAdminBoard.exe').ToString();
  //MyResultsX:=MyResultsX+#13#10+MyResult;
  //LHMAC := THashFactory.THMAC.CreateHMAC(THashFactory.TCrypto.CreateRIPEMD160);
  //MyResult:= LHMAC.ComputeFile(ProgOrdner+'T3LRAdminBoard.exe').ToString();
  //MyResultsX:=MyResultsX+#13#10+MyResult;
  //LHMAC := THashFactory.THMAC.CreateHMAC(THashFactory.TCrypto.CreateRIPEMD256);
  //MyResult:= LHMAC.ComputeFile(ProgOrdner+'T3LRAdminBoard.exe').ToString();
  //MyResultsX:=MyResultsX+#13#10+MyResult;
  //LHMAC := THashFactory.THMAC.CreateHMAC(THashFactory.TCrypto.CreateRIPEMD320);
  //MyResult:= LHMAC.ComputeFile(ProgOrdner+'T3LRAdminBoard.exe').ToString();
  //MyResultsX:=MyResultsX+#13#10+MyResult;
  //LHMAC := THashFactory.THMAC.CreateHMAC(THashFactory.TCrypto.CreateSHA0);
  //MyResult:= LHMAC.ComputeFile(ProgOrdner+'T3LRAdminBoard.exe').ToString();
  //MyResultsX:=MyResultsX+#13#10+MyResult;
  //LHMAC := THashFactory.THMAC.CreateHMAC(THashFactory.TCrypto.CreateSHA1);
  //MyResult:= LHMAC.ComputeFile(ProgOrdner+'T3LRAdminBoard.exe').ToString();
  //MyResultsX:=MyResultsX+#13#10+MyResult;
  //LHMAC := THashFactory.THMAC.CreateHMAC(THashFactory.TCrypto.CreateSHA2_224);
  //MyResult:= LHMAC.ComputeFile(ProgOrdner+'T3LRAdminBoard.exe').ToString();
  //MyResultsX:=MyResultsX+#13#10+MyResult;
  //LHMAC := THashFactory.THMAC.CreateHMAC(THashFactory.TCrypto.CreateSHA2_256);
  //MyResult:= LHMAC.ComputeFile(ProgOrdner+'T3LRAdminBoard.exe').ToString();
  //MyResultsX:=MyResultsX+#13#10+MyResult;
  //LHMAC := THashFactory.THMAC.CreateHMAC(THashFactory.TCrypto.CreateSHA2_384);
  //MyResult:= LHMAC.ComputeFile(ProgOrdner+'T3LRAdminBoard.exe').ToString();
  //MyResultsX:=MyResultsX+#13#10+MyResult;
  //LHMAC := THashFactory.THMAC.CreateHMAC(THashFactory.TCrypto.CreateSHA2_512);
  //MyResult:= LHMAC.ComputeFile(ProgOrdner+'T3LRAdminBoard.exe').ToString();
  //MyResultsX:=MyResultsX+#13#10+MyResult;
  //LHMAC := THashFactory.THMAC.CreateHMAC(THashFactory.TCrypto.CreateSHA2_512_224);
  //MyResult:= LHMAC.ComputeFile(ProgOrdner+'T3LRAdminBoard.exe').ToString();
  //MyResultsX:=MyResultsX+#13#10+MyResult;
  //LHMAC := THashFactory.THMAC.CreateHMAC(THashFactory.TCrypto.CreateSHA2_512_256);
  //MyResult:= LHMAC.ComputeFile(ProgOrdner+'T3LRAdminBoard.exe').ToString();
  //MyResultsX:=MyResultsX+#13#10+MyResult;
  //LHMAC := THashFactory.THMAC.CreateHMAC(THashFactory.TCrypto.CreateSHA3_224);
  //MyResult:= LHMAC.ComputeFile(ProgOrdner+'T3LRAdminBoard.exe').ToString();
  //MyResultsX:=MyResultsX+#13#10+MyResult;
  //LHMAC := THashFactory.THMAC.CreateHMAC(THashFactory.TCrypto.CreateSHA3_256);
  //MyResult:= LHMAC.ComputeFile(ProgOrdner+'T3LRAdminBoard.exe').ToString();
  //MyResultsX:=MyResultsX+#13#10+MyResult;
  //LHMAC := THashFactory.THMAC.CreateHMAC(THashFactory.TCrypto.CreateSHA3_384);
  //MyResult:= LHMAC.ComputeFile(ProgOrdner+'T3LRAdminBoard.exe').ToString();
  //MyResultsX:=MyResultsX+#13#10+MyResult;
  //LHMAC := THashFactory.THMAC.CreateHMAC(THashFactory.TCrypto.CreateSHA3_512);
  //MyResult:= LHMAC.ComputeFile(ProgOrdner+'T3LRAdminBoard.exe').ToString();
  //MyResultsX:=MyResultsX+#13#10+MyResult;
  ////LHMAC := THashFactory.THMAC.CreateHMAC(THashFactory.TCrypto.CreateSnefru128);
  ////MyResult:= LHMAC.ComputeFile(ProgOrdner+'T3LRAdminBoard.exe').ToString();
  ////MyResultsX:=MyResultsX+#13#10+MyResult;
  ////LHMAC := THashFactory.THMAC.CreateHMAC(THashFactory.TCrypto.CreateSnefru256);
  ////MyResult:= LHMAC.ComputeFile(ProgOrdner+'T3LRAdminBoard.exe').ToString();
  ////MyResultsX:=MyResultsX+#13#10+MyResult;
  ////LHMAC := THashFactory.THMAC.CreateHMAC(THashFactory.TCrypto.CreateTiger);
  ////MyResult:= LHMAC.ComputeFile(ProgOrdner+'T3LRAdminBoard.exe').ToString();
  ////MyResultsX:=MyResultsX+#13#10+MyResult;
  ////LHMAC := THashFactory.THMAC.CreateHMAC(THashFactory.TCrypto.CreateTiger2);
  ////MyResult:= LHMAC.ComputeFile(ProgOrdner+'T3LRAdminBoard.exe').ToString();
  ////MyResultsX:=MyResultsX+#13#10+MyResult;
  //LHMAC := THashFactory.THMAC.CreateHMAC(THashFactory.TCrypto.CreateWhirlPool);
  //MyResult:= LHMAC.ComputeFile(ProgOrdner+'T3LRAdminBoard.exe').ToString();
  //MyResultsX:=MyResultsX+#13#10+MyResult;

  //MyKey:='';
  //LHMAC.Key := TConverters.ConvertStringToBytes(MyKey, TEncoding.UTF8);
  //MyResult:= LHMAC.ComputeFile(ProgOrdner+'ABC.exe').ToString();

  //ReadLn();
  //assignfile(u, ExtractFilePath(ParamStr(0))+'jEHashes.txt');
  //rewrite(u);
  //writeln(u, MyResultsX);
  //closefile(u);

end;

end.

