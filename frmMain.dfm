object formMain: TformMain
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'LoL Ping Check'
  ClientHeight = 124
  ClientWidth = 334
  Color = clBtnFace
  DoubleBuffered = True
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object lblServer: TJvLabel
    Left = 8
    Top = 8
    Width = 34
    Height = 13
    Caption = 'Server'
    FocusControl = comboServer
    Transparent = True
  end
  object lblIP: TJvLabel
    Left = 173
    Top = 8
    Width = 12
    Height = 13
    Caption = 'IP'
    FocusControl = edIP
    Transparent = True
  end
  object blReply: TJvLabel
    Left = 8
    Top = 54
    Width = 113
    Height = 13
    Caption = 'Average response time'
    FocusControl = edReply
    Transparent = True
  end
  object edIP: TJvIPAddress
    Left = 173
    Top = 24
    Width = 150
    Height = 21
    Address = 0
    Color = clBtnFace
    Enabled = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBtnShadow
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentColor = False
    ParentFont = False
    TabOrder = 0
  end
  object comboServer: TJvComboBox
    Left = 8
    Top = 24
    Width = 150
    Height = 21
    Style = csDropDownList
    ParentFlat = False
    TabOrder = 1
    OnChange = comboServerChange
    Items.Strings = (
      'NA'
      'EUW'
      'EUNE'
      'OCE'
      'LAN')
  end
  object btnPing: TButton
    Left = 248
    Top = 68
    Width = 75
    Height = 25
    Caption = 'Check ping'
    TabOrder = 2
    OnClick = btnPingClick
  end
  object edReply: TJvEdit
    Left = 8
    Top = 70
    Width = 150
    Height = 21
    ReadOnly = True
    TabOrder = 3
  end
  object statusBar: TJvStatusBar
    Left = 0
    Top = 104
    Width = 334
    Height = 20
    Panels = <>
    SimplePanel = True
  end
  object objICMPClient: TIdIcmpClient
    Protocol = 1
    ProtocolIPv6 = 0
    IPVersion = Id_IPv4
    PacketSize = 512
    Left = 192
    Top = 57
  end
end
