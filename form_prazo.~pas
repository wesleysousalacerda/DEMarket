unit form_prazo;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, RXSpin, Mask, RXSwitch, pngimage;

type
  Tformprazo = class(TForm)
    lbetjuros: TLabeledEdit;
    ComboBox1: TComboBox;
    Label1: TLabel;
    Label2: TLabel;
    ComboBox2: TComboBox;
    Label3: TLabel;
    Panel1: TPanel;
    Label4: TLabel;
    Panel2: TPanel;
    Label5: TLabel;
    Edit1: TEdit;
    Shape1: TShape;
    Image1: TImage;
    procedure ComboBox2Change(Sender: TObject);
    procedure ComboBox1Change(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  formprazo: Tformprazo;

implementation

uses Cad_Venda;

{$R *.dfm}

procedure Tformprazo.ComboBox2Change(Sender: TObject);
var x,y,m,j:double;i:integer;
begin
if lbetjuros.Text<>'' then
begin
i:=ComboBox2.ItemIndex;
x:=strtofloat(Edit1.Text);
y:=strtofloat(lbetjuros.Text)/100;
j:=exp(ln(1+y )*i);
m:=x*j;
Panel2.Caption:=FormatFloat('##.00',m);
Panel1.Caption:=datetostr(IncMonth(Date, (ComboBox2.ItemIndex)));
end
else
begin
ShowMessage('Digite o valor do juros!');
lbetjuros.SetFocus;
end;
end;

procedure Tformprazo.ComboBox1Change(Sender: TObject);
begin
if lbetjuros.Text<>'' then
panel1.caption:=FormatDateTime('dd/mm/yyyy', (Now + (ComboBox1.ItemIndex)))
else
ShowMessage('Digite o valor do juros!');
lbetjuros.SetFocus;
end;

end.
