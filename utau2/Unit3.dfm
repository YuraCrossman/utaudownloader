object Form3: TForm3
  Left = 674
  Top = 347
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Update'
  ClientHeight = 87
  ClientWidth = 198
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Label2: TLabel
    Left = 117
    Top = 31
    Width = 59
    Height = 13
    Caption = 'New ver 0.0'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
    Visible = False
  end
  object Label1: TLabel
    Left = 25
    Top = 9
    Width = 147
    Height = 21
    Caption = 'The last update! Yeah'
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
  end
  object Label3: TLabel
    Left = 24
    Top = 32
    Width = 78
    Height = 13
    Caption = 'Current ver: 0.0'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
    Visible = False
  end
  object Label4: TLabel
    Left = 60
    Top = 53
    Width = 74
    Height = 20
    Caption = 'Version: 0.0'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
  end
  object Button1: TButton
    Left = 59
    Top = 50
    Width = 75
    Height = 25
    Cursor = crHandPoint
    Caption = 'Download'
    TabOrder = 0
    Visible = False
    OnClick = Button1Click
  end
  object IdHTTP1: TIdHTTP
    MaxLineAction = maException
    ReadTimeout = 0
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
    Top = 24
  end
  object IdAntiFreeze1: TIdAntiFreeze
    IdleTimeOut = 5
    Left = 168
    Top = 24
  end
end
