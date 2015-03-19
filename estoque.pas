unit estoque;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, Grids, DBGrids, Buttons, ComCtrls;

type
  TFormestoque = class(TForm)
    DBGrid1: TDBGrid;
    EdtConsulta: TEdit;
    Label1: TLabel;
    DBGrid2: TDBGrid;
    DBGrid3: TDBGrid;
    BitBtn1: TBitBtn;
    DateTimePicker1: TDateTimePicker;
    DateTimePicker2: TDateTimePicker;
    BitBtn2: TBitBtn;
    procedure EdtConsultaChange(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Formestoque: TFormestoque;

implementation

uses UDM;

{$R *.dfm}

procedure TFormestoque.EdtConsultaChange(Sender: TObject);
begin
with dm.QryProduto do
          begin
               close;
               sql.clear;
               sql.add ('SELECT * FROM PRODUTO WHERE NOME LIKE '+#39+EdtConsulta.Text+'%'+#39+' order by NOME');
               open;
end;
end;

procedure TFormestoque.FormShow(Sender: TObject);
begin
dm.QryProduto.Open;
EdtConsulta.SetFocus;
end;

procedure TFormestoque.BitBtn2Click(Sender: TObject);
begin
dm.TblVenda.Open;
dm.TblVenda.Edit;
dm.TblVenda.First;
while not dm.TblVenda.Eof do
begin
  if dm.TblVendaData.Value<DateTimePicker1.DateTime then
  begin
  ShowMessage(dm.TblVendaData.AsString);
  end;
  DM.TblVenda.Next;
  end;


end;

end.
