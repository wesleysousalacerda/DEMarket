unit pagaqvista;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls;

type
  TForm_pagavista = class(TForm)
    pntotal: TPanel;
    lbetEntrada: TLabeledEdit;
    pntroco: TPanel;
    Label1: TLabel;
    procedure lbetEntradaChange(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form_pagavista: TForm_pagavista;

implementation

uses Cad_Venda;

{$R *.dfm}

procedure TForm_pagavista.lbetEntradaChange(Sender: TObject);
var x,y:double;
begin

end;

end.
