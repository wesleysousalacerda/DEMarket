unit Cad_Cliente;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Mask, DBCtrls, ComCtrls, ToolWin, RzButton, RxLogin, pngimage,
  ExtCtrls, Buttons;

type
  TFrmCad_Cliente = class(TForm)
    DBEdit1: TDBEdit;
    DBEdit2: TDBEdit;
    Label1: TLabel;
    Label2: TLabel;
    DBEdit3: TDBEdit;
    Label3: TLabel;
    BarradeBotoes: TToolBar;
    BtnNovo: TToolButton;
    BtnSalvar: TToolButton;
    BtnExcluir: TToolButton;
    BtnLocalizar: TToolButton;
    BtnSair: TToolButton;
    Image1: TImage;
    Label5: TLabel;
    DBEdit5: TDBEdit;
    Label6: TLabel;
    DBEdit6: TDBEdit;
    Label7: TLabel;
    DBEdit7: TDBEdit;
    Label4: TLabel;
    DBEdit4: TDBEdit;
    Label8: TLabel;
    DBEdit8: TDBEdit;
    procedure BtnNovoClick(Sender: TObject);
    procedure BtnSalvarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure BtnSairClick(Sender: TObject);
    procedure BtnLocalizarClick(Sender: TObject);
    procedure BtnExcluirClick(Sender: TObject);
    procedure RxLoginDialog1CheckUser(Sender: TObject; const UserName,
      Password: String; var AllowLogin: Boolean);
    procedure btokClick(Sender: TObject);
    procedure DBEdit3Exit(Sender: TObject);
    procedure DBEdit5Exit(Sender: TObject);
    procedure DBEdit5KeyPress(Sender: TObject; var Key: Char);
    procedure DBEdit3KeyPress(Sender: TObject; var Key: Char);
    procedure DBEdit6KeyPress(Sender: TObject; var Key: Char);
  private

    { Private declarations }
  public
  function cpf(num: string): boolean;
    { Public declarations }
  end;

var
  FrmCad_Cliente: TFrmCad_Cliente;

implementation

uses UDM, Con_Cliente, Cad_Venda, pagamento, DB, MaskUtils;

{$R *.DFM}

procedure TFrmCad_Cliente.BtnNovoClick(Sender: TObject);
begin
     dm.TblCliente.Insert;
     DBEdit2.SetFocus;
end;

procedure TFrmCad_Cliente.BtnSalvarClick(Sender: TObject);
begin
     try
             if (DBEdit2.Text <> '') and (DBEdit3.Text <> '') then
                dm.TblCliente.Post
             else
                 showmessage ('Preencha todos os campos do cadastro');
     except
           showmessage ('Ocorreu um erro no cadastro, tente novamente');
     end;
end;

procedure TFrmCad_Cliente.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
     dm.TblCliente.Close;
end;

procedure TFrmCad_Cliente.FormShow(Sender: TObject);
begin
     dm.TblCliente.Open;
     BtnNovo.OnClick(Self);

end;


procedure TFrmCad_Cliente.BtnSairClick(Sender: TObject);
begin
     close;
end;

procedure TFrmCad_Cliente.BtnLocalizarClick(Sender: TObject);
begin
     frmcon_cliente.showmodal;
end;

procedure TFrmCad_Cliente.BtnExcluirClick(Sender: TObject);
begin

if MessageBox(0, 'Deseja realmente deletar este cliente?', 'DEMarket', MB_ICONQUESTION or MB_YESNO)=mrYes then
dm.TblCliente.Delete;
end;

procedure TFrmCad_Cliente.RxLoginDialog1CheckUser(Sender: TObject;
  const UserName, Password: String; var AllowLogin: Boolean);
begin
if Password<>'oi'then
abort;
end;

procedure TFrmCad_Cliente.btokClick(Sender: TObject);
begin
   if dm.TblCliente.State=dsInsert then
   if
   MessageBox(0, 'Deseja salvar cliente?', 'DEMarket', MB_ICONQUESTION or MB_YESNO)=mrYes then
   begin
   dm.TblCliente.post;
   FrmCad_Venda.detcliente.Text := dm.TblClienteNome.Value;
   close;
   end
end;
procedure TFrmCad_Cliente.DBEdit3Exit(Sender: TObject);
begin
DBEdit3.Text := FormatMaskText('(99)9999-9999;0', DBEdit3.Text);
end;

procedure TFrmCad_Cliente.DBEdit5Exit(Sender: TObject);
Begin
if DBEdit5.Text<>'' then begin
if cpf(DBEdit5.Text)=true then
DBEdit5.Text := FormatMaskText('999.999.999-99;0', DBEdit5.Text)
else                        begin
ShowMessage('CPF inválido!');
DBEdit5.SetFocus;
end; end
else begin
ShowMessage('Digite o CPF!');
DBEdit5.SetFocus;
end;
end;

procedure TFrmCad_Cliente.DBEdit5KeyPress(Sender: TObject; var Key: Char);
begin
if not (key in['0'..'9',chr(8)]) then
key :=#0;
end;

procedure TFrmCad_Cliente.DBEdit3KeyPress(Sender: TObject; var Key: Char);
begin
if not (key in['0'..'9',chr(8)]) then
key :=#0;
end;

procedure TFrmCad_Cliente.DBEdit6KeyPress(Sender: TObject; var Key: Char);
begin
if not (key in['0'..'9',chr(8)]) then
key :=#0;
end;




function TFrmCad_Cliente.cpf(num: string): boolean;
var
n1,n2,n3,n4,n5,n6,n7,n8,n9: integer;
d1,d2: integer;
digitado, calculado: string;
begin

n1:=StrToInt(num[1]);
n2:=StrToInt(num[2]);
n3:=StrToInt(num[3]);
n4:=StrToInt(num[4]);
n5:=StrToInt(num[5]);
n6:=StrToInt(num[6]);
n7:=StrToInt(num[7]);
n8:=StrToInt(num[8]);
n9:=StrToInt(num[9]);
d1:=n9*2+n8*3+n7*4+n6*5+n5*6+n4*7+n3*8+n2*9+n1*10;
d1:=11-(d1 mod 11);
if d1>=10 then d1:=0;
d2:=d1*2+n9*3+n8*4+n7*5+n6*6+n5*7+n4*8+n3*9+n2*10+n1*11;
d2:=11-(d2 mod 11);
if d2>=10 then d2:=0;
calculado:=inttostr(d1)+inttostr(d2);
digitado:=num[10]+num[11];
if calculado=digitado then
cpf:=true
else
cpf:=false;
end;


end.





