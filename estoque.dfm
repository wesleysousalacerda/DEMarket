object Formestoque: TFormestoque
  Left = 146
  Top = 111
  BorderStyle = bsDialog
  Caption = 'Estoque'
  ClientHeight = 589
  ClientWidth = 1076
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 13
    Top = 10
    Width = 42
    Height = 14
    Caption = 'NOME.:'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Courier New'
    Font.Style = []
    ParentFont = False
  end
  object DBGrid1: TDBGrid
    Left = -1
    Top = 54
    Width = 425
    Height = 497
    DataSource = DM.DtsQryProduto
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Courier New'
    Font.Style = []
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
    ParentFont = False
    ReadOnly = True
    TabOrder = 0
    TitleFont.Charset = ANSI_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Courier New'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'Cod_Produto'
        Width = 73
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Nome'
        Width = 252
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Quant'
        Visible = True
      end>
  end
  object EdtConsulta: TEdit
    Left = 12
    Top = 25
    Width = 121
    Height = 22
    CharCase = ecUpperCase
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Courier New'
    Font.Style = []
    ParentFont = False
    TabOrder = 1
    OnChange = EdtConsultaChange
  end
  object DBGrid2: TDBGrid
    Left = 496
    Top = 144
    Width = 320
    Height = 120
    DataSource = DM.DtsVenda
    TabOrder = 2
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'Cod_Venda'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Cod_Cliente'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Cod_Item'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Data'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Total'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Lucro'
        Visible = True
      end>
  end
  object DBGrid3: TDBGrid
    Left = 496
    Top = 280
    Width = 320
    Height = 120
    TabOrder = 3
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
  end
  object BitBtn1: TBitBtn
    Left = 728
    Top = 80
    Width = 75
    Height = 25
    Caption = 'BitBtn1'
    TabOrder = 4
  end
  object DateTimePicker1: TDateTimePicker
    Left = 440
    Top = 24
    Width = 186
    Height = 21
    Date = 41186.457010625000000000
    Time = 41186.457010625000000000
    TabOrder = 5
  end
  object DateTimePicker2: TDateTimePicker
    Left = 648
    Top = 24
    Width = 186
    Height = 21
    Date = 41186.457048784720000000
    Time = 41186.457048784720000000
    TabOrder = 6
  end
  object BitBtn2: TBitBtn
    Left = 880
    Top = 184
    Width = 75
    Height = 25
    Caption = 'BitBtn2'
    TabOrder = 7
    OnClick = BitBtn2Click
  end
end
