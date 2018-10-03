object frmAgenda: TfrmAgenda
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = 'Agenda'
  ClientHeight = 489
  ClientWidth = 930
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 239
    Top = 43
    Width = 53
    Height = 13
    Caption = 'Hora Inicial'
  end
  object Label2: TLabel
    Left = 317
    Top = 43
    Width = 48
    Height = 13
    Caption = 'Hora Final'
  end
  object Label3: TLabel
    Left = 396
    Top = 43
    Width = 128
    Height = 13
    Caption = 'Detathes do agendamento'
  end
  object img1: TImage
    Left = 43
    Top = 293
    Width = 153
    Height = 175
  end
  object DBGrid1: TDBGrid
    Left = 239
    Top = 86
    Width = 683
    Height = 389
    DataSource = dsAgenda
    Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    OnKeyDown = DBGrid1KeyDown
    Columns = <
      item
        Expanded = False
        FieldName = 'HoraInicial'
        Title.Alignment = taCenter
        Title.Caption = 'Hora Inicial'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'HoraFinal'
        Title.Alignment = taCenter
        Title.Caption = 'Hora Final'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Detalhes'
        Title.Alignment = taCenter
        Width = 500
        Visible = True
      end>
  end
  object cal: TMonthCalendar
    Left = 8
    Top = 86
    Width = 225
    Height = 160
    Date = 43091.814082974540000000
    TabOrder = 1
    OnClick = calClick
  end
  object edtData: TEdit
    Left = 8
    Top = 252
    Width = 225
    Height = 27
    Alignment = taCenter
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    ReadOnly = True
    TabOrder = 2
  end
  object cbbHoraInicial: TComboBox
    Left = 239
    Top = 59
    Width = 74
    Height = 21
    TabOrder = 3
  end
  object btnAgendar: TBitBtn
    Left = 847
    Top = 56
    Width = 75
    Height = 24
    Caption = 'Agendar'
    TabOrder = 4
    OnClick = btnAgendarClick
  end
  object edtDetalhes: TEdit
    Left = 396
    Top = 59
    Width = 445
    Height = 21
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 5
  end
  object edtNmAluno: TEdit
    Left = 239
    Top = 8
    Width = 609
    Height = 27
    Alignment = taCenter
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    ReadOnly = True
    TabOrder = 6
  end
  object cbbHoraFinal: TComboBox
    Left = 317
    Top = 59
    Width = 75
    Height = 21
    TabOrder = 7
  end
  object cbb1: TComboBox
    Left = 8
    Top = 59
    Width = 225
    Height = 24
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Robolto'
    Font.Style = []
    ParentFont = False
    TabOrder = 8
    OnChange = cbb1Change
  end
  object cdsAgenda: TClientDataSet
    Aggregates = <>
    IndexFieldNames = 'HoraInicial'
    Params = <>
    Left = 141
    Top = 14
    object cdsAgendaData: TDateField
      FieldName = 'Data'
      Visible = False
    end
    object cdsAgendaHoraInicial: TStringField
      Alignment = taCenter
      DisplayWidth = 12
      FieldName = 'HoraInicial'
      Size = 12
    end
    object cdsAgendaHoraFinal: TStringField
      Alignment = taCenter
      DisplayWidth = 12
      FieldName = 'HoraFinal'
      Size = 12
    end
    object cdsAgendaDetalhes: TStringField
      FieldName = 'Detalhes'
      Size = 70
    end
  end
  object dsAgenda: TDataSource
    DataSet = cdsAgenda
    OnDataChange = dsAgendaDataChange
    Left = 93
    Top = 14
  end
  object tmr1: TTimer
    Interval = 500
    OnTimer = tmr1Timer
    Left = 32
    Top = 16
  end
end
