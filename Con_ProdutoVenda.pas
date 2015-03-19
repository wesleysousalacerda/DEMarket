unit Con_ProdutoVenda;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Grids, DBGrids, Buttons, pngimage, ExtCtrls, DBCtrls;

type
  TFrmCon_ProdutoVenda = class(TForm)
    BitBtn2: TBitBtn;
    BtnSelecionaProduto: TBitBtn;
    DBGrid2: TDBGrid;
    EdtConsulta: TEdit;
    Label10: TLabel;
    Label1: TLabel;
    Image1: TImage;

    procedure BtnSelecionaProdutoClick(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure EdtConsultaChange(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure DBGrid2DblClick(Sender: TObject);
    procedure DBGrid2CellClick(Column: TColumn);
    procedure DBGrid2KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
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



procedure TFrmCon_ProdutoVenda.BtnSelecionaProdutoClick(Sender: TObject);
begin
     dm.tblproduto.locate ('Cod_Produto', dm.QryProdutoCod_Produto.value, []);
     frmcad_venda.edtproduto.text := inttostr(dm.QryProdutoCod_Produto.value);
     frmcad_venda.EdtQuantidade.SetFocus;
     close;
end;

procedure TFrmCon_ProdutoVenda.BitBtn2Click(Sender: TObject);
begin
     close;
end;

procedure TFrmCon_ProdutoVenda.EdtConsultaChange(Sender: TObject);
begin
with dm.QryProduto do
          begin
               close;
               sql.clear;
               sql.add ('SELECT * FROM PRODUTO WHERE NOME LIKE '+#39+EdtConsulta.Text+'%'+#39+' order by NOME');
               open;
end;
end;


procedure TFrmCon_ProdutoVenda.FormShow(Sender: TObject);
begin

dm.QryProduto.Close;
DM.QryProduto.SQL.Clear;
dm.QryProduto.SQL.Add('SELECT * FROM PRODUTO ORDER BY NOME');
DM.QryProduto.open;

end;

procedure TFrmCon_ProdutoVenda.DBGrid2DblClick(Sender: TObject);
begin
    dm.tblproduto.locate ('Cod_Produto', dm.QryProdutoCod_Produto.value, []);
     frmcad_venda.edtproduto.text := inttostr(dm.QryProdutoCod_Produto.value);
     frmcad_venda.EdtQuantidade.SetFocus;
     close;


    
end;

procedure TFrmCon_ProdutoVenda.DBGrid2CellClick(Column: TColumn);
begin
Label1.Caption:=DM.TblProdutoCod_Produto.AsString;
end;

procedure TFrmCon_ProdutoVenda.DBGrid2KeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
   if Key = VK_RETURN then BtnSelecionaProduto.OnClick(Self);
end;

end.
