unit Cad_Produto;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Mask,Clipbrd, DBCtrls, ComCtrls, ToolWin, ExtCtrls,jpeg, Buttons,
  ExtDlgs;

type
  TFrmCad_Produto = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    dbnome: TDBEdit;
    dbcodigo: TDBEdit;
    Label3: TLabel;
    dbpreco: TDBEdit;
    BarradeBotoes: TToolBar;
    BtnNovo: TToolButton;
    BtnSalvar: TToolButton;
    BtnExcluir: TToolButton;
    BtnLocalizar: TToolButton;
    BtnSair: TToolButton;
    Label4: TLabel;
    DBMemo1: TDBMemo;
    Label6: TLabel;
    DBEdit5: TDBEdit;
    Label8: TLabel;
    dbquant: TDBEdit;
    DBNavigator1: TDBNavigator;
    dbimglogo: TDBImage;
    btn1: TBitBtn;
    openpic1: TOpenPictureDialog;
    chk1: TCheckBox;
    procedure BtnNovoClick(Sender: TObject);
    procedure BtnSairClick(Sender: TObject);
    procedure BtnSalvarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure BtnExcluirClick(Sender: TObject);
    procedure BtnLocalizarClick(Sender: TObject);
    procedure DBEdit5KeyPress(Sender: TObject; var Key: Char);
    procedure dbprecoKeyPress(Sender: TObject; var Key: Char);
    procedure DBEdit1KeyPress(Sender: TObject; var Key: Char);
    procedure btn1Click(Sender: TObject);
    procedure chk1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmCad_Produto: TFrmCad_Produto;
   JPG : TJPEGimage;

implementation

uses UDM, Con_Produto, Cad_Venda;

{$R *.DFM}

procedure TFrmCad_Produto.BtnNovoClick(Sender: TObject);
begin
     dm.TblProduto.Insert;
     dbnome.SetFocus;
end;

procedure TFrmCad_Produto.BtnSairClick(Sender: TObject);
begin
     close;
end;

procedure TFrmCad_Produto.BtnSalvarClick(Sender: TObject);
begin
 try
        if (dbpreco.Text <> '') and (dbnome.Text <> '')and(dbquant.Text<>'') then
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

procedure TFrmCad_Produto.dbprecoKeyPress(Sender: TObject; var Key: Char);
begin
if not (key in['0'..'9',chr(8),chr(44)]) then
key :=#0;
end;

procedure TFrmCad_Produto.DBEdit1KeyPress(Sender: TObject; var Key: Char);
begin
if not (key in['0'..'9',chr(8)]) then
key :=#0;

end;

procedure TFrmCad_Produto.btn1Click(Sender: TObject);
begin
if openpic1.Execute then
  begin
    JPG := TJPEGimage.create;
    jpg.loadfromfile(openpic1.FileName);
    Clipboard.Assign(jpg);
    dbimglogo.PasteFromClipboard;
    JPG.free;
end;
end;

procedure TFrmCad_Produto.chk1Click(Sender: TObject);
begin
  if chk1.Checked=true then
  dbimglogo.Stretch:=True
  else
  dbimglogo.Stretch:=False;
end;

end.
