unit Con_Cliente;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Grids, DBGrids, StdCtrls, Buttons, db, pngimage, ExtCtrls;

type
  TFrmCon_Cliente = class(TForm)
    EdtConsulta: TEdit;
    Label1: TLabel;
    DBGrid1: TDBGrid;
    BtnConsulta: TBitBtn;
    BtnConsultar: TBitBtn;
    BitBtn2: TBitBtn;
    Image1: TImage;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BtnConsultarClick(Sender: TObject);
    procedure BtnConsultaClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmCon_Cliente: TFrmCon_Cliente;

implementation

uses UDM, Cad_Cliente, Cad_Venda;

{$R *.DFM}

procedure TFrmCon_Cliente.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
        dm.qryCliente.Close;
end;

procedure TFrmCon_Cliente.FormShow(Sender: TObject);
begin
     dm.QryCliente.SQL.Clear;
     dm.QryCliente.SQL.add('SELECT * FROM CLIENTE ORDER BY NOME');
     dm.QryCliente.Open;
end;

procedure TFrmCon_Cliente.BitBtn2Click(Sender: TObject);
begin
     close;
end;

procedure TFrmCon_Cliente.BtnConsultarClick(Sender: TObject);
begin
     frmcad_cliente.show;
     dm.tblcliente.locate ('Cod_Cliente', dm.tblClienteCod_Cliente.value, []);
     FrmCad_Cliente.BtnLocalizar.Enabled := false;
end;

procedure TFrmCon_Cliente.BtnConsultaClick(Sender: TObject);
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



end.
