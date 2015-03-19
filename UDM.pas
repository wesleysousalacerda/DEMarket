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
    DtsQryItem: TDataSource;
    DtsQryProduto: TDataSource;
    TblProduto: TTable;
    TblItem: TTable;
    TblVenda: TTable;
    QryCliente: TQuery;
    QryClienteCod_Cliente: TIntegerField;
    QryClienteNome: TStringField;
    DbItemQuantidade: TDBEdit;
    QryVendaNomeCliente: TStringField;
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
    DtsFornecedores: TDataSource;
    TblFornecedores: TTable;
    QryFornecedores: TQuery;
    DtsQryFornecedores: TDataSource;
    QryClienteEndereco: TStringField;
    TblVendaLucro: TFloatField;
    TblLogin: TTable;
    TblLoginUSUARIO: TStringField;
    TblLoginSENHA: TStringField;
    dtslogin: TDataSource;
    TblClienteCod_Cliente: TAutoIncField;
    TblClienteNome: TStringField;
    TblClienteEndereco: TStringField;
    TblClienteCPF: TStringField;
    TblClienteRG: TStringField;
    TblClienteTelefone: TStringField;
    QryClienteTelefone: TStringField;
    QryClienteCPF: TStringField;
    QryClienteRG: TStringField;
    QryProdutoDescricao: TMemoField;
    QryProdutoSecao: TStringField;
    QryProdutoPrecocompra: TCurrencyField;
    QryProdutoValidade: TDateField;
    QryProdutoUnidade: TStringField;
    QryProdutoQuant: TFloatField;
    dtsqryvenda: TDataSource;
    dslogo: TDataSource;
    tblogo: TTable;
    tblogoLOGO: TGraphicField;
    TblFornecedoresCNPJ: TStringField;
    TblFornecedoresCodigo: TAutoIncField;
    TblFornecedoresNome: TStringField;
    TblFornecedoresEndereco: TStringField;
    TblFornecedoresContato: TStringField;
    TblFornecedoresTelefone: TStringField;
    TblFornecedoresBairro: TStringField;
    TblFornecedoresEmail: TStringField;
    TblFornecedoresNome_Rep: TStringField;
    TblFornecedoresCelular: TStringField;
    TblFornecedoresCidade: TStringField;
    QryFornecedoresCNPJ: TStringField;
    QryFornecedoresCodigo: TIntegerField;
    QryFornecedoresNome: TStringField;
    QryFornecedoresEndereco: TStringField;
    QryFornecedoresContato: TStringField;
    QryFornecedoresTelefone: TStringField;
    QryFornecedoresBairro: TStringField;
    QryFornecedoresEmail: TStringField;
    QryFornecedoresNome_Rep: TStringField;
    QryFornecedoresCelular: TStringField;
    QryFornecedoresCidade: TStringField;
    TblClienteBairro: TStringField;
    TblClienteCidade: TStringField;
    QryClienteBairro: TStringField;
    QryClienteCidade: TStringField;
    qrylogin: TQuery;
    dtsqrylogin: TDataSource;
    qryloginUSUARIO: TStringField;
    qryloginSENHA: TStringField;
    QryProdutoCODBARRA: TStringField;
    TblProdutoCod_Produto: TAutoIncField;
    TblProdutoNome: TStringField;
    TblProdutoPreco: TCurrencyField;
    TblProdutoData: TDateField;
    TblProdutoDescricao: TMemoField;
    TblProdutoPrecocompra: TCurrencyField;
    TblProdutoUnidade: TStringField;
    TblProdutoQuant: TFloatField;
    TblItemCODBARRA: TStringField;
    QryItemCODBARRA: TStringField;
    qry1: TQuery;
    qry2: TQuery;
    DataSource1: TDataSource;
    DataSource2: TDataSource;
    dtfldTblVendaDatapgto: TDateField;
    TblProdutoIMAGEM: TGraphicField;
    procedure DtsClienteStateChange(Sender: TObject);
    procedure DtsProdutoStateChange(Sender: TObject);
    procedure QryItemCalcFields(DataSet: TDataSet);
    procedure TblItemAfterPost(DataSet: TDataSet);
    procedure DtsFornecedoresStateChange(Sender: TObject);
  private
    { Private declarations }
  public
  total : real;
  end;

var
  DM: TDM;

implementation

uses Cad_Cliente, Cad_Produto, Cad_Venda, Cad_Fornecedores, Con_Cliente,
  Con_Fornecedores, Con_Produto, Con_Venda;

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

procedure TDM.TblItemAfterPost(DataSet: TDataSet);
begin
dm.TblProduto.Open;
dm.TblProduto.edit;

dm.TblProdutoQuant.Value:=
dm.TblProdutoQuant.Value -
dm.TblItemQuantidade.Value;

end;


procedure TDM.DtsFornecedoresStateChange(Sender: TObject);
begin
    

     {habilitando/desabilitando botões}
     if (TblFornecedores.State = dsInsert) or
        (TblFornecedores.State = dsEdit) then
     begin
          {se a tabela estiver em inserção ou edição}
          if FrmCad_Fornecedores.Visible then
          begin
               {se o formulario de cadastro estiver ativo}
               with FrmCad_Fornecedores do
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
          if FrmCad_Fornecedores.Visible then
          begin
               {se o formulario de cadastro estiver ativo}
               with FrmCad_Fornecedores do
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

end.
