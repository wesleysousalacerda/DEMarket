unit Rel_Venda;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, pngimage, Grids, DBGrids;

type
  TFrmRel_Venda = class(TForm)
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
  FrmRel_Venda: TFrmRel_Venda;

implementation

uses UDM, QR_Venda;

{$R *.DFM}

procedure TFrmRel_Venda.BtnImprimirClick(Sender: TObject);
begin
BtnVisualizar.OnClick(Self);
end;

procedure TFrmRel_Venda.BtnVisualizarClick(Sender: TObject);
begin
  If rdchave.ItemIndex = -1 then
     begin
        showmessage ('Selecione uma ordem de impressão');
        exit;
     end;

     with dm.qryvenda do
     begin
          close;
          sql.clear;
          sql.add('SELECT * FROM VENDA ORDER BY');
          if rdchave.ItemIndex = 0 then
             sql.add(' COD_VENDA')
          else
                  sql.add(' DATA DESC');
          open;
          if recordcount = 0 then
          begin
               showmessage ('Nenhum registro encontrado');
               exit;
          end;
     end;
     If sender = btnimprimir then
        frmqr_venda.quickrep1.print
     else
        frmqr_venda.quickrep1.preview;
        FrmRel_Venda.Close;
end;

end.
