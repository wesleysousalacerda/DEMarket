unit configuracao;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ColorGrd, ComCtrls, TabNotBk, pngimage, ExtCtrls, Gauges, DB,
  DBTables, IBCtrls, StdCtrls, dblookup;

type
  TFormconfiguracao = class(TForm)
    Image1: TImage;
    TabbedNotebook1: TTabbedNotebook;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Formconfiguracao: TFormconfiguracao;

implementation

uses Principal;

{$R *.dfm}

end.
