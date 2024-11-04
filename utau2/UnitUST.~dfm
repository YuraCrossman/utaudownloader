object Form5: TForm5
  Left = 394
  Top = 235
  Width = 739
  Height = 360
  Caption = 'UST'#39's'
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
  object sDBGrid1: TsDBGrid
    Left = 0
    Top = 0
    Width = 723
    Height = 284
    Align = alClient
    DataSource = DataSource1
    ReadOnly = True
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'Title'
        Width = 174
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'Type'
        Width = 65
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Cover'
        ImeMode = imOpen
        PopupMenu = PopupMenu1
        Width = 207
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Link'
        PopupMenu = PopupMenu2
        Width = 211
        Visible = True
      end>
  end
  object sDBNavigator1: TsDBNavigator
    Left = 0
    Top = 284
    Width = 723
    Height = 37
    Align = alBottom
    DoubleBuffered = False
    FullRepaint = False
    TabOrder = 0
    DataSource = DataSource1
    VisibleButtons = [nbPrior, nbNext]
  end
  object LinkCover: TDBMemo
    Left = 56
    Top = 152
    Width = 185
    Height = 89
    DataField = 'Cover'
    DataSource = DataSource1
    TabOrder = 2
    Visible = False
  end
  object LinkUST: TDBMemo
    Left = 256
    Top = 152
    Width = 185
    Height = 89
    DataField = 'Link'
    DataSource = DataSource1
    TabOrder = 3
    Visible = False
  end
  object ADOConnection1: TADOConnection
    ConnectionString = 
      'Provider=Microsoft.Jet.OLEDB.4.0;Data Source=ust;Persist Securit' +
      'y Info=False;Jet OLEDB:Database Password=123456YuraCrossman;'
    LoginPrompt = False
    Mode = cmShareDenyNone
    Provider = 'Microsoft.Jet.OLEDB.4.0'
  end
  object ADOTable1: TADOTable
    Connection = ADOConnection1
    CursorType = ctStatic
    LockType = ltReadOnly
    TableName = 'UST'
    Left = 32
  end
  object DataSource1: TDataSource
    DataSet = ADOTable1
    Left = 64
  end
  object PopupMenu1: TPopupMenu
    Left = 8
    Top = 96
    object OpenCover1: TMenuItem
      Caption = 'Open Cover'
      OnClick = OpenCover1Click
    end
  end
  object PopupMenu2: TPopupMenu
    Left = 40
    Top = 96
    object MenuItem1: TMenuItem
      Caption = 'Open Link'
      OnClick = MenuItem1Click
    end
  end
end
