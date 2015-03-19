unit pagamento;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, pngimage, ExtCtrls, StdCtrls, Mask, ToolEdit, CurrEdit, Buttons,
  DBCtrls, jpeg, ComCtrls;

type
  TFormpagamento = class(TForm)
    Panel1: TPanel;
    Image1: TImage;
    Shape1: TShape;
    Label2: TLabel;
    ettotal: TCurrencyEdit;
    Image2: TImage;
    Panel2: TPanel;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure etentradaKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    public
    { Public declarations }

       codcliente, coditem : integer;
  end;

var
  Formpagamento: TFormpagamento;

implementation

uses UDM, Con_Cliente, conclientevenda, Cad_Cliente, Cad_Venda,
  Sel_Cliente;

{$R *.dfm}

procedure TFormpagamento.BitBtn1Click(Sender: TObject);
begin
FrmSel_Cliente.showmodal;
end;


























procedure TFormpagamento.BitBtn3Click(Sender: TObject);
begin
if Application.MessageBox('Deseja realmente cancelar venda?','DEMarket',MB_YESNO + MB_ICONQUESTION)=idyes
then begin
dm.TblVenda.Cancel;
FrmCad_Venda.Close;
close;
end;
end;

procedure TFormpagamento.SpeedButton1Click(Sender: TObject);
begin
FrmCad_Cliente.ShowModal;

end;




procedure TFormpagamento.BitBtn5Click(Sender: TObject);
begin

 dm.TblVenda.Insert;
     dm.TblVendaCod_Cliente.value := FrmCad_Venda.codcliente;
     dm.TblVendaData.Value := Date;
     dm.Tblvendatotal.Value := strtofloat(Formpagamento.ettotal.text);
     dm.TblVendaCod_Item.value := FrmCad_Venda.coditem;
     dm.TblVenda.Post;
end;

procedure TFormpagamento.FormShow(Sender: TObject);
begin
dm.tblvenda.edit;

end;



procedure TFormpagamento.etentradaKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if Key = VK_RETURN then Perform(Wm_NextDlgCtl,0,0);
end;

end.
