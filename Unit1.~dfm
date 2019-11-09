object Form1: TForm1
  Left = 298
  Top = 135
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Voice DataBase'
  ClientHeight = 332
  ClientWidth = 847
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 64
    Top = 32
    Width = 69
    Height = 13
    Caption = 'Blue Trey VCV'
  end
  object Label2: TLabel
    Left = 310
    Top = 30
    Width = 3
    Height = 13
  end
  object Label3: TLabel
    Left = 704
    Top = 192
    Width = 142
    Height = 23
    Cursor = crCross
    Caption = #1044#1077#1074#1086#1095#1082#1080' '#1103' '#1074' '#1042#1050
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold, fsItalic, fsUnderline]
    ParentFont = False
    Transparent = True
    OnClick = Label3Click
  end
  object Label4: TLabel
    Left = 488
    Top = 224
    Width = 358
    Height = 23
    Cursor = crCross
    Caption = #1054#1092#1080#1094#1080#1072#1083#1100#1085#1099#1081' '#1089#1072#1081#1090' '#1087#1088#1086#1075#1080' '#1084#1072#1083#1100#1095#1080#1082#1080
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clBlack
    Font.Height = -19
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold, fsItalic, fsUnderline]
    ParentFont = False
    Transparent = True
    OnClick = Label4Click
  end
  object Button1: TButton
    Left = 144
    Top = 24
    Width = 75
    Height = 25
    Caption = 'Download'
    TabOrder = 0
    OnClick = Button1Click
  end
  object ProgressBar1: TProgressBar
    Left = 0
    Top = 259
    Width = 847
    Height = 73
    Align = alBottom
    TabOrder = 1
    Visible = False
  end
  object MediaPlayer1: TMediaPlayer
    Left = 64
    Top = 56
    Width = 85
    Height = 30
    VisibleButtons = [btPlay, btPause, btStop]
    AutoOpen = True
    Display = ProgressBar1
    FileName = 'resurce\android girl.mp3'
    TabOrder = 2
  end
  object Button2: TButton
    Left = 224
    Top = 24
    Width = 75
    Height = 25
    Caption = 'Open'
    TabOrder = 3
    Visible = False
    OnClick = Button2Click
  end
  object IdHTTP1: TIdHTTP
    MaxLineAction = maException
    ReadTimeout = 0
    OnWork = IdHTTP1Work
    OnWorkBegin = IdHTTP1WorkBegin
    AllowCookies = True
    ProxyParams.BasicAuthentication = False
    ProxyParams.ProxyPort = 0
    Request.ContentLength = -1
    Request.ContentRangeEnd = 0
    Request.ContentRangeStart = 0
    Request.ContentType = 'text/html'
    Request.Accept = 'text/html, */*'
    Request.BasicAuthentication = False
    Request.UserAgent = 'Mozilla/3.0 (compatible; Indy Library)'
    HTTPOptions = [hoForceEncodeParams]
    Left = 8
  end
  object SaveDialog1: TSaveDialog
    Ctl3D = False
    Filter = 'Rar|*.rar,*.uar,*.zip'
    Left = 40
  end
  object IdAntiFreeze1: TIdAntiFreeze
    Left = 8
    Top = 32
  end
end
