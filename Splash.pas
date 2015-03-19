unit Splash;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, jpeg, ExtCtrls, pngimage, StdCtrls, Buttons, Mask, DBCtrls, DB,
  DBTables, XPMan, AdvShapeButton, Grids, DBGrids;

type
  TFrmSplash = class(TForm)
    h: TImage;
    Edit2: TEdit;
    lbuser: TLabel;
    Label2: TLabel;
    DBEdit1: TDBEdit;
    DBEdit2: TDBEdit;
    btentrar: TBitBtn;
    BitBtn2: TBitBtn;
    XPManifest1: TXPManifest;
    AdvShapeButton1: TAdvShapeButton;
    AdvShapeButton2: TAdvShapeButton;
    Edit1: TEdit;
    DBGrid1: TDBGrid;
    procedure btentrarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure BitBtn2Click(Sender: TObject);

    procedure cbcamposKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure cbcamposChange(Sender: TObject);
    procedure cbcamposKeyPress(Sender: TObject; var Key: Char);
    procedure Edit1KeyPress(Sender: TObject; var Key: Char);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure DBGrid1KeyPress(Sender: TObject; var Key: Char);
    procedure Edit2KeyPress(Sender: TObject; var Key: Char);
    procedure FormShow(Sender: TObject);



  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmSplash: TFrmSplash;

implementation
uses Principal, UDM;
{$R *.dfm}

procedure TFrmSplash.btentrarClick(Sender: TObject);
begin
if Self.Tag<3 then
begin
     if (Edit2.Text=DBEdit2.Text) then
        begin
            FrmPrincipal.ShowModal;
            FrmSplash.Close;
        end
        else begin
            Self.Tag:=Tag+1;
            ShowMessage('Senha incorreta! Tentativas: '+IntToStr(Self.tag)+' de 3');
            Edit2.Clear;
            Edit2.SetFocus;

        end;   end
else
Begin
ShowMessage('Numero de tentativas alcançadas!');
Application.Terminate;
end;
end;
procedure TFrmSplash.FormCreate(Sender: TObject);
begin
Self.Tag:=0;
self.TransparentColor:=true;
Self.TransparentColorValue:=ColorToRGB(Self.Color);

end;

procedure TFrmSplash.FormKeyPress(Sender: TObject; var Key: Char);                          
begin

If key = #13 then
Begin
Key:= #0;

Perform(Wm_NextDlgCtl,0,0);

end
  
end;

procedure TFrmSplash.BitBtn2Click(Sender: TObject);
begin
Application.Terminate;
end;




procedure TFrmSplash.cbcamposKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if Key = VK_RETURN then Perform(Wm_NextDlgCtl,0,0);
end;

procedure TFrmSplash.cbcamposChange(Sender: TObject);
begin
DM.qrylogin.Close;

DM.qrylogin.SQL.Clear;
dm.qrylogin.SQL.add('SELECT * FROM ACESSO WHERE USUARIO = '+DBEdit1.Text);
dm.qrylogin.Open;
end;

procedure TFrmSplash.cbcamposKeyPress(Sender: TObject; var Key: Char);
begin
if Key=#13 then DBGrid1.Visible:=true;
end;

procedure TFrmSplash.Edit1KeyPress(Sender: TObject; var Key: Char);
begin
if key=#13 then
begin
dm.TblLogin.Active:=true;
DBGrid1.Visible:=true;
DBGrid1.SetFocus;
end; end;

procedure TFrmSplash.DBGrid1DblClick(Sender: TObject);
begin
Edit1.Text:=dm.TblLoginUSUARIO.value;
DBGrid1.Visible:=False;
end;

procedure TFrmSplash.DBGrid1KeyPress(Sender: TObject; var Key: Char);
begin
if key=#13 then begin
Edit2.setfocus;
Edit1.Text:=dm.TblLoginUSUARIO.value;
DBGrid1.Visible:=False;
end;
    end;
procedure TFrmSplash.Edit2KeyPress(Sender: TObject; var Key: Char);
begin
If key = #13 then
Begin
Key:= #0;

btentrar.OnClick(self);
end;
end;

procedure TFrmSplash.FormShow(Sender: TObject);
begin
dm.TblLogin.Open;
dm.TblLogin.First;
Edit1.SetFocus;
end;



end.

