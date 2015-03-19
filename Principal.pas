
unit Principal;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Menus, ExtCtrls, jpeg, Gauges,  StdCtrls, Buttons, RxGIF ,
  XPMan, ComCtrls,  Mask, RXSlider, RXCtrls, RXClock, RXSpin,
  RXSwitch, ImgList, AdvSmoothButton, pngimage,  DBCtrls, ActnList    ;
type
  TFrmPrincipal = class(TForm)
    MainMenu1: TMainMenu;
    Cadastro1: TMenuItem;
    Cliente1: TMenuItem;
    Produto1: TMenuItem;
    N1: TMenuItem;
    Sair1: TMenuItem;
    Consulta1: TMenuItem;
    Cliente2: TMenuItem;
    Produto2: TMenuItem;
    Venda1: TMenuItem;
    Relatrio1: TMenuItem;
    Sobre1: TMenuItem;
    Venda2: TMenuItem;
    Cliente3: TMenuItem;
    Produto3: TMenuItem;
    Venda3: TMenuItem;
    btcadastro: TBitBtn;
    XPManifest1: TXPManifest;
    btconsulta: TBitBtn;
    btrelatorio: TBitBtn;
    btcadcliente: TBitBtn;
    btcadproduto: TBitBtn;
    btcadvenda: TBitBtn;
    Image: TImage;
    btconcliente: TBitBtn;
    btconproduto: TBitBtn;
    btconvenda: TBitBtn;
    btrelcliente: TBitBtn;
    btrelproduto: TBitBtn;
    btrelvenda: TBitBtn;
    btlevantamentos: TBitBtn;
    StatusBar1: TStatusBar;
    btlevvalidade: TBitBtn;
    btlevproduto: TBitBtn;
    btlevfinancas: TBitBtn;
    Ajuda1: TMenuItem;
    btsair: TBitBtn;
    Utilitrios1: TMenuItem;
    Calculadora1: TMenuItem;

    Configuraes1: TMenuItem;
    btcadfornecedor: TBitBtn;
    btconfornecedor: TBitBtn;
    btrelfornecedor: TBitBtn;
    btestoque: TBitBtn;
    PopupMenu1: TPopupMenu;
    Venda4: TMenuItem;
    Sair2: TMenuItem;
    Configuraes2: TMenuItem;
    Blocodenotas1: TMenuItem;
    DBText1: TDBText;
    ActionList1: TActionList;
    cadcliente: TAction;
    tmr1: TTimer;
    Fornecedor1: TMenuItem;
    procedure Sobre1Click(Sender: TObject);
    procedure Cliente1Click(Sender: TObject);
    procedure Produto1Click(Sender: TObject);
    procedure Cliente2Click(Sender: TObject);
    procedure Produto2Click(Sender: TObject);
    procedure Venda1Click(Sender: TObject);
    procedure Venda2Click(Sender: TObject);
    procedure Cliente3Click(Sender: TObject);
    procedure Produto3Click(Sender: TObject);
    procedure Venda3Click(Sender: TObject);
    procedure Sair1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btcadastroMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure Image1MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure btcadclienteClick(Sender: TObject);
    procedure btcadprodutoClick(Sender: TObject);
    procedure btcadvendaClick(Sender: TObject);
    procedure btsairClick(Sender: TObject);
    procedure btconsultaMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure btconclienteClick(Sender: TObject);
    procedure btconprodutoClick(Sender: TObject);
    procedure btconvendaClick(Sender: TObject);
    procedure btrelclienteClick(Sender: TObject);
    procedure btrelprodutoClick(Sender: TObject);
    procedure btrelvendaClick(Sender: TObject);
    procedure btlevantamentosMouseMove(Sender: TObject; Shift: TShiftState;
      X, Y: Integer);
    procedure btrelatorioMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure ImageDblClick(Sender: TObject);

    procedure Principal1Click(Sender: TObject);
    procedure btestoqueClick(Sender: TObject);
    procedure btcadfornecedorClick(Sender: TObject);
    procedure btconfornecedorClick(Sender: TObject);
    procedure Venda4Click(Sender: TObject);
    procedure Sair2Click(Sender: TObject);
    procedure Calculadora1Click(Sender: TObject);
    procedure Blocodenotas1Click(Sender: TObject);
    procedure Configuraes1Click(Sender: TObject);
    procedure btrelfornecedorClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure tmr1Timer(Sender: TObject);
    procedure Fornecedor1Click(Sender: TObject);
    
  private
    { Private declarations }
  public
     function Datastatus:string;
    { Public declarations }
  end;

var
  FrmPrincipal: TFrmPrincipal;

implementation




uses Sobre, Cad_Cliente, Cad_Produto, Con_Cliente, Con_Produto, Con_Venda,
  Cad_Venda, Rel_Cliente, Rel_Produto, Rel_Venda, UDM, estoque,
  configuracao, Cad_Fornecedores, Con_Fornecedores, Rel_Fornecedores, DB;


{$R *.DFM}

function Tfrmprincipal.Datastatus: string;
  const
    Meses:array[1..12] of string=
      ('Janeiro','Fevereiro','Março','Abril','Maio','Junho','Julho','Agosto',
        'Setembro','Outubro','Novembro','Dezembro');
   Semana:array[1..7]of string=
      ('Domingo','Segunda','Terça','Quarta','Quinta','Sexta','Sábado');
    var
    Dia,Mes,Ano,DiaSem:Word;
begin
 DecodeDate(Date,Ano,Mes,Dia);
 DiaSem:=DayOfWeek(date);
 Result:=Semana[DiaSem]+' , '+IntToStr(dia)+' de '+Meses[mes]+' de '+IntToStr(Ano);
 end;
 const
ScreenWidth: LongInt = 1366; {~resolução da tela do pc}
ScreenHeight: LongInt =768;

procedure TFrmPrincipal.Sobre1Click(Sender: TObject);
begin
try
frmsobre:=Tfrmsobre.Create(self);
frmsobre.ShowModal;
finally
  frmsobre.Free;
  frmsobre:=nil;
end;

end;

procedure TFrmPrincipal.Cliente1Click(Sender: TObject);
begin
try
frmcad_cliente:=Tfrmcad_cliente.Create(self);
frmcad_cliente.ShowModal;
finally
  frmcad_cliente.Free;
  frmcad_cliente:=nil;
end;

end;

procedure TFrmPrincipal.Produto1Click(Sender: TObject);
begin
try
frmcad_produto:=Tfrmcad_produto.Create(self);
frmcad_produto.ShowModal;
finally
  frmcad_produto.Free;
  frmcad_produto:=nil;
end;

end;

procedure TFrmPrincipal.Cliente2Click(Sender: TObject);
begin
try
frmcon_cliente:=Tfrmcon_cliente.Create(self);
frmcon_cliente.ShowModal;
finally
  frmcon_cliente.Free;
  frmcon_cliente:=nil;
end;

end;

procedure TFrmPrincipal.Produto2Click(Sender: TObject);
begin
try
frmCon_Produto:=TfrmCon_Produto.Create(self);
frmCon_Produto.ShowModal;
finally
  frmCon_Produto.Free;
  frmCon_Produto:=nil;
end;

end;

procedure TFrmPrincipal.Venda1Click(Sender: TObject);
begin
try
frmcon_Venda:=Tfrmcon_Venda.Create(self);
frmcon_Venda.ShowModal;
finally
  frmcon_Venda.Free;
  frmcon_Venda:=nil;
end;

end;

procedure TFrmPrincipal.Venda2Click(Sender: TObject);
begin
try
Frmcad_venda:=TFrmcad_venda.Create(self);
Frmcad_venda.ShowModal;
finally
  Frmcad_venda.Free;
  Frmcad_venda:=nil;
end;

end;

procedure TFrmPrincipal.Cliente3Click(Sender: TObject);
begin
try
frmrel_cliente:=Tfrmrel_cliente.Create(self);
frmrel_cliente.ShowModal;
finally
  frmrel_cliente.Free;
  frmrel_cliente:=nil;
end;

end;

procedure TFrmPrincipal.Produto3Click(Sender: TObject);
begin
try
frmrel_produto:=Tfrmrel_produto.Create(self);
frmrel_produto.ShowModal;
finally
  frmrel_produto.Free;
  frmrel_produto:=nil;
end;

end;

procedure TFrmPrincipal.Venda3Click(Sender: TObject);
begin
try
frmrel_venda:=Tfrmrel_venda.Create(self);
frmrel_venda.ShowModal;
finally
  frmrel_venda.Free;
  frmrel_venda:=nil;
end;

end;

procedure TFrmPrincipal.Sair1Click(Sender: TObject);
begin

if MessageBox(0, 'Deseja realmente fechar aplicação?', 'DEMarket', MB_ICONQUESTION or MB_YESNO)=mrYes then
Application.Terminate;
end;

procedure TFrmPrincipal.FormCreate(Sender: TObject);
var
  Dia: Integer;
  DiadaSemana: String;

begin
scaled := true;
if (screen.width <> ScreenWidth) then
begin
height := longint(height) * longint(screen.height) DIV ScreenHeight;
width := longint(width) * longint(screen.width) DIV ScreenWidth;
ScaleBy(screen.width, ScreenWidth);
 Dia := dayofweek(Date);
  case Dia of
    1: DiadaSemana := 'Domingo';
    2: DiadaSemana := 'Segunda-feira';
    3: DiadaSemana := 'Terça-feira';
    4: DiadaSemana := 'Quarta-feira';
    5: DiadaSemana := 'Quinta-feira';
    6: DiadaSemana := 'Sexta-feira';
    7: DiadaSemana := 'Sábado';
    end;
   FrmPrincipal.Caption := Caption + ' - '+datetostr(date);
   FrmPrincipal.Caption:=Caption+' '+DiadaSemana;



end; end;


procedure TFrmPrincipal.btcadastroMouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
begin
btcadcliente.Visible:=true;
btcadproduto.Visible:=true;
btcadvenda.Visible:=true;
btcadfornecedor.Visible:=true;
end;

procedure TFrmPrincipal.Image1MouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
begin
btcadcliente.Visible:=false;
btcadproduto.Visible:=false;
btcadvenda.Visible:=false;
btcadfornecedor.Visible:=false;
btconcliente.Visible:=false;
btconproduto.Visible:=false;
btconvenda.Visible:=false;
btconfornecedor.Visible:=false;
btrelcliente.Visible:=false;
btrelproduto.Visible:=false;
btrelvenda.Visible:=false;
btrelfornecedor.Visible:=false;
btlevvalidade.Visible:=false;
btlevproduto.Visible:=false;
btlevfinancas.Visible:=false;
btestoque.Visible:=false;


end;

procedure TFrmPrincipal.btcadclienteClick(Sender: TObject);
begin

  try
frmcad_cliente:=Tfrmcad_cliente.Create(self);
frmcad_cliente.ShowModal;
finally
  frmcad_cliente.Free;
  frmcad_cliente:=nil;
end;




end;

procedure TFrmPrincipal.btcadprodutoClick(Sender: TObject);
begin
try
FrmCad_Produto:=TFrmCad_Produto.Create(self);
FrmCad_Produto.ShowModal;
finally
  FrmCad_Produto.Free;
  FrmCad_Produto:=nil;
end;


end;

procedure TFrmPrincipal.btcadvendaClick(Sender: TObject);
begin
try
fRMcAD_vENDA:=TfRMcAD_vENDA.Create(self);
fRMcAD_vENDA.ShowModal;
finally
  fRMcAD_vENDA.Free;
  fRMcAD_vENDA:=nil;
end;


end;

procedure TFrmPrincipal.btsairClick(Sender: TObject);
begin
if MessageDlg('Deseja realmente sair?',mtConfirmation,[mbok,mbcancel],0)=mrok then
begin
DM.TblCliente.Close;
dm.TblProduto.Close;
dm.TblItem.Close;
DM.TblVenda.Close;
dm.TblFornecedores.Close;
Application.Terminate;
end;
end;

procedure TFrmPrincipal.btconsultaMouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
begin
btconcliente.Visible:=True;
btconproduto.Visible:=True;
btconvenda.Visible:=True;
btconfornecedor.Visible:=True;
end;

procedure TFrmPrincipal.btconclienteClick(Sender: TObject);
begin
   try
frmcon_cliente:=Tfrmcon_cliente.Create(self);
frmcon_cliente.ShowModal;
finally
  frmcon_cliente.Free;
  frmcon_cliente:=nil;
end;


end;

procedure TFrmPrincipal.btconprodutoClick(Sender: TObject);
begin
   try
frmCon_Produto:=TfrmCon_Produto.Create(self);
frmCon_Produto.ShowModal;
finally
  frmCon_Produto.Free;
  frmCon_Produto:=nil;
end;


end;

procedure TFrmPrincipal.btconvendaClick(Sender: TObject);
begin
 try
frmcon_Venda:=Tfrmcon_Venda.Create(self);
frmcon_Venda.ShowModal;
finally
  frmcon_Venda.Free;
  frmcon_Venda:=nil;
end;

end;

procedure TFrmPrincipal.btrelclienteClick(Sender: TObject);
begin

try
frmrel_cliente:=Tfrmrel_cliente.Create(self);
frmrel_cliente.ShowModal;
finally
  frmrel_cliente.Free;
  frmrel_cliente:=nil;
end;

end;

procedure TFrmPrincipal.btrelprodutoClick(Sender: TObject);
begin

try
frmrel_produto:=Tfrmrel_produto.Create(self);
frmrel_produto.ShowModal;
finally
  frmrel_produto.Free;
  frmrel_produto:=nil;
end;

end;

procedure TFrmPrincipal.btrelvendaClick(Sender: TObject);
begin
  try
frmrel_venda:=Tfrmrel_venda.Create(self);
frmrel_venda.ShowModal;
finally
  frmrel_venda.Free;
  frmrel_venda:=nil;
end;

end;

procedure TFrmPrincipal.btlevantamentosMouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
begin
btlevvalidade.Visible:=true;
btlevproduto.Visible:=true;
btlevfinancas.Visible:=true;
btestoque.Visible:=true;
end;



procedure TFrmPrincipal.btrelatorioMouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
begin
btrelcliente.Visible:=true;
btrelvenda.Visible:=true;
btrelproduto.Visible:=true;
btrelfornecedor.Visible:=true;
end;

procedure TFrmPrincipal.ImageDblClick(Sender: TObject);
begin
try
FrmCad_Venda:=TFrmCad_Venda.Create(self);
FrmCad_Venda.ShowModal;
finally
  FrmCad_Venda.Free;
  FrmCad_Venda:=nil;
end;

end;

procedure TFrmPrincipal.Principal1Click(Sender: TObject);
begin
 try
Formconfiguracao:=TFormconfiguracao.Create(self);
Formconfiguracao.ShowModal;
finally
  Formconfiguracao.Free;
  Formconfiguracao:=nil;
end;


end;

procedure TFrmPrincipal.btestoqueClick(Sender: TObject);
begin
try
formestoque:=Tformestoque.Create(self);
formestoque.ShowModal;
finally
  formestoque.Free;
  formestoque:=nil;
end;

end;

procedure TFrmPrincipal.btcadfornecedorClick(Sender: TObject);
begin
 try
FrmCad_Fornecedores:=TFrmCad_Fornecedores.Create(self);
FrmCad_Fornecedores.ShowModal;
finally
  FrmCad_Fornecedores.Free;
  FrmCad_Fornecedores:=nil;
end;




end;

procedure TFrmPrincipal.btconfornecedorClick(Sender: TObject);
begin
try
FrmCon_Fornecedores:=TFrmCon_Fornecedores.Create(self);
FrmCon_Fornecedores.ShowModal;
finally
  FrmCon_Fornecedores.Free;
  FrmCon_Fornecedores:=nil;
end;

end;

procedure TFrmPrincipal.Venda4Click(Sender: TObject);
begin
try
FrmCad_Venda:=TFrmCad_Venda.Create(self);
FrmCad_Venda.ShowModal;
finally
  FrmCad_Venda.Free;
  FrmCad_Venda:=nil;
end;

end;

procedure TFrmPrincipal.Sair2Click(Sender: TObject);
begin

if MessageBox(0, 'Deseja realmente fechar aplicação?', 'DEMarket', MB_ICONQUESTION or MB_YESNO)=mrYes then
close;

end;

procedure TFrmPrincipal.Calculadora1Click(Sender: TObject);
begin
WinExec('C:\Windows\system32\calc.exe',SW_SHOWNORMAL);
end;

procedure TFrmPrincipal.Blocodenotas1Click(Sender: TObject);
begin
WinExec('C:\Windows\system32\notepad.exe',SW_SHOWNORMAL);
end;

procedure TFrmPrincipal.Configuraes1Click(Sender: TObject);
begin
try
Formconfiguracao:=TFormconfiguracao.Create(self);
Formconfiguracao.ShowModal;
finally
  Formconfiguracao.Free;
  Formconfiguracao:=nil;
end;

end;

procedure TFrmPrincipal.btrelfornecedorClick(Sender: TObject);
begin
try
FrmRel_Fornecedores:=TFrmRel_Fornecedores.Create(self);
FrmRel_Fornecedores.ShowModal;
finally
  FrmRel_Fornecedores.Free;
  FrmRel_Fornecedores:=nil;
end;

end;

procedure TFrmPrincipal.FormShow(Sender: TObject);
begin
StatusBar1.Panels[1].Text:=StatusBar1.Panels[1].Text+DBText1.Caption;
end;

procedure TFrmPrincipal.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin

if MessageBox(0, 'Deseja realmente fechar aplicação?', 'DEMarket', MB_ICONQUESTION or MB_YESNO)=mrYes then
Application.Terminate
else
Action:=caNone;
end;

procedure TFrmPrincipal.tmr1Timer(Sender: TObject);
begin
StatusBar1.Panels[2].Text:=DateToStr(Date);
StatusBar1.Panels[3].Text:=TimeToStr(time);
StatusBar1.Panels[4].Text:=Datastatus;
end;

procedure TFrmPrincipal.Fornecedor1Click(Sender: TObject);
begin

 try
FrmCad_Fornecedores:=TFrmCad_Fornecedores.Create(self);
FrmCad_Fornecedores.ShowModal;
finally
  FrmCad_Fornecedores.Free;
  FrmCad_Fornecedores:=nil;
end;


 end;

end.
