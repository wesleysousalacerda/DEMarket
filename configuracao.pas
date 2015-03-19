unit configuracao;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ColorGrd, ComCtrls, TabNotBk, pngimage, ExtCtrls, Gauges, DB,
  DBTables, IBCtrls, StdCtrls, dblookup, AdvSmoothTabPager,Jpeg, ExtDlgs,
  DBCtrls, Mask,clipbrd, Buttons;

type
  TFormconfiguracao = class(TForm)
    PageControl1: TPageControl;
    Image1: TImage;
    TabSheet1: TTabSheet;
    etsenha: TEdit;
    Label1: TLabel;
    BitBtn1: TBitBtn;
    Label2: TLabel;
    detsenha: TDBEdit;
    etconsenha: TEdit;
    Label3: TLabel;
    detusuario: TDBEdit;
    etusr: TLabel;
    BitBtn2: TBitBtn;
    OpenPictureDialog1: TOpenPictureDialog;
    procedure BitBtn1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Formconfiguracao: TFormconfiguracao;
  JPG : TJPEGimage;

implementation

uses Principal, UDM;

{$R *.dfm}

procedure TFormconfiguracao.BitBtn1Click(Sender: TObject);
begin
dm.TblLogin.Open;
DM.TblLogin.Edit;
dm.TblLogin.First;
if  etsenha.Text=dm.TblLoginSENHA.Value then begin
dm.TblLogin.Append;
detusuario.Enabled:=true;
detsenha.Enabled:=true;
etconsenha.Enabled:=true;
detusuario.Color:=clWhite;
detsenha.Color:=clWhite;
etconsenha.Color:=clWhite;
end
else     begin
ShowMessage('Senha incorreta!');
etsenha.SetFocus;
etsenha.Clear;
end;


end;

procedure TFormconfiguracao.FormShow(Sender: TObject);
begin
dm.TblLogin.Append;
end;

procedure TFormconfiguracao.BitBtn2Click(Sender: TObject);
begin
if detsenha.Text=etconsenha.Text then
begin
DM.TblLogin.Post;
ShowMessage('Usuário e Senha salvos com sucesso!');
Formconfiguracao.Close;
end
else                               begin
ShowMessage('Senhas não conferem!');
detsenha.SetFocus;
end;
end;



end.
