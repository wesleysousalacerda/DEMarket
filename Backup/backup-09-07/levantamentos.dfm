object Formlevantamentos: TFormlevantamentos
  Left = 292
  Top = 172
  Width = 805
  Height = 480
  Caption = 'Levantamentos'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object tbnlevantamento: TTabbedNotebook
    Left = 112
    Top = 112
    Width = 1097
    Height = 465
    TabFont.Charset = DEFAULT_CHARSET
    TabFont.Color = clBtnText
    TabFont.Height = -11
    TabFont.Name = 'MS Sans Serif'
    TabFont.Style = []
    TabOrder = 0
    object TTabPage
      Left = 4
      Top = 24
      Caption = 'Validade'
      object Memo1: TMemo
        Left = 8
        Top = 56
        Width = 345
        Height = 241
        Lines.Strings = (
          'Memo1')
        TabOrder = 0
      end
      object Button1: TButton
        Left = 8
        Top = 16
        Width = 75
        Height = 25
        Caption = '&Verificar'
        TabOrder = 1
      end
    end
    object TTabPage
      Left = 4
      Top = 24
      Caption = 'Finan'#231'as'
    end
    object TTabPage
      Left = 4
      Top = 24
      Caption = 'Produtos'
    end
  end
end
