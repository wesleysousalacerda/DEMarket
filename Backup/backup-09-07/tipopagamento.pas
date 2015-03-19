unit tipopagamento;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, pngimage;

type
  TFormtipodecompra = class(TForm)
    rgpagamento: TRadioGroup;
    Button1: TButton;
    Shape1: TShape;
    Shape2: TShape;
    Image1: TImage;
    Image2: TImage;
    Image3: TImage;
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Formtipodecompra: TFormtipodecompra;

implementation

uses pagaqvista, Sel_Cliente, UDM, Cad_Venda, form_prazo;

{$R *.dfm}

procedure TFormtipodecompra.Button1Click(Sender: TObject);
begin
if rgpagamento.ItemIndex=0 then
begin
Form_pagavista.Show;
Formtipodecompra.Close;
end
else if
rgpagamento.ItemIndex=1 THEN
begin
formprazo.showmodal;
Formtipodecompra.Close;
end

else


          begin
          frmSel_cliente.showmodal;
          dm.TblVenda.Insert;
          dm.TblVendaCod_Cliente.value := FrmCad_Venda.codcliente;
          dm.TblVendaData.Value := Date;
          dm.Tblvendatotal.Value := strtofloat(FrmCad_Venda.edttotalvenda.text);
          dm.TblVendaCod_Item.value := FrmCad_Venda.coditem;
          dm.TblVenda.Post;
          Formtipodecompra.Close;
          end;

     dm.total := 0;
     Form_pagavista.pntotal.caption:= FrmCad_Venda.Edttotalvenda.text;
     FrmCad_Venda.EdtTotalItem.Text := '0';
     dm.qryproduto.close;
     dm.tblvenda.close;
     dm.tblItem.close;
     dm.qryItem.close;
     Formtipodecompra.Close;

          with dm.Qryitem do
          begin
               close;
               sql.Clear;
               sql.Add('DELETE FROM ITEM WHERE COD_ITEM = ' + inttostr(FrmCad_Venda.coditem));
               ExecSQL;
               Formtipodecompra.Close;
          end


    END;
end.