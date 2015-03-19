unit Rel_Cliente;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, pngimage;

type
  TFrmRel_Cliente = class(TForm)
    RdChave: TRadioGroup;
    BtnImprimir: TButton;
    BtnVisualizar: TButton;
    Image1: TImage;
    procedure BtnVisualizarClick(Sender: TObject);
    procedure BtnImprimirClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmRel_Cliente: TFrmRel_Cliente;

implementation

uses UDM, QR_Cliente;

{$R *.DFM}


procedure TFrmRel_Cliente.BtnVisualizarClick(Sender: TObject);
begin
  If rdchave.ItemIndex = -1 then
     begin
        showmessage ('Selecione uma ordem de impressão');
        exit;
     end;

     with dm.qrycliente do
     begin
          close;
          sql.clear;
          sql.add('SELECT * FROM CLIENTE ORDER BY');
          if rdchave.ItemIndex = 0 then
             sql.add(' COD_CLIENTE')
          else
              sql.add(' NOME');
          open;
          if recordcount = 0 then
          begin
               showmessage ('Nenhum registro encontrado');
               exit;
          end;
     end;
     If sender = btnimprimir then
        frmqr_cliente.quickrep1.print
     else
        frmqr_cliente.quickrep1.preview;

end;

procedure TFrmRel_Cliente.BtnImprimirClick(Sender: TObject);
begin
BtnVisualizar.OnClick(Self);
end;

end.
