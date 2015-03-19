unit conclientevenda;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, pngimage, ExtCtrls, StdCtrls, Buttons;

type
  TFormconclientevenda = class(TForm)
    DBGrid1: TDBGrid;
    BtnConsulta: TBitBtn;
    EdtConsulta: TEdit;
    Image1: TImage;
    BitBtn2: TBitBtn;
    BtnSelecionaProduto: TBitBtn;
    procedure BtnConsultaClick(Sender: TObject);
    procedure BtnSelecionaProdutoClick(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Formconclientevenda: TFormconclientevenda;

implementation

uses UDM, pagamento, DBTables;

{$R *.dfm}

procedure TFormconclientevenda.BtnConsultaClick(Sender: TObject);
begin
 if Edtconsulta.Text = '' then
        begin
             showmessage('Digite a consulta');
             exit;
        end;
   with dm.QryCliente do
          begin
               close;
               sql.clear;
               sql.add ('SELECT * FROM CLIENTE WHERE NOME LIKE '+ #39 + Edtconsulta.text + '%' + #39 +  ' order by NOME');
               open;
               if recordcount = 0 then
               showmessage ('Nenhum registro encontrado');
               edtconsulta.SelectAll;
               edtconsulta.SetFocus;

          end;
end;

procedure TFormconclientevenda.BtnSelecionaProdutoClick(Sender: TObject);
begin
close;
end;

procedure TFormconclientevenda.BitBtn2Click(Sender: TObject);
begin
close;
end;

end.
