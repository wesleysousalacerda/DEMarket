unit Con_Produto;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, Grids, DBGrids, pngimage, ExtCtrls;

type
  TFrmCon_Produto = class(TForm)
    Label1: TLabel;
    EdtConsulta: TEdit;
    DBGrid1: TDBGrid;
    BtnConsulta: TBitBtn;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    Image1: TImage;
    procedure BitBtn2Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure BtnConsultaClick(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmCon_Produto: TFrmCon_Produto;

implementation

uses UDM, Cad_Produto;

{$R *.DFM}

procedure TFrmCon_Produto.BitBtn2Click(Sender: TObject);
begin
     CLose;
end;

procedure TFrmCon_Produto.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
     dm.QryProduto.close;
end;

procedure TFrmCon_Produto.FormShow(Sender: TObject);
begin
     dm.QryProduto.SQL.Clear;
     dm.QryProduto.SQL.add('SELECT * FROM PRODUTO ORDER BY NOME');
     dm.QryProduto.Open;
end;

procedure TFrmCon_Produto.BtnConsultaClick(Sender: TObject);
begin
     if Edtconsulta.Text = '' then
        begin
             showmessage('Digite a consulta');
             exit;
        end;
     with dm.QryProduto do
          begin
               close;
               sql.clear;
               sql.add ('SELECT * FROM PRODUTO WHERE NOME LIKE '+ #39 + Edtconsulta.text + '%' + #39 +  ' order by NOME');
               open;
               if recordcount = 0 then
                  showmessage ('Nenhum registro encontrado');
               edtconsulta.SelectAll;
               edtconsulta.SetFocus;

          end;
end;

procedure TFrmCon_Produto.BitBtn1Click(Sender: TObject);
begin
     frmcad_produto.show;
     dm.TblProduto.Locate ('Cod_Produto', dm.TblProdutoCod_Produto.value, []);
     frmcad_produto.btnlocalizar.Enabled := false;
end;

end.
