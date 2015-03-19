object Form1: TForm1
  Left = 192
  Top = 124
  Width = 924
  Height = 480
  Caption = 'Consulta'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object TabbedNotebook1: TTabbedNotebook
    Left = 112
    Top = 32
    Width = 633
    Height = 369
    PageIndex = 1
    TabFont.Charset = DEFAULT_CHARSET
    TabFont.Color = clBtnText
    TabFont.Height = -11
    TabFont.Name = 'MS Sans Serif'
    TabFont.Style = []
    TabOrder = 0
    object TTabPage
      Left = 4
      Top = 24
      Caption = 'Cliente'
    end
    object TTabPage
      Left = 4
      Top = 24
      Caption = 'Produto'
      object Label1: TLabel
        Left = 112
        Top = 28
        Width = 28
        Height = 13
        Caption = 'Nome'
      end
      object EdtConsulta: TEdit
        Left = 112
        Top = 44
        Width = 217
        Height = 21
        TabOrder = 0
      end
      object BtnConsulta: TBitBtn
        Left = 336
        Top = 44
        Width = 81
        Height = 25
        Caption = '&Consulta'
        Default = True
        TabOrder = 1
        Glyph.Data = {
          DE010000424DDE01000000000000760000002800000024000000120000000100
          0400000000006801000000000000000000001000000010000000000000000000
          80000080000000808000800000008000800080800000C0C0C000808080000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
          3333333333333333333333330000333333333333333333333333F33333333333
          00003333344333333333333333388F3333333333000033334224333333333333
          338338F3333333330000333422224333333333333833338F3333333300003342
          222224333333333383333338F3333333000034222A22224333333338F338F333
          8F33333300003222A3A2224333333338F3838F338F33333300003A2A333A2224
          33333338F83338F338F33333000033A33333A222433333338333338F338F3333
          0000333333333A222433333333333338F338F33300003333333333A222433333
          333333338F338F33000033333333333A222433333333333338F338F300003333
          33333333A222433333333333338F338F00003333333333333A22433333333333
          3338F38F000033333333333333A223333333333333338F830000333333333333
          333A333333333333333338330000333333333333333333333333333333333333
          0000}
        NumGlyphs = 2
      end
      object DBGrid1: TDBGrid
        Left = 112
        Top = 80
        Width = 305
        Height = 137
        DataSource = DM.DtsQryCliente
        ReadOnly = True
        TabOrder = 2
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        Columns = <
          item
            Expanded = False
            FieldName = 'Cod_Cliente'
            Title.Caption = 'C'#243'digo'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Nome'
            Width = 200
            Visible = True
          end>
      end
      object BitBtn2: TBitBtn
        Left = 280
        Top = 224
        Width = 83
        Height = 25
        Caption = 'Sai&r'
        TabOrder = 3
        Kind = bkClose
      end
      object BtnConsultar: TBitBtn
        Left = 176
        Top = 224
        Width = 83
        Height = 25
        Caption = '&Editar'
        TabOrder = 4
        Kind = bkHelp
      end
    end
    object TTabPage
      Left = 4
      Top = 24
      Caption = 'Venda'
    end
  end
end
