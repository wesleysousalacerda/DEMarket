
unit Cad_Venda;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, StdCtrls, Mask, DBCtrls, Grids, DBGrids, ComCtrls, Buttons,
  RXCtrls, pngimage, Tabs,AdvShapeButton,
  RzEdit, RzDBEdit, RzDBBnEd, AdvSmoothLabel, ToolEdit, CurrEdit, QuickRpt,
  QRCtrls,Printers;

type
  TFrmCad_Venda = class(TForm)
    BtnInserir: TButton;
    EdtProduto: TDBEdit;
    EdtQuantidade: TDBEdit;
    DBGrid1: TDBGrid;
    DbItemCod: TDBEdit;
    EdtPreco: TDBEdit;
    FuncInsereItem: TButton;
    GroupBox1: TGroupBox;
    Label7: TLabel;
    Label9: TLabel;
    Image1: TImage;
    AdvShapeButton1: TAdvShapeButton;
    Bevel1: TBevel;
    Label1: TLabel;
    Label3: TLabel;
    Panel1: TPanel;
    btsair: TBitBtn;
    btvenda: TBitBtn;
    btclientes: TBitBtn;
    btncomprovante: TBitBtn;
    BitBtn5: TBitBtn;
    btcalculadora: TBitBtn;
    BitBtn1: TBitBtn;
    pnavista: TPanel;
    Label6: TLabel;
    Label8: TLabel;
    etentrada: TCurrencyEdit;
    ettroco: TCurrencyEdit;
    pncliente: TPanel;
    Label10: TLabel;
    SpeedButton1: TSpeedButton;
    detcliente: TDBEdit;
    BitBtn2: TBitBtn;
    Memo1: TMemo;
    Label4: TLabel;
    lbl1: TLabel;
    shp1: TShape;
    edttotalvenda: TEdit;
    edtTotalItem: TEdit;
    lbllbtotal: TLabel;
    lbllbitnes: TLabel;
    lbl2: TLabel;
    procedure EdtProdutoExit(Sender: TObject);
    procedure BtnInserirClick(Sender: TObject);
    procedure FuncInsereItemClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure EdtPrecoEnter(Sender: TObject);
    procedure EdtPrecoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure EdtQuantidadeKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure SpeedButton1Click(Sender: TObject);
    procedure btpagavistaClick(Sender: TObject);
    procedure EdtProdutoKeyPress(Sender: TObject; var Key: Char);
    procedure EdtPrecoKeyPress(Sender: TObject; var Key: Char);
    procedure EdtQuantidadeKeyPress(Sender: TObject; var Key: Char);
    procedure AdvShapeButton1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure EdtProdutoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure EdtQuantidadeExit(Sender: TObject);
    procedure btsairClick(Sender: TObject);
    procedure btvendaClick(Sender: TObject);
    procedure btclientesClick(Sender: TObject);
    procedure btcalculadoraClick(Sender: TObject);
    procedure btvendasClick(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure EdtQuantidadeEnter(Sender: TObject);
    procedure etentradaExit(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);

    procedure edtcodbarrasKeyPress(Sender: TObject; var Key: Char);

    procedure DBGrid1DblClick(Sender: TObject);
    procedure etentradaKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure ettrocoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btncomprovanteClick(Sender: TObject);
    procedure EdtProdutoChange(Sender: TObject);



    

   private
     arq_impress:TextFile;
    { Private declarations }
  public
    { Public declarations }

     codcliente, coditem : integer;

  end;

var
  FrmCad_Venda: TFrmCad_Venda;


implementation

uses UDM, Principal, Con_ProdutoVenda, Con_Cliente, Sel_Cliente, Unit1,
  pagaqvista, tipopagamento, form_prazo, pagamento, DB, Variants,
  Con_Produto, Con_Venda, Con_Fornecedores, Cad_Cliente, comprovante;

{$R *.DFM}



procedure TFrmCad_Venda.EdtProdutoExit(Sender: TObject);
begin
    If edtproduto.Text <> '' then
      begin
     with dm.QryProduto do
          begin
          close;
          sql.Clear;
          sql.add ('SELECT * FROM PRODUTO WHERE COD_PRODUTO = ' + Edtproduto.text + ' ');
          open;
          if recordcount = 0 then
             begin
                  showmessage ('Produto não cadastro');
                  EdtProduto.SelectAll;
                  edtproduto.SetFocus;
                  exit;
             end;
          end;
          BtnInserir.Enabled := True;
       end
    
       end;



procedure TFrmCad_Venda.BtnInserirClick(Sender: TObject);
begin
     

     btnComprovante.Enabled:=true;
     dm.tblproduto.locate ('Cod_Produto', dm.QryProdutoCod_Produto.value, []);
    

     DbItemCod.Text := inttostr(coditem);
     dm.tblItem.post;

          with dm.QryItem do
          begin
               close;
               sql.Clear;
               sql.Add ('SELECT * FROM ITEM WHERE COD_ITEM = ' + inttostr(coditem) + ' ORDER BY COD_ITEM DESC');
               OPEN;
               edttotalitem.text := inttostr(recordcount);
               dm.total := dm.total + dm.QryItemtotalvenda.Value;
          end;
          with dm.QryProduto do
          begin
              close;
              sql.Clear;
              sql.add ('SELECT * FROM PRODUTO');
              open;
          end;

     dm.QryItem.Refresh;
     FuncInsereItem.OnClick (self);
     BtnInserir.Enabled := false;
    Edttotalvenda.Text := floattostr(dm.total);



end;


procedure TFrmCad_Venda.FuncInsereItemClick(Sender: TObject);
begin
     dm.tblItem.Insert;
end;



procedure TFrmCad_Venda.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if key = vk_F1 Then  begin
   AdvShapeButton1.OnClick(self);
   end;
If key = vk_F2 then begin
  btvenda.OnClick(Self);

end;
if key= VK_F3 then
  if btnComprovante.Enabled=true then
    begin
    btncomprovante.OnClick(Self);

    end;
 if Key= VK_F4 then
    btsair.OnClick(self);

 end;
procedure TFrmCad_Venda.EdtPrecoEnter(Sender: TObject);
begin
          EdtPreco.Text := floattostr(DM.QryProdutoPreco.value);
          edtpreco.SelectAll;

end;


procedure TFrmCad_Venda.EdtPrecoKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if Key = VK_RETURN then Perform(Wm_NextDlgCtl,0,0);
end;

procedure TFrmCad_Venda.EdtQuantidadeKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
if Key = VK_RETURN then Perform(Wm_NextDlgCtl,0,0);
end;



procedure TFrmCad_Venda.SpeedButton1Click(Sender: TObject);
begin
try
FrmCad_Cliente:=TFrmCad_Cliente.Create(self);
FrmCad_Cliente.ShowModal;
finally
  FrmCad_Cliente.Free;
  FrmCad_Cliente:=nil;
end;

end;

procedure TFrmCad_Venda.btpagavistaClick(Sender: TObject);
begin
try
Form_pagavista:=TForm_pagavista.Create(self);
FrmCad_Cliente.ShowModal;
finally
  Form_pagavista.Free;
  Form_pagavista:=nil;
end;

end;

procedure TFrmCad_Venda.EdtProdutoKeyPress(Sender: TObject; var Key: Char);
begin
if not (key in['0'..'9',chr(8)]) then
key :=#0;
end;

procedure TFrmCad_Venda.EdtPrecoKeyPress(Sender: TObject; var Key: Char);
begin
if not (key in['0'..'9',chr(8),chr(44)]) then
key :=#0;
end;

procedure TFrmCad_Venda.EdtQuantidadeKeyPress(Sender: TObject;
  var Key: Char);
begin
if not (key in['0'..'9',chr(8)]) then
key :=#0;
end;

procedure TFrmCad_Venda.AdvShapeButton1Click(Sender: TObject);
begin
frmcon_Produtovenda.show;
dm.TblItem.Edit;
end;

procedure TFrmCad_Venda.FormShow(Sender: TObject);
begin
     Memo1.Clear;
     btnComprovante.Enabled:=false;
     dm.QryProduto.open;
     dm.tblVenda.open;
     dm.TblItem.open;
     dm.TblItem.Edit;
     dm.tblvenda.last;
     coditem := dm.TblVendaCod_Venda.Value + 1;
     FuncInsereItem.OnClick (self);
     Edttotalvenda.Text:='0';
     EdtTotalItem.Text:='0';
     etentrada.Clear;
     ettroco.Clear;
     EdtQuantidade.Text:='1';
     while not dm.TblItem.Eof do
     dm.TblItem.Delete;
     end;
 procedure TFrmCad_Venda.EdtProdutoKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if Key = VK_RETURN then Perform(Wm_NextDlgCtl,0,0);
end;

procedure TFrmCad_Venda.EdtQuantidadeExit(Sender: TObject);
begin
if  ((dm.TblProdutoQuant.Value >= dm.TblItemQuantidade.Value)and(EdtProduto.Text<>'')and((EdtQuantidade.Text<>'0')and(EdtQuantidade.Text<>''))) then
      begin
      BtnInserir.Enabled := True;
      BtnInserir.OnClick(Self);
      end
    
      end;

procedure TFrmCad_Venda.btsairClick(Sender: TObject);
begin


   if MessageBox(0,'Deseja realmente sair?','DEMarket',MB_YESNO + MB_ICONQUESTION)=mrYes  then
        begin     dm.total := 0;
          EdtTotalItem.Text := '0';
          dm.qryproduto.close;
          dm.tblvenda.close;
          dm.tblItem.close;
          dm.qryItem.close;
          close;
        end;
end;

procedure TFrmCad_Venda.btvendaClick(Sender: TObject);
begin
if  ((Edttotalvenda.Text<>'0') and (etentrada.Value >= strtofloat(Edttotalvenda.text)))or (detcliente.Text<>'') then
  begin
      if MessageBox(0, 'Deseja finalizar venda?', 'DEMarket', MB_ICONQUESTION or MB_YESNO)=mryes then

      begin

        dm.TblVenda.Insert;

        dm.TblVendaCod_Cliente.value := codcliente;
        dm.TblVendaData.Value := Date;
        dm.Tblvendatotal.Value := strtofloat(Edttotalvenda.text);
        dm.TblVendaCod_Item.value := coditem;
        dm.TblVenda.Post;
        dm.TblProduto.Post;
        Formpagamento.Close;
        dm.total := 0;
        Edttotalvenda.Text := '0';
        dm.qryproduto.close;
        dm.tblvenda.close;
        dm.tblItem.close;
        dm.qryItem.close;
        dm.QryProduto.open;
        dm.tblVenda.open;
        dm.TblItem.open;
        dm.TblItem.Edit;
        dm.tblvenda.last;
        coditem := dm.TblVendaCod_Venda.Value + 1;
        FuncInsereItem.OnClick (self);
        Edttotalvenda.Text:='0';
        EdtTotalItem.Text:='0';
        etentrada.Clear;
        ettroco.Clear;
        dm.total := 0;
        Edttotalvenda.Text := '0';
        dm.qryproduto.close;
        dm.tblvenda.close;
        dm.tblItem.close;
        dm.qryItem.close;
        dm.QryProduto.open;
        dm.tblVenda.open;
        dm.TblItem.open;
        dm.TblItem.Edit;
        dm.tblvenda.last;
        coditem := dm.TblVendaCod_Venda.Value + 1;
        FuncInsereItem.OnClick (self);
        Edttotalvenda.Text:='0';
        EdtTotalItem.Text:='0';
        etentrada.Clear;
        ettroco.Clear;
        while not dm.TblItem.Eof do
        dm.TblItem.Delete;
        with dm.Qryitem do
          begin
               close;
               sql.Clear;
               sql.Add('DELETE FROM ITEM WHERE COD_ITEM = ' + inttostr(coditem));
               ExecSQL;
          end ;
          end;
          end
          else
          ShowMessage('Insira o pagamento ou selecione o cliente!');

          end;







procedure TFrmCad_Venda.btclientesClick(Sender: TObject);
begin
try
FrmCon_Cliente:=TFrmCon_Cliente.Create(self);
FrmCon_Cliente.ShowModal;
finally
  FrmCon_Cliente.Free;
  FrmCon_Cliente:=nil;
end;

end;

procedure TFrmCad_Venda.btcalculadoraClick(Sender: TObject);
begin
WinExec('C:\Windows\system32\calc.exe',SW_SHOWNORMAL);
end;

procedure TFrmCad_Venda.btvendasClick(Sender: TObject);
begin
  try
FrmCon_Fornecedores:=TFrmCon_Fornecedores.Create(self);
FrmCon_Fornecedores.ShowModal;
finally
  FrmCon_Fornecedores.Free;
  FrmCon_Fornecedores:=nil;
end;
end;

procedure TFrmCad_Venda.BitBtn1Click(Sender: TObject);
begin
try
FrmSel_Cliente:=TFrmSel_Cliente.Create(self);
FrmSel_Cliente.ShowModal;
finally
  FrmSel_Cliente.Free;
  FrmSel_Cliente:=nil;
end;

end;

procedure TFrmCad_Venda.EdtQuantidadeEnter(Sender: TObject);
begin
  EdtQuantidade.Text:='1';
if EdtProduto.Text<>'' then
  begin
EdtPreco.Text := floattostr(DM.QryProdutoPreco.value);

         edtpreco.SelectAll;
  end
  
  
end;

procedure TFrmCad_Venda.etentradaExit(Sender: TObject);
var t,e :double;
begin
t:=strtofloat(Edttotalvenda.Text);
e:=etentrada.Value;
 if ((e<>0) and (e>=t)) then
  begin
  ettroco.Value:=(e-t);
  btvenda.Enabled:=true;
  Label4.Visible:=false;
  etentrada.Color:=clWhite;
  end
  else
  begin
  ettroco.Text:='0';
  btvenda.Enabled:=false;
  Label4.Visible:=true;
  etentrada.Color:=clRed;
  etentrada.SetFocus;
  end;

end;

procedure TFrmCad_Venda.FormClose(Sender: TObject;
  var Action: TCloseAction);

begin
     dm.total := 0;
     EdtTotalItem.Text := '0';
     dm.qryproduto.close;
     dm.tblvenda.close;
     dm.tblItem.close;
     dm.qryItem.close;
     close;
     btvenda.Enabled:=false;

end;



procedure TFrmCad_Venda.edtcodbarrasKeyPress(Sender: TObject;
  var Key: Char);
begin
if not (key in['0'..'9',chr(8)]) then
key :=#0;
end;


procedure TFrmCad_Venda.DBGrid1DblClick(Sender: TObject);
var x:integer;
begin
     if DBGrid1.Columns.Items[1].Field.AsString<>'' then
      begin
     if MessageBox(0, 'Deseja relamente excluir item?', 'DEMarket', MB_ICONQUESTION or MB_YESNO)=mryes then
     begin
     dm.TblItem.locate ('Cod_Produto', dm.QryItemCod_Produto.Value, []);
     dm.total := dm.total - (dm.QryItemPreco.Value * DM.QryItemQuantidade.Value);
     dm.TblItem.Delete;;
     dm.Tblitem.Close;
     dm.Qryitem.Close;
     dm.Tblitem.open;
     dm.Qryitem.open;
     Edttotalvenda.Text := floattostr(dm.total);
     x:=strtoint(EdtTotalItem.Text);
     EdtTotalItem.Text:=inttostr(x -1);
     dm.TblItem.Refresh;
     dm.Qryitem.Refresh;
     DBGrid1.Refresh;

        end;end;
end;



procedure TFrmCad_Venda.etentradaKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if Key = VK_RETURN then Perform(Wm_NextDlgCtl,0,0);
end;

procedure TFrmCad_Venda.ettrocoKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if Key = VK_RETURN then Perform(Wm_NextDlgCtl,0,0);
end;

procedure TFrmCad_Venda.btncomprovanteClick(Sender: TObject);
begin
AssignFile(arq_impress,'D:\coisas\supermercado\bd\duplicata.txt');
Rewrite(arq_impress);
printer.canvas.Font.Name:='Courier new';
printer.canvas.Font.Size:=12;
Writeln(arq_impress,'Nota Promissória');
System.CloseFile(arq_impress);
dm.TblItem.First;
while not dm.TblItem.Eof do
begin
  dm.TblProduto.Locate('Cod_Produto', dm.TblItemCod_Produto.Value, []);
  Memo1.Lines.Add(dm.TblProdutoNome.Value+' - '+dm.TblItemPreco.AsString+' ('+ dm.TblItemQuantidade.AsString+'x)');
  dm.TblItem.Next;
end;
memo1.Lines.Add('');
Memo1.Lines.Add('Total'+ ' - '+ Edttotalvenda.Text+ #13);
btnComprovante.Enabled:=false;
FrmComprovante.QuickRep1.Preview;
end;

procedure TFrmCad_Venda.EdtProdutoChange(Sender: TObject);
begin
if EdtProduto.Text<>'' then
  EdtQuantidade.Enabled:=True;

end;

end.
