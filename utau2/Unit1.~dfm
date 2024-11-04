object Form1: TForm1
  Left = 476
  Top = 267
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Blue Trey Manager'
  ClientHeight = 205
  ClientWidth = 532
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  Menu = MainMenu1
  OldCreateOrder = False
  Position = poDesktopCenter
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Label3: TLabel
    Left = 272
    Top = 13
    Width = 69
    Height = 13
    Caption = 'Blue Trey CVC'
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
    Visible = False
  end
  object Label2: TLabel
    Left = 8
    Top = 168
    Width = 32
    Height = 13
    Caption = 'Label2'
    Visible = False
  end
  object Label1: TLabel
    Left = 16
    Top = 13
    Width = 69
    Height = 13
    Caption = 'Blue Trey VCV'
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
  end
  object ProgressBar1: TProgressBar
    Left = 0
    Top = 163
    Width = 532
    Height = 42
    Align = alBottom
    TabOrder = 0
    Visible = False
  end
  object vcvdl: TButton
    Left = 99
    Top = 8
    Width = 74
    Height = 27
    Cursor = crHandPoint
    Caption = 'Download'
    Default = True
    DragCursor = crArrow
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
    TabOrder = 1
    OnClick = vcvdlClick
  end
  object TrackBar2: TTrackBar
    Left = 277
    Top = 80
    Width = 231
    Height = 25
    TabOrder = 2
    Visible = False
  end
  object TrackBar1: TTrackBar
    Left = 16
    Top = 80
    Width = 233
    Height = 25
    TabOrder = 3
  end
  object MediaPlayer2: TMediaPlayer
    Left = 344
    Top = 40
    Width = 85
    Height = 30
    VisibleButtons = [btPlay, btPause, btStop]
    AutoRewind = False
    Visible = False
    TabOrder = 4
  end
  object MediaPlayer1: TMediaPlayer
    Left = 90
    Top = 42
    Width = 85
    Height = 30
    VisibleButtons = [btPlay, btPause, btStop]
    TabOrder = 5
  end
  object InstallCVC: TButton
    Left = 432
    Top = 8
    Width = 75
    Height = 25
    Cursor = crHandPoint
    Caption = 'Install'
    DragCursor = crArrow
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
    TabOrder = 6
    Visible = False
    OnClick = InstallCVCClick
  end
  object cvcdl: TButton
    Left = 352
    Top = 8
    Width = 75
    Height = 25
    Cursor = crHandPoint
    Caption = 'Download'
    Default = True
    DragCursor = crArrow
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
    TabOrder = 7
    Visible = False
    OnClick = cvcdlClick
  end
  object InstallVCV: TButton
    Left = 176
    Top = 8
    Width = 75
    Height = 25
    Cursor = crHandPoint
    Caption = 'Install'
    DragCursor = crArrow
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
    TabOrder = 8
    Visible = False
    OnClick = InstallVCVClick
  end
  object IdHTTP1: TIdHTTP
    IOHandler = IdSSLIOHandlerSocket1
    MaxLineAction = maException
    ReadTimeout = 0
    OnWork = IdHTTP1Work
    OnWorkBegin = IdHTTP1WorkBegin
    AllowCookies = True
    HandleRedirects = True
    ProxyParams.BasicAuthentication = False
    ProxyParams.ProxyPort = 0
    Request.ContentLength = -1
    Request.ContentRangeEnd = 0
    Request.ContentRangeStart = 0
    Request.ContentType = 'text/html'
    Request.ContentVersion = '5'
    Request.Accept = 'text/html, */*'
    Request.BasicAuthentication = False
    Request.UserAgent = 'Mozilla/3.0 (compatible; UTAUDL)'
    Request.Username = 'UTAU Download Manager'
    HTTPOptions = [hoForceEncodeParams]
    CookieManager = IdCookieManager1
    Left = 72
    Top = 112
  end
  object SaveDialog1: TSaveDialog
    Ctl3D = False
    Filter = 'VoiceBank|*.uar'
    Title = 'Save voice bank'
    Left = 464
    Top = 112
  end
  object IdAntiFreeze1: TIdAntiFreeze
    IdleTimeOut = 5
    Left = 8
    Top = 32
  end
  object Timer1: TTimer
    Interval = 1
    OnTimer = Timer1Timer
    Left = 8
    Top = 64
  end
  object XPManifest1: TXPManifest
    Left = 8
    Top = 96
  end
  object MainMenu1: TMainMenu
    Left = 8
    Top = 128
    object File1: TMenuItem
      Caption = 'File'
      Default = True
      object Aboute1: TMenuItem
        Caption = 'About'
        OnClick = Aboute1Click
      end
      object Close1: TMenuItem
        Caption = 'Close'
        OnClick = Close1Click
      end
    end
    object Checkupdate1: TMenuItem
      AutoCheck = True
      Caption = 'Check update'
      Checked = True
      OnClick = Checkupdate1Click
    end
    object U1: TMenuItem
      Caption = 'UST'
      OnClick = U1Click
    end
    object N1: TMenuItem
      Caption = 'Settings'
      OnClick = N1Click
    end
  end
  object sSkinProvider1: TsSkinProvider
    AddedTitle.Font.Charset = DEFAULT_CHARSET
    AddedTitle.Font.Color = clNone
    AddedTitle.Font.Height = -11
    AddedTitle.Font.Name = 'MS Sans Serif'
    AddedTitle.Font.Style = []
    SkinData.SkinSection = 'FORM'
    TitleButtons = <>
    Left = 104
    Top = 112
  end
  object Icon: TRzTrayIcon
    Hint = 'Trey Manager'
    PopupMenu = PopupMenu1
    Left = 136
    Top = 112
  end
  object IdCookieManager1: TIdCookieManager
    Left = 40
    Top = 112
  end
  object PopupMenu1: TPopupMenu
    Left = 184
    Top = 112
    object A1: TMenuItem
      Break = mbBarBreak
      Caption = 'About'
      OnClick = Aboute1Click
    end
    object S1: TMenuItem
      Caption = 'Settings'
      OnClick = N1Click
    end
    object C1: TMenuItem
      Caption = 'Close'
      OnClick = Close1Click
    end
  end
  object IdSMTP1: TIdSMTP
    IOHandler = IdSSLIOHandlerSocket1
    MaxLineAction = maException
    ReadTimeout = 0
    Host = 'smtp.gmail.com'
    Port = 25
    AuthenticationType = atLogin
    Password = '123456yurarossman'
    Username = 'yura.crossman'
    Left = 312
    Top = 128
  end
  object IdMessage1: TIdMessage
    AttachmentEncoding = 'MIME'
    BccList = <>
    CCList = <>
    Encoding = meMIME
    Recipients = <>
    ReplyTo = <>
    Left = 344
    Top = 128
  end
  object IdSSLIOHandlerSocket1: TIdSSLIOHandlerSocket
    SSLOptions.Method = sslvSSLv2
    SSLOptions.Mode = sslmUnassigned
    SSLOptions.VerifyMode = []
    SSLOptions.VerifyDepth = 0
    Left = 376
    Top = 128
  end
end
