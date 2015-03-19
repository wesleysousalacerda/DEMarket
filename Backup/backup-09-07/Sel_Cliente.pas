unit Sel_Cliente;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Mask, DBCtrls, Buttons, Grids, DBGrids;

type
  TFrmSel_Cliente = class(TForm)
    Label2: TLabel;
    EdtConsulta: TEdit;
    DBGrid1: TDBGrid;
    BtnConsulta: TBitBtn;
    BtnSelecionar: TBitBtn;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure BtnSelecionarClick(Sender: TObject);
    procedure BtnConsultaClick(Sender: TObject);
    procedure DBGrid1DblClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmSel_Cliente: TFrmSel_Cliente;

implementation

uses UDM, Cad_Venda;

{$R *.DFM}

procedure TFrmSel_Cliente.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
     dm.qrycliente.close;
end;

procedure TFrmSel_Cliente.FormShow(Sender: TObject);
begin
     dm.qrycliente.open;
end;

procedure TFrmSel_Cliente.BtnSelecionarClick(Sender: TObject);
begin
     FrmCad_Venda.codcliente := dm.QryClienteCod_Cliente.value;
     close;
end;

procedure TFrmSel_Cliente.BtnConsultaClick(Sender: TObject);
begin
     if EdtConsulta.Text = '' then
        begin
             showmessage ('Digite uma a consulta');
             exit;
        end;

     with dm.QryCliente do
          begin
               close;
               sql.clear;
               sql.add ('SELECT * FROM CLIENTE WHERE NOME LIKE '+#39+EdtConsulta.Text+'%'+#39+' order by NOME');
               open;
               If recordcount = 0 then
                   showmessage('Nenhum registro encontrado');
                edtconsulta.SelectAll;
                edtconsulta.SetFocus;
          end;
end;

procedure TFrmSel_Cliente.DBGrid1DblClick(Sender: TObject);
begin
FrmCad_Venda.codcliente := dm.QryClienteCod_Cliente.value;
     close;
end;

end.
