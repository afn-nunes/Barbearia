object frmSelecionaDiretorio: TfrmSelecionaDiretorio
  Left = 418
  Top = 313
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Selecionar diret'#243'rio Arquivo INI'
  ClientHeight = 89
  ClientWidth = 406
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poOwnerFormCenter
  OnCreate = FormCreate
  OnKeyDown = FormKeyDown
  OnMouseMove = FormMouseMove
  PixelsPerInch = 96
  TextHeight = 13
  object lbl1: TLabel
    Left = 16
    Top = 17
    Width = 178
    Height = 13
    Caption = 'Selecionar diret'#243'rio para o arquivo INI'
  end
  object edtDiretorio: TEdit
    Left = 16
    Top = 33
    Width = 369
    Height = 21
    TabOrder = 0
  end
  object btnSalvar: TButton
    Left = 310
    Top = 60
    Width = 75
    Height = 25
    Caption = 'Salvar'
    Enabled = False
    TabOrder = 1
    OnClick = btnSalvarClick
  end
  object Procurar: TButton
    Left = 17
    Top = 59
    Width = 75
    Height = 25
    Caption = 'Procurar'
    TabOrder = 2
    OnClick = ProcurarClick
  end
end
