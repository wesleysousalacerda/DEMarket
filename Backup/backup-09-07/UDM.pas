unit UDM;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, DBTables, ImgList, StdCtrls, Mask, DBCtrls;

type
  TDM = class(TDataModule)
    BancodeDados: TDatabase;
    TblCliente: TTable;
    DtsCliente: TDataSource;
    DtsProduto: TDataSource;
    QryProduto: TQuery;
    QryItem: TQuery;
    DtsItem: TDataSource;
    DtsVenda: TDataSource;
    QryVenda: TQuery;
    ListadeImagens: TImageList;
    DtsQryVenda: TDataSource;
    DtsQryItem: TDataSource;
    DtsQryProduto: TDataSource;
    TblProduto: TTable;
    TblItem: TTable;
    TblVenda: TTable;
    QryCliente: TQuery;
    QryClienteCod_Cliente: TIntegerField;
    QryClienteNome: TStringField;
    QryClienteTelefone: TIntegerField;
    QryClienteDocumento: TIntegerField;
    DbItemQuantidade: TDBEdit;
    TblClienteCod_Cliente: TAutoIncField;
    TblClienteNome: TStringField;
    TblClienteTelefone: TIntegerField;
    TblClienteDocumento: TIntegerField;
    QryVendaNomeCliente: TStringField;
    TblProdutoCod_Produto: TAutoIncField;
    TblProdutoNome: TStringField;
    TblProdutoPreco: TFloatField;
    TblProdutoData: TDateField;
    TblItemCodigo: TAutoIncField;
    TblItemCod_Item: TIntegerField;
    TblItemCod_Produto: TIntegerField;
    TblItemPreco: TFloatField;
    TblItemQuantidade: TFloatField;
    TblVendaCod_Venda: TAutoIncField;
    TblVendaCod_Cliente: TIntegerField;
    TblVendaCod_Item: TIntegerField;
    TblVendaData: TDateField;
    QryVendaCod_Venda: TIntegerField;
    QryVendaCod_Cliente: TIntegerField;
    QryVendaCod_Item: TIntegerField;
    QryVendaData: TDateField;
    QryItemCodigo: TIntegerField;
    QryItemCod_Item: TIntegerField;
    QryItemCod_Produto: TIntegerField;
    QryItemPreco: TFloatField;
    QryItemQuantidade: TFloatField;
    QryProdutoCod_Produto: TIntegerField;
    QryProdutoNome: TStringField;
    QryProdutoPreco: TFloatField;
    QryProdutoData: TDateField;
    QryItemNomeProduto: TStringField;
    TblItemtotal: TFloatField;
    QryItemtotalvenda: TFloatField;
    TblVendaTotal: TFloatField;
    QryVendaTotal: TFloatField;
    ImageList1: TImageList;
    TblProdutoDescricao: TMemoField;
    TblProdutoSecao: TStringField;
    TblProdutoPrecocompra: TFloatField;
    TblProdutoValidade: TDateField;
    procedure DtsClienteStateChange(Sender: TObject);
    procedure DtsProdutoStateChange(Sender: TObject);
    procedure QryItemCalcFields(DataSet: TDataSet);
  private
    { Private declarations }
  public
  total : real;
  end;

var
  DM: TDM;

implementation

uses Cad_Cliente, Cad_Produto, Cad_Venda;

{$R *.DFM}

procedure TDM.DtsClienteStateChange(Sender: TObject);
begin
     {habilitando/desabilitando botões}
     if (TblCliente.State = dsInsert) or
        (TblCliente.State = dsEdit) then
     begin
          {se a tabela estiver em inserção ou edição}
          if frmCad_Cliente.Visible then
          begin
               {se o formulario de cadastro estiver ativo}
               with frmCad_Cliente do
               begin
                    btnNovo.Enabled     := false;
                    btnSalvar.Enabled   := true;
                    btnExcluir.Enabled  := false;
                    btnSair.Enabled     := true;
                    btnLocalizar.Enabled:= true;
               end;
          end;
     end
     else
     begin
          {se a tabela não estiver em inserção ou edição}
          if FrmCad_Cliente.Visible then
          begin
               {se o formulario de cadastro estiver ativo}
               with FrmCad_Cliente do
               begin
                    btnNovo.Enabled     := true;
                    btnSalvar.Enabled   := false;
                    btnExcluir.Enabled  := true;
                    btnSair.Enabled     := true;
                    btnLocalizar.Enabled:= true;
               end;
          end;
     end;
end;
procedure TDM.DtsProdutoStateChange(Sender: TObject);
begin
     {habilitando/desabilitando botões}
     if (TblProduto.State = dsInsert) or
        (TblProduto.State = dsEdit) then
     begin
          {se a tabela estiver em inserção ou edição}
          if frmCad_Produto.Visible then
          begin
               {se o formulario de cadastro estiver ativo}
               with frmCad_Produto do
               begin
                    btnNovo.Enabled     := false;
                    btnSalvar.Enabled   := true;
                    btnExcluir.Enabled  := false;
                    btnSair.Enabled     := true;
                    btnLocalizar.Enabled:= false;
               end;
          end;
     end
     else
     begin
          {se a tabela não estiver em inserção ou edição}
          if FrmCad_Produto.Visible then
          begin
               {se o formulario de cadastro estiver ativo}
               with FrmCad_Produto do
               begin
                    btnNovo.Enabled     := true;
                    btnSalvar.Enabled   := false;
                    btnExcluir.Enabled  := true;
                    btnSair.Enabled     := true;
                    btnLocalizar.Enabled:= true;
               end;
          end;
     end;
end;

procedure TDM.QryItemCalcFields(DataSet: TDataSet);
begin
     QryItemtotalvenda.Value := QryItemtotalvenda.Value + (dm.QryItemPreco.Value * dm.QryItemQuantidade.value);
     
end;

end.
