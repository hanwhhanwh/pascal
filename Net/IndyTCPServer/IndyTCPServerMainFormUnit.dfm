object IndyTCPServerMainFormForm: TIndyTCPServerMainFormForm
  Left = 214
  Top = 117
  Width = 863
  Height = 581
  Caption = 'IndyTCPServerMainFormForm'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object spl1: TSplitter
    Left = 0
    Top = 253
    Width = 847
    Height = 3
    Cursor = crVSplit
    Align = alBottom
  end
  object mmoLog: TMemo
    Left = 0
    Top = 256
    Width = 847
    Height = 286
    Align = alBottom
    TabOrder = 0
  end
  object pnlMenu: TPanel
    Left = 0
    Top = 0
    Width = 847
    Height = 41
    Align = alTop
    TabOrder = 1
    object btnStart: TButton
      Left = 104
      Top = 8
      Width = 75
      Height = 25
      Caption = 'btnStart'
      TabOrder = 0
      OnClick = btnStartClick
    end
    object btnStop: TButton
      Left = 192
      Top = 8
      Width = 75
      Height = 25
      Caption = 'btnStop'
      TabOrder = 1
      OnClick = btnStopClick
    end
  end
  object IdTCPServer: TIdTCPServer
    OnStatus = IdTCPServerStatus
    Bindings = <
      item
        IP = '0.0.0.0'
        Port = 3300
      end>
    CommandHandlers = <>
    DefaultPort = 3300
    Greeting.NumericCode = 0
    MaxConnectionReply.NumericCode = 0
    OnConnect = IdTCPServerConnect
    OnExecute = IdTCPServerExecute
    OnDisconnect = IdTCPServerDisconnect
    ReplyExceptionCode = 0
    ReplyTexts = <>
    ReplyUnknownCommand.NumericCode = 0
    Left = 48
    Top = 16
  end
end
