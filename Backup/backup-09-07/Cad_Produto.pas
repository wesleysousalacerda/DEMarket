unit Cad_Produto;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Mask, DBCtrls, ComCtrls, ToolWin;

type
  TFrmCad_Produto = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    DBEdit2: TDBEdit;
    DBEdit1: TDBEdit;
    Label3: TLabel;
    DBEdit3: TDBEdit;
    BarradeBotoes: TToolBar;
    BtnNovo: TToolButton;
    BtnSalvar: TToolButton;
    BtnExcluir: TToolButton;
    BtnLocalizar: TToolButton;
    BtnSair: TToolButton;
    Label4: TLabel;
    DBMemo1: TDBMemo;
    Label5: TLabel;
    DBEdit4: TDBEdit;
    Label6: TLabel;
    DBEdit5: TDBEdit;
    Label7: TLabel;
    DBEdit6: TDBEdit;
    procedure BtnNovoClick(Sender: TObject);
    procedure BtnSairClick(Sender: TObject);
    procedure BtnSalvarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure BtnExcluirClick(Sender: TObject);
    procedure BtnLocalizarClick(Sender: TObject);
    procedure DBEdit5KeyPress(Sender: TObject; var Key: Char);
    procedure DBEdit3KeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmCad_Produto: TFrmCad_Produto;

implementation

uses UDM, Con_Produto, Cad_Venda;

{$R *.DFM}

procedure TFrmCad_Produto.BtnNovoClick(Sender: TObject);
begin
     dm.TblProduto.Insert;
          DBEdit2.SetFocus;
end;

procedure TFrmCad_Produto.BtnSairClick(Sender: TObject);
begin
     close;
end;

procedure TFrmCad_Produto.BtnSalvarClick(Sender: TObject);
begin
 try
        if (DBEdit2.Text <> '') and (DBEdit3.Text <> '') then
           begin
           dm.TblProduto.Post;
                    ;end
        else
                 showmessage ('Preencha todos os campos do cadastro');
     except
           showmessage ('Ocorreu um erro no cadastro, tente novamente');
     end;
end;

procedure TFrmCad_Produto.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
     dm.TblCliente.close;
end;

procedure TFrmCad_Produto.FormShow(Sender: TObject);
begin
     dm.Tblproduto.open;
     btnnovo.OnClick (self);
end;

procedure TFrmCad_Produto.BtnExcluirClick(Sender: TObject);
begin
        If Application.MessageBox('Excluir registro?', 'Excluir', MB_YESNO + MB_ICONQUESTION ) = 6 then
           try
              dm.TblProduto.Delete;
           except
                 showmessage ('Ocorreu um erro na exclusão do registro');
           end;
end;

procedure TFrmCad_Produto.BtnLocalizarClick(Sender: TObject);
begin
     frmcon_produto.show;
end;

procedure TFrmCad_Produto.DBEdit5KeyPress(Sender: TObject; var Key: Char);
begin
if not (key in['0'..'9',chr(8),chr(44)]) then
key :=#0;
end;

procedure TFrmCad_Produto.DBEdit3KeyPress(Sender: TObject; var Key: Char);
begin
if not (key in['0'..'9',chr(8),chr(44)]) then
key :=#0;
end;

end.
