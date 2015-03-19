unit tipopagamento;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, pngimage;

type
  TFormtipodecompra = class(TForm)
    Button1: TButton;
    Shape2: TShape;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Formtipodecompra: TFormtipodecompra;

implementation

uses pagaqvista, Sel_Cliente, UDM, Cad_Venda, form_prazo;

{$R *.dfm}

end.
