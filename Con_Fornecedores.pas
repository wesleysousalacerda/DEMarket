unit Con_Fornecedores;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Buttons, StdCtrls, Grids, DBGrids, pngimage, ExtCtrls;

type
  TFrmCon_Fornecedores = class(TForm)
    EdtConsulta: TEdit;
    DBGrid1: TDBGrid;
    SBEditar: TSpeedButton;
    SBSair: TSpeedButton;
    Label1: TLabel;
    procedure SBEditarClick(Sender: TObject);
    procedure SBSairClick(Sender: TObject);
    
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure EdtConsultaChange(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmCon_Fornecedores: TFrmCon_Fornecedores;

implementation

uses udm, cad_fornecedores;
{$R *.dfm}

procedure TFrmCon_Fornecedores.SBEditarClick(Sender: TObject);
begin
    FrmCad_Fornecedores.show;
    dm.TblFornecedores.locate ('Codigo', dm.qryFornecedoresCodigo.value, []);
    FrmCad_Fornecedores.BtnLocalizar.Enabled := false;
end;

procedure TFrmCon_Fornecedores.SBSairClick(Sender: TObject);
begin
close;

end;


procedure TFrmCon_Fornecedores.FormShow(Sender: TObject);
begin
    dm.QryFornecedores.Open;
    dm.TblFornecedores.Open;

end;

procedure TFrmCon_Fornecedores.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
      dm.QryFornecedores.Close;
      dm.TblFornecedores.Close;
end;

procedure TFrmCon_Fornecedores.EdtConsultaChange(Sender: TObject);
begin
with dm.QryFornecedores do
          begin
               close;
               sql.clear;
               sql.add ('SELECT * FROM FORNECEDORES WHERE NOME LIKE '+#39+EdtConsulta.Text+'%'+#39+' order by NOME');
               open;
end;
end;

end.
