unit levantamentos;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ComCtrls, TabNotBk;

type
  TFormlevantamentos = class(TForm)
    tbnlevantamento: TTabbedNotebook;
    Memo1: TMemo;
    Button1: TButton;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Formlevantamentos: TFormlevantamentos;

implementation

uses UDM;

{$R *.dfm}

end.
