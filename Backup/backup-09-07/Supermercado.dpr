program Supermercado;

uses
  Forms,
  Principal in 'Principal.pas' {FrmPrincipal},
  Cad_Cliente in 'Cad_Cliente.pas' {FrmCad_Cliente},
  Sobre in 'Sobre.pas' {FrmSobre},
  Cad_Produto in 'Cad_Produto.pas' {FrmCad_Produto},
  UDM in 'UDM.pas' {DM: TDataModule},
  Con_Cliente in 'Con_Cliente.pas' {FrmCon_Cliente},
  Con_Produto in 'Con_Produto.pas' {FrmCon_Produto},
  Con_Venda in 'Con_Venda.pas' {FrmCon_Venda},
  Cad_Venda in 'Cad_Venda.pas' {FrmCad_Venda},
  Rel_Cliente in 'Rel_Cliente.pas' {FrmRel_Cliente},
  Con_ProdutoVenda in 'Con_ProdutoVenda.pas' {FrmCon_ProdutoVenda},
  Sel_Cliente in 'Sel_Cliente.pas' {FrmSel_Cliente},
  QR_Cliente in 'QR_Cliente.pas' {FrmQR_Cliente},
  Rel_Produto in 'Rel_Produto.pas' {FrmRel_Produto},
  Rel_Venda in 'Rel_Venda.pas' {FrmRel_Venda},
  QR_Produto in 'QR_Produto.pas' {FrmQR_Produto},
  QR_Venda in 'QR_Venda.pas' {FrmQR_Venda},
  pagaqvista in 'pagaqvista.pas' {Form_pagavista},
  tipopagamento in 'tipopagamento.pas' {Formtipodecompra},
  form_prazo in 'form_prazo.pas' {formprazo},
  levantamentos in 'levantamentos.pas' {Formlevantamentos},
  estoque in 'estoque.pas' {Formestoque},
  configuracao in 'D:\coisas\SUPERMERCADO\configuracao.pas' {Formconfiguracao};

{$R *.RES}

begin
  Application.Initialize;
  Application.Title := 'WWW - Supermercado  2012';
  Application.HelpFile := 'D:\DicasDelphi.chm';
  Application.CreateForm(TFrmPrincipal, FrmPrincipal);
  Application.CreateForm(TFrmCad_Cliente, FrmCad_Cliente);
  Application.CreateForm(TFrmSobre, FrmSobre);
  Application.CreateForm(TFrmCad_Produto, FrmCad_Produto);
  Application.CreateForm(TDM, DM);
  Application.CreateForm(TFrmCon_Cliente, FrmCon_Cliente);
  Application.CreateForm(TFrmCon_Produto, FrmCon_Produto);
  Application.CreateForm(TFrmCon_Venda, FrmCon_Venda);
  Application.CreateForm(TFrmCad_Venda, FrmCad_Venda);
  Application.CreateForm(TFrmRel_Cliente, FrmRel_Cliente);
  Application.CreateForm(TFrmCon_ProdutoVenda, FrmCon_ProdutoVenda);
  Application.CreateForm(TFrmSel_Cliente, FrmSel_Cliente);
  Application.CreateForm(TFrmQR_Cliente, FrmQR_Cliente);
  Application.CreateForm(TFrmRel_Produto, FrmRel_Produto);
  Application.CreateForm(TFrmRel_Venda, FrmRel_Venda);
  Application.CreateForm(TFrmQR_Produto, FrmQR_Produto);
  Application.CreateForm(TFrmQR_Venda, FrmQR_Venda);
  Application.CreateForm(TForm_pagavista, Form_pagavista);
  Application.CreateForm(TFormtipodecompra, Formtipodecompra);
  Application.CreateForm(Tformprazo, formprazo);
  Application.CreateForm(TFormlevantamentos, Formlevantamentos);
  Application.CreateForm(TFormestoque, Formestoque);
  Application.CreateForm(TFormconfiguracao, Formconfiguracao);
  Application.Run;
end.
