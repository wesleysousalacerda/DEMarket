unit consulta;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, StdCtrls, Buttons, ComCtrls, TabNotBk;

type
  TForm1 = class(TForm)
    TabbedNotebook1: TTabbedNotebook;
    Label1: TLabel;
    EdtConsulta: TEdit;
    BtnConsulta: TBitBtn;
    DBGrid1: TDBGrid;
    BitBtn2: TBitBtn;
    BtnConsultar: TBitBtn;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

end.
