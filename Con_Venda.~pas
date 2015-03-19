unit Con_Venda;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, Grids, DBGrids, ExtCtrls, Mask, pngimage;

type
  TFrmCon_Venda = class(TForm)
    DBGrid1: TDBGrid;
    BtnConsulta: TBitBtn;
    BitBtn2: TBitBtn;
    Rdchave: TRadioGroup;
    EdtConsulta: TMaskEdit;
    BtnExcluir: TBitBtn;
    procedure BtnConsultaClick(Sender: TObject);
    procedure RdchaveClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure BtnExcluirClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmCon_Venda: TFrmCon_Venda;

implementation

uses UDM, Sel_Cliente;

{$R *.DFM}

procedure TFrmCon_Venda.BtnConsultaClick(Sender: TObject);
begin
     If edtconsulta.Text = '' then
        begin
             showmessage ('Digite uma consulta');
             exit;
        end;

     with dm.QryVenda do
          begin
               close;
               sql.clear;
               sql.add ('SELECT * FROM VENDA WHERE');
               If rdchave.ItemIndex = 0 then
                      sql.add ('COD_VENDA = '+Edtconsulta.text+'')
               else
                      sql.add ('Data = '+Edtconsulta.text+'');

               If recordcount = 0 then
                  showmessage ('Venda não encontrada');

               edtconsulta.selectall;
               edtconsulta.SetFocus;

          end;
end;

procedure TFrmCon_Venda.RdchaveClick(Sender: TObject);
begin
     if Rdchave.ItemIndex = 1 then
        edtconsulta.EditMask := '!99/99/0000;1;_'
     else
        edtconsulta.EditMask := '';

end;

procedure TFrmCon_Venda.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
     dm.QryVenda.Close;
     dm.tblvenda.Close;
end;

procedure TFrmCon_Venda.FormShow(Sender: TObject);
begin
     dm.QryVenda.open;
     dm.TblVenda.open;
end;

procedure TFrmCon_Venda.BtnExcluirClick(Sender: TObject);

begin
dm.tblvenda.locate ('Cod_Venda', dm.QryVendaCod_Venda.value, []);
if MessageBox(0, 'Deseja relamente excluir venda?', 'DEMarket', MB_ICONQUESTION or MB_YESNO)=mryes then
     
     dm.tblVenda.Delete;
     dm.TblVenda.Close;
     dm.QryVenda.Close;
     dm.TblVenda.open;
     dm.QryVenda.open;
     dm.QryVenda.Refresh;
     DBGrid1.Refresh;

end;

end.
