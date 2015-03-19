unit Con_ProdutoVenda;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Grids, DBGrids, Buttons, pngimage, ExtCtrls;

type
  TFrmCon_ProdutoVenda = class(TForm)
    BitBtn2: TBitBtn;
    BtnSelecionaProduto: TBitBtn;
    DBGrid2: TDBGrid;
    EdtConsulta: TEdit;
    Label10: TLabel;
    BtnConsulta: TBitBtn;
    Image1: TImage;
    procedure BtnConsultaClick(Sender: TObject);
    procedure BtnSelecionaProdutoClick(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure EdtConsultaChange(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmCon_ProdutoVenda: TFrmCon_ProdutoVenda;

implementation

uses UDM, Cad_Venda;

{$R *.DFM}

procedure TFrmCon_ProdutoVenda.BtnConsultaClick(Sender: TObject);
begin
     if Edtconsulta.Text = '' then
        begin
             showmessage('Digite a consulta');
             exit;
        end;
   with dm.QryProduto do
          begin
               close;
               sql.clear;
               sql.add ('SELECT * FROM PRODUTO WHERE NOME LIKE '+ #39 + Edtconsulta.text + '%' + #39 +  ' order by NOME');
               open;
               if recordcount = 0 then
               showmessage ('Nenhum registro encontrado');
               edtconsulta.SelectAll;
               edtconsulta.SetFocus;

          end;

end;

procedure TFrmCon_ProdutoVenda.BtnSelecionaProdutoClick(Sender: TObject);
begin
     frmcad_venda.edtproduto.text := inttostr(dm.QryProdutoCod_Produto.value);
     frmcad_venda.EdtPreco.SetFocus;
     close;
end;

procedure TFrmCon_ProdutoVenda.BitBtn2Click(Sender: TObject);
begin
     close;
end;

procedure TFrmCon_ProdutoVenda.EdtConsultaChange(Sender: TObject);
begin
dm.TblProduto.open;
dm.TblProduto.IndexName:='indpronom';
dm.TblProduto.FindNearest([Edtconsulta.text]);




end;

procedure TFrmCon_ProdutoVenda.FormShow(Sender: TObject);
begin
dm.TblProduto.Open;
end;

end.
