unit Rel_Produto;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, pngimage;

type
  TFrmRel_Produto = class(TForm)
    RdChave: TRadioGroup;
    BtnImprimir: TButton;
    BtnVisualizar: TButton;
    Image1: TImage;
    procedure BtnImprimirClick(Sender: TObject);
    procedure BtnVisualizarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmRel_Produto: TFrmRel_Produto;

implementation

uses UDM, QR_Produto;

{$R *.DFM}

procedure TFrmRel_Produto.BtnImprimirClick(Sender: TObject);
begin
BtnVisualizar.OnClick(Self);
end;

procedure TFrmRel_Produto.BtnVisualizarClick(Sender: TObject);
begin
  If rdchave.ItemIndex = -1 then
     begin
        showmessage ('Selecione uma ordem de impressão');
        exit;
     end;

     with dm.qryproduto do
     begin
          close;
          sql.clear;
          sql.add('SELECT * FROM PRODUTO ORDER BY');
          if rdchave.ItemIndex = 0 then
             sql.add(' COD_PRODUTO')
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
        frmqr_produto.quickrep1.print
     else
        frmqr_produto.quickrep1.preview;
        FrmRel_Produto.Close;
end;

end.
