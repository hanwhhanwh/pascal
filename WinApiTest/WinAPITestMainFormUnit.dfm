object WinAPITestMainForm: TWinAPITestMainForm
  Left = 263
  Top = 139
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
    ActivePage = tsMouse
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
    object tsMouse: TTabSheet
      Caption = 'Mouse'
      ImageIndex = 1
      object lbl1: TLabel
        Left = 15
        Top = 12
        Width = 37
        Height = 13
        Caption = 'Hwnd : '
      end
      object lbl2: TLabel
        Left = 15
        Top = 36
        Width = 50
        Height = 13
        Caption = 'Mouse X : '
      end
      object lbl3: TLabel
        Left = 167
        Top = 36
        Width = 50
        Height = 13
        Caption = 'Mouse Y : '
      end
      object edtMouseHandle: TEdit
        Left = 56
        Top = 8
        Width = 129
        Height = 21
        TabOrder = 0
      end
      object btnMouseClick: TButton
        Left = 320
        Top = 29
        Width = 105
        Height = 25
        Caption = 'MouseClick'
        TabOrder = 1
        OnClick = btnMouseClickClick
      end
      object seMouseX: TSpinEdit
        Left = 64
        Top = 32
        Width = 81
        Height = 22
        MaxValue = 0
        MinValue = 0
        TabOrder = 2
        Value = 400
      end
      object seMouseY: TSpinEdit
        Left = 216
        Top = 32
        Width = 81
        Height = 22
        MaxValue = 0
        MinValue = 0
        TabOrder = 3
        Value = 400
      end
    end
  end
end
