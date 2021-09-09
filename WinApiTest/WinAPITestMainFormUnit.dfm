object WinAPITestMainForm: TWinAPITestMainForm
  Left = 245
  Top = 181
  Width = 647
  Height = 474
  Caption = 'WinAPITestMainForm'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object spl1: TSplitter
    Left = 0
    Top = 245
    Width = 631
    Height = 3
    Cursor = crVSplit
    Align = alBottom
  end
  object mmoLog: TMemo
    Left = 0
    Top = 248
    Width = 631
    Height = 187
    Align = alBottom
    ScrollBars = ssVertical
    TabOrder = 0
  end
  object pgc1: TPageControl
    Left = 0
    Top = 0
    Width = 631
    Height = 245
    ActivePage = tsFindWindow
    Align = alClient
    TabOrder = 1
    object tsFindWindow: TTabSheet
      Caption = 'FindWindow'
      ImageIndex = 3
      object lbl6: TLabel
        Left = 16
        Top = 88
        Width = 27
        Height = 13
        Caption = 'Hwnd'
      end
      object lbl7: TLabel
        Left = 8
        Top = 24
        Width = 55
        Height = 13
        Caption = 'Class Name'
      end
      object lbl8: TLabel
        Left = 168
        Top = 24
        Width = 37
        Height = 13
        Caption = 'Caption'
      end
      object btnFindWindow: TButton
        Left = 424
        Top = 16
        Width = 105
        Height = 25
        Caption = 'FindWindow'
        TabOrder = 0
        OnClick = btnFindWindowClick
      end
      object btnFindWindowEx: TButton
        Left = 424
        Top = 52
        Width = 105
        Height = 25
        Caption = 'FindWindowEx'
        TabOrder = 1
        OnClick = btnFindWindowExClick
      end
      object edtFindWindowHandle: TEdit
        Left = 48
        Top = 80
        Width = 129
        Height = 21
        TabOrder = 2
      end
      object edtClassName: TEdit
        Left = 72
        Top = 24
        Width = 80
        Height = 21
        TabOrder = 3
      end
      object edtCaption: TEdit
        Left = 216
        Top = 24
        Width = 177
        Height = 21
        TabOrder = 4
      end
    end
  end
end
