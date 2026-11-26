object Form1: TForm1
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu, biMinimize]
  Caption = 'Form1'
  ClientHeight = 370
  ClientWidth = 867
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  TextHeight = 15
  object Button1: TButton
    Left = 8
    Top = 8
    Width = 90
    Height = 26
    Caption = 'Open File'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Arial Narrow'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
    OnClick = Button1Click
  end
  object Chart1: TChart
    Left = 8
    Top = 48
    Width = 849
    Height = 329
    Title.Text.Strings = (
      '')
    BottomAxis.Title.Caption = 'Time (s)'
    LeftAxis.Title.Caption = 'Amplitude (mV)'
    View3D = False
    View3DWalls = False
    TabOrder = 1
    DefaultCanvas = 'TGDIPlusCanvas'
    PrintMargins = (
      15
      25
      15
      25)
    ColorPaletteIndex = 13
    object Series1: TLineSeries
      Brush.BackColor = clDefault
      Pointer.InflateMargins = True
      Pointer.Style = psRectangle
      XValues.Name = 'X'
      XValues.Order = loAscending
      YValues.Name = 'Y'
      YValues.Order = loNone
    end
  end
  object OpenDialog1: TOpenDialog
    Filter = 'Text files (*.txt;*.csv)|*.txt;*.csv|All files (*.*)|*.*'
    Left = 804
    Top = 4
  end
end
