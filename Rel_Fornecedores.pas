unit Rel_Fornecedores;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, pngimage;

type
  TFrmRel_Fornecedores = class(TForm)
    Image1: TImage;
    RadioGroup1: TRadioGroup;
    Button1: TButton;
    Button2: TButton;
    procedure Button2Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmRel_Fornecedores: TFrmRel_Fornecedores;

implementation

uses UDM, QR_Fornecedores;

{$R *.dfm}

procedure TFrmRel_Fornecedores.Button2Click(Sender: TObject);
begin
  If RadioGroup1.ItemIndex = -1 then
     begin
        showmessage ('Selecione uma ordem de impressão');
        exit;
     end;

     with dm.QryFornecedores do
     begin
          close;
          sql.clear;
          sql.add('SELECT * FROM FORNECEDORES ORDER BY');
          if RadioGroup1.ItemIndex = 0 then
             sql.add(' CODIGO')
          else
                  sql.add(' NOME');
          open;
          if recordcount = 0 then
          begin
               showmessage ('Nenhum registro encontrado');
               exit;
          end;
     end;

     If sender = Button1 then
        FrmQR_Fornecedores.QRFornecedores.print
     else
        FrmQR_Fornecedores.QRFornecedores.preview;
        FrmRel_Fornecedores.Close;
end;


procedure TFrmRel_Fornecedores.Button1Click(Sender: TObject);
begin
Button2.OnClick(Self);
end;

end.
