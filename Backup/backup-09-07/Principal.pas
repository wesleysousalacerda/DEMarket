unit Principal;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Menus, ExtCtrls, jpeg, Gauges,  StdCtrls, Buttons, RxGIF ,
  XPMan, ComCtrls, DrLabel, Mask, RXSlider, RXCtrls, RXClock, RXSpin,
  RXSwitch, ImgList    ;
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
    btdespesas: TBitBtn;
    btlevantamentos: TBitBtn;
    StatusBar1: TStatusBar;
    btlevvalidade: TBitBtn;
    btlevproduto: TBitBtn;
    btlevfinancas: TBitBtn;
    Ajuda1: TMenuItem;
    RxClock1: TRxClock;
    BitBtn1: TBitBtn;
    Utilitrios1: TMenuItem;
    Calculadora1: TMenuItem;
    btestoque: TBitBtn;

    Configuraes1: TMenuItem;
    Principal1: TMenuItem;
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
    procedure StatusBar1DrawPanel(StatusBar: TStatusBar;
      Panel: TStatusPanel; const Rect: TRect);
    procedure btlevantamentosMouseMove(Sender: TObject; Shift: TShiftState;
      X, Y: Integer);
    procedure RxSlider1DrawPoints(Sender: TObject);
    procedure RxSwitch1On(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure btrelatorioMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure ImageDblClick(Sender: TObject);
    procedure btestoqueClick(Sender: TObject);

    procedure Principal1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmPrincipal: TFrmPrincipal;

implementation

uses Sobre, Cad_Cliente, Cad_Produto, Con_Cliente, Con_Produto, Con_Venda,
  Cad_Venda, Rel_Cliente, Rel_Produto, Rel_Venda, UDM, estoque,
  configuracao;


{$R *.DFM}


procedure TFrmPrincipal.Sobre1Click(Sender: TObject);
begin
     frmsobre.showmodal;
end;

procedure TFrmPrincipal.Cliente1Click(Sender: TObject);
begin
     frmcad_cliente.showmodal;
end;

procedure TFrmPrincipal.Produto1Click(Sender: TObject);
begin
     frmcad_produto.showmodal;
end;

procedure TFrmPrincipal.Cliente2Click(Sender: TObject);
begin
        frmcon_cliente.showmodal;
end;

procedure TFrmPrincipal.Produto2Click(Sender: TObject);
begin
     frmCon_Produto.showmodal;
end;

procedure TFrmPrincipal.Venda1Click(Sender: TObject);
begin
     frmcon_Venda.showmodal;
end;

procedure TFrmPrincipal.Venda2Click(Sender: TObject);
begin
  Frmcad_venda.showmodal;
end;

procedure TFrmPrincipal.Cliente3Click(Sender: TObject);
begin
frmrel_cliente.showmodal;
end;

procedure TFrmPrincipal.Produto3Click(Sender: TObject);
begin
frmrel_produto.showmodal;
end;

procedure TFrmPrincipal.Venda3Click(Sender: TObject);
begin
frmrel_venda.showmodal;
end;

procedure TFrmPrincipal.Sair1Click(Sender: TObject);
begin
Close;
end;

procedure TFrmPrincipal.FormCreate(Sender: TObject);
var
  Dia: Integer;
  DiadaSemana: String;

begin
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
   if DiadaSemana='Domingo' then
       Image.Picture.LoadFromFile('D:\coisas\SUPERMERCADO\Imagens\1.jpg')
   else if DiadaSemana='Segunda-feira' then
       Image.Picture.LoadFromFile('D:\coisas\SUPERMERCADO\Imagens\3.jpg')
   else if DiadaSemana='Terça-feira' then
       Image.Picture.LoadFromFile('D:\coisas\SUPERMERCADO\Imagens\6.jpg')
   else if DiadaSemana='Quarta-feira' then
       Image.Picture.LoadFromFile('D:\coisas\SUPERMERCADO\Imagens\11.jpg')
   else if DiadaSemana='Quinta-feira' then
       Image.Picture.LoadFromFile('D:\coisas\SUPERMERCADO\Imagens\12.jpg')
   else if DiadaSemana='Sexta-feira' then
       Image.Picture.LoadFromFile('D:\coisas\SUPERMERCADO\Imagens\14.jpg')
   else if DiadaSemana='Sábado' then
       Image.Picture.LoadFromFile('D:\coisas\SUPERMERCADO\Imagens\17.jpg');


   FrmPrincipal.Caption := Caption + ' - '+datetostr(date);
   FrmPrincipal.Caption:=Caption+' '+DiadaSemana;

end;

procedure TFrmPrincipal.btcadastroMouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
begin
btcadcliente.Visible:=true;
btcadproduto.Visible:=true;
btcadvenda.Visible:=true;
end;

procedure TFrmPrincipal.Image1MouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
begin
btcadcliente.Visible:=false;
btcadproduto.Visible:=false;
btcadvenda.Visible:=false;
btconcliente.Visible:=false;
btconproduto.Visible:=false;
btconvenda.Visible:=false;
btrelcliente.Visible:=false;
btrelproduto.Visible:=false;
btrelvenda.Visible:=false;

btlevvalidade.Visible:=false;
btlevproduto.Visible:=false;
btlevfinancas.Visible:=false;


end;

procedure TFrmPrincipal.btcadclienteClick(Sender: TObject);
begin
      FrmCad_Cliente.showmodal;

end;

procedure TFrmPrincipal.btcadprodutoClick(Sender: TObject);
begin FrmCad_Produto.showmodal;

end;

procedure TFrmPrincipal.btcadvendaClick(Sender: TObject);
begin
  FrmCad_Venda.showmodal;

end;

procedure TFrmPrincipal.btsairClick(Sender: TObject);
begin
if MessageDlg('Deseja realmente sair?',mtConfirmation,[mbok,mbcancel],0)=mrok then
begin
DM.TblCliente.Close;
dm.TblProduto.Close;
dm.TblItem.Close;
DM.TblVenda.Close;
close;
end;
end;

procedure TFrmPrincipal.btconsultaMouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
begin
btconcliente.Visible:=True;
btconproduto.Visible:=True;
btconvenda.Visible:=True;
end;

procedure TFrmPrincipal.btconclienteClick(Sender: TObject);
begin
frmcon_cliente.showmodal;
end;

procedure TFrmPrincipal.btconprodutoClick(Sender: TObject);
begin
 frmCon_Produto.showmodal;
end;

procedure TFrmPrincipal.btconvendaClick(Sender: TObject);
begin
 frmcon_Venda.showmodal;
end;

procedure TFrmPrincipal.btrelclienteClick(Sender: TObject);
begin
frmrel_cliente.showmodal;
end;

procedure TFrmPrincipal.btrelprodutoClick(Sender: TObject);
begin
frmrel_produto.showmodal;
end;

procedure TFrmPrincipal.btrelvendaClick(Sender: TObject);
begin
frmrel_venda.showmodal;
end;

procedure TFrmPrincipal.StatusBar1DrawPanel(StatusBar: TStatusBar;
  Panel: TStatusPanel; const Rect: TRect);
 var
  Imagem:TBitmap;
begin


    Imagem:=TBitmap.Create;
    Imagem.LoadFromFile('C:\IMAGE.bmp'); // Estou carregando de um arquivo, mas há possibilidades de carregar de um resource também.

      StatusBar1.Canvas.Draw(Rect.Left,Rect.Top,Imagem); // Tenta carregar.
     Imagem.Free;
     // Depois de carregar, libera a imagem.
  end;



procedure TFrmPrincipal.btlevantamentosMouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
begin
btlevvalidade.Visible:=true;
btlevproduto.Visible:=true;
btlevfinancas.Visible:=true;
end;

procedure TFrmPrincipal.RxSlider1DrawPoints(Sender: TObject);
begin
btcadastro.Width:=Width+1;
end;

procedure TFrmPrincipal.RxSwitch1On(Sender: TObject);
begin
Image.Picture.LoadFromFile('D:\Imagens\Imagens\cavalo.jpg');
end;

procedure TFrmPrincipal.BitBtn1Click(Sender: TObject);
begin
close;
end;

procedure TFrmPrincipal.btrelatorioMouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
begin
btrelcliente.Visible:=true;
btrelvenda.Visible:=true;
btrelproduto.Visible:=true;
end;

procedure TFrmPrincipal.ImageDblClick(Sender: TObject);
begin
  FrmCad_Venda.showmodal;
end;

procedure TFrmPrincipal.btestoqueClick(Sender: TObject);
begin
formestoque.showmodal;
end;



procedure TFrmPrincipal.Principal1Click(Sender: TObject);
begin
Formconfiguracao.showmodal;

end;

end.
