unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, sEdit, sSpinEdit, Buttons, ExtCtrls, Grids, ComCtrls;

type
  TForm1 = class(TForm)
    GroupBox1: TGroupBox;
    CheckBox1: TCheckBox;
    CheckBox2: TCheckBox;
    CheckBox3: TCheckBox;
    CheckBox4: TCheckBox;
    BitBtn1: TBitBtn;
    Label1: TLabel;
    Label2: TLabel;
    sSpinEdit1: TsSpinEdit;
    sSpinEdit2: TsSpinEdit;
    Button1: TButton;
    ListBox1: TListBox;
    GroupBox2: TGroupBox;
    LabeledEdit1: TLabeledEdit;
    GroupBox3: TGroupBox;
    StringGrid1: TStringGrid;
    Button2: TButton;
    procedure BitBtn1Click(Sender: TObject);

    procedure sSpinEdit2Change(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1; cl:integer;

implementation

{$R *.dfm}

procedure TForm1.BitBtn1Click(Sender: TObject);
var pass:string; e,p,r:byte; sel:array [0..255] of byte;
begin

p:=0;

if (CheckBox1.Checked=false) and (CheckBox2.Checked=false) and (CheckBox3.Checked=false) and (CheckBox4.Checked=false)
then MessageBox(handle,'Вы не выбрали ни одного типа символов для генерации.'+#13+'Выберите хотя бы один тип и повторите запрос.','Внимание!',MB_ICONWARNING)
else
begin

repeat
e:=0;
pass:='';
r:=0;
randomize;
repeat
if CheckBox1.Checked then
begin
// big
repeat
r:=random(91);
until r>64;
sel[0]:=r;
end else sel[0]:=0;

if CheckBox2.Checked then
begin
// small
repeat
r:=random(123);
until r>96;
sel[1]:=r;
end else sel[1]:=0;

if CheckBox3.Checked then
begin
// dig
repeat
r:=random(58);
until r>47;
sel[2]:=r;
end else sel[2]:=0;

if CheckBox4.Checked then
begin
// symb
repeat
r:=random(47);
until r>32;
sel[3]:=r;
end else sel[3]:=0;

{memo1.Lines.Add(inttostr(sel[0])+', '+
inttostr(sel[1])+', '+
inttostr(sel[2])+', '+
inttostr(sel[3])+', '+inttostr(r));}
r:=0;

while r=0 do
r:=sel[random(4)];


pass:=pass+chr(r);
e:=e+1;
until e=sspinedit1.value;
listbox1.Items.Add(pass);
pass:='';
p:=p+1;
until p=sSpinEdit2.Value;
end;
end;



procedure TForm1.Button1Click(Sender: TObject);
begin
listbox1.items.Clear;
end;

procedure TForm1.Button2Click(Sender: TObject);
begin

StringGrid1.Cells[0,cl]:=LabeledEdit1.Text;
StringGrid1.Cells[1,cl]:=ListBox1.Items.Strings[ListBox1.ItemIndex];
cl:=cl+1;
StringGrid1.RowCount:=cl;
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
BitBtn1.Caption:='Сгенерировать '+sSpinEdit2.Text+' штук';
cl:=1;
end;

procedure TForm1.sSpinEdit2Change(Sender: TObject);
begin
BitBtn1.Caption:='Сгенерировать '+sSpinEdit2.Text+' штук';
end;

end.
