unit Cad_Cliente;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Mask, DBCtrls, ComCtrls, ToolWin, RzButton, RxLogin, pngimage,
  ExtCtrls;

type
  TFrmCad_Cliente = class(TForm)
    DBEdit1: TDBEdit;
    DBEdit2: TDBEdit;
    Label1: TLabel;
    Label2: TLabel;
    DBEdit3: TDBEdit;
    Label3: TLabel;
    Label4: TLabel;
    DBEdit4: TDBEdit;
    BarradeBotoes: TToolBar;
    BtnNovo: TToolButton;
    BtnSalvar: TToolButton;
    BtnExcluir: TToolButton;
    BtnLocalizar: TToolButton;
    BtnSair: TToolButton;
    Image1: TImage;
    procedure BtnNovoClick(Sender: TObject);
    procedure BtnSalvarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure BtnSairClick(Sender: TObject);
    procedure BtnLocalizarClick(Sender: TObject);
    procedure BtnExcluirClick(Sender: TObject);
    procedure RxLoginDialog1CheckUser(Sender: TObject; const UserName,
      Password: String; var AllowLogin: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmCad_Cliente: TFrmCad_Cliente;

implementation

uses UDM, Con_Cliente;

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
     frmcon_cliente.show;
end;

procedure TFrmCad_Cliente.BtnExcluirClick(Sender: TObject);
begin
     dm.TblCliente.Delete;
end;

procedure TFrmCad_Cliente.RxLoginDialog1CheckUser(Sender: TObject;
  const UserName, Password: String; var AllowLogin: Boolean);
begin
if Password<>'oi'then
abort;
end;

end.
