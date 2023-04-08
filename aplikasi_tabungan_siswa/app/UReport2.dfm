object FReport2: TFReport2
  Left = 52
  Top = 116
  Width = 1309
  Height = 526
  BorderIcons = [biSystemMenu]
  Caption = 'REPORT'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 1293
    Height = 487
    Align = alClient
    BevelOuter = bvNone
    Color = clWhite
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
    object Label1: TLabel
      Left = 8
      Top = 16
      Width = 388
      Height = 33
      Caption = 'FORM LAPORAN TRANSAKSI'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 14120960
      Font.Height = -27
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Shape1: TShape
      Left = 8
      Top = 56
      Width = 1273
      Height = 4
      Brush.Color = 14120960
      Pen.Color = 14120960
    end
    object Panel3: TPanel
      Left = 790
      Top = 8
      Width = 113
      Height = 41
      Cursor = crHandPoint
      BevelInner = bvRaised
      Caption = 'Cetak'
      Color = 14120960
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 0
      OnClick = Panel3Click
    end
    object GroupBox1: TGroupBox
      Left = 8
      Top = 64
      Width = 449
      Height = 409
      Caption = ' INPUT DATA SISWA '
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
      object Label2: TLabel
        Left = 30
        Top = 225
        Width = 73
        Height = 19
        Caption = 'Total Data'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -16
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object Label3: TLabel
        Left = 36
        Top = 309
        Width = 72
        Height = 19
        Caption = 'Total Nilai'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -16
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object Label5: TLabel
        Left = 24
        Top = 33
        Width = 198
        Height = 19
        Caption = 'Tanggal Awal : Tgl/Bln/Thn'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -16
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object Label4: TLabel
        Left = 24
        Top = 89
        Width = 201
        Height = 19
        Caption = 'Tanggal Akhir : Tgl/Bln/Thn'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -16
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object Edit1: TEdit
        Left = 30
        Top = 256
        Width = 403
        Height = 24
        Enabled = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
      end
      object Edit2: TEdit
        Left = 31
        Top = 340
        Width = 403
        Height = 24
        Enabled = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 1
      end
      object DateTimePicker1: TDateTimePicker
        Left = 27
        Top = 57
        Width = 403
        Height = 24
        Date = 45008.580101516210000000
        Format = 'dd-MMM-yyyy'
        Time = 45008.580101516210000000
        TabOrder = 2
        OnChange = DateTimePicker1Change
      end
      object DateTimePicker2: TDateTimePicker
        Left = 27
        Top = 113
        Width = 403
        Height = 24
        Date = 45008.580101516210000000
        Format = 'dd-MMM-yyyy'
        Time = 45008.580101516210000000
        TabOrder = 3
      end
      object Panel4: TPanel
        Left = 232
        Top = 160
        Width = 113
        Height = 41
        BevelInner = bvRaised
        Caption = 'Reset'
        Color = 14120960
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 4
        OnClick = Panel4Click
      end
      object Panel2: TPanel
        Left = 96
        Top = 160
        Width = 113
        Height = 41
        BevelInner = bvRaised
        Caption = 'Search'
        Color = 14120960
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 5
        OnClick = Panel2Click
      end
    end
    object RadioButton1: TRadioButton
      Left = 920
      Top = 16
      Width = 177
      Height = 25
      Caption = 'Setoran'
      Color = 14120960
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -17
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentColor = False
      ParentFont = False
      TabOrder = 2
    end
    object RadioButton2: TRadioButton
      Left = 1104
      Top = 16
      Width = 177
      Height = 25
      Caption = 'Penarikan'
      Color = 14120960
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -17
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentColor = False
      ParentFont = False
      TabOrder = 3
    end
    object DBGrid1: TDBGrid
      Left = 464
      Top = 72
      Width = 817
      Height = 401
      DataSource = DM.DSReport
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
      TabOrder = 4
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clBlack
      TitleFont.Height = -11
      TitleFont.Name = 'Tahoma'
      TitleFont.Style = []
      Columns = <
        item
          Alignment = taCenter
          Expanded = False
          FieldName = 'kode_transakasi_setor'
          Title.Alignment = taCenter
          Title.Caption = 'KODE TRANSAKSI SETORAN'
          Width = 200
          Visible = True
        end
        item
          Alignment = taCenter
          Expanded = False
          FieldName = 'tgl'
          Title.Alignment = taCenter
          Title.Caption = 'TANGGAL SETORAN'
          Visible = True
        end
        item
          Alignment = taCenter
          Expanded = False
          FieldName = 'nisn'
          Title.Alignment = taCenter
          Title.Caption = 'NISN'
          Width = 200
          Visible = True
        end
        item
          Alignment = taCenter
          Expanded = False
          FieldName = 'nama'
          Title.Alignment = taCenter
          Title.Caption = 'NAMA SISWA'
          Width = 200
          Visible = True
        end
        item
          Alignment = taCenter
          Expanded = False
          FieldName = 'kelas'
          Title.Alignment = taCenter
          Title.Caption = 'KELAS'
          Width = 200
          Visible = True
        end
        item
          Alignment = taCenter
          Expanded = False
          FieldName = 'periode'
          Title.Alignment = taCenter
          Title.Caption = 'PERIODE'
          Width = 200
          Visible = True
        end
        item
          Alignment = taCenter
          Expanded = False
          FieldName = 'setoran'
          Title.Alignment = taCenter
          Title.Caption = 'SETORAN'
          Visible = True
        end>
    end
    object DBGrid2: TDBGrid
      Left = 464
      Top = 72
      Width = 817
      Height = 401
      DataSource = DM.DSReport2
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
      TabOrder = 5
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clBlack
      TitleFont.Height = -11
      TitleFont.Name = 'Tahoma'
      TitleFont.Style = []
      Columns = <
        item
          Alignment = taCenter
          Expanded = False
          FieldName = 'kode_transaksi_tarik'
          Title.Alignment = taCenter
          Title.Caption = 'KODE TRANSAKSI PENARIKAN'
          Width = 200
          Visible = True
        end
        item
          Alignment = taCenter
          Expanded = False
          FieldName = 'tgl'
          Title.Alignment = taCenter
          Title.Caption = 'TANGGAL PENARIKAN'
          Visible = True
        end
        item
          Alignment = taCenter
          Expanded = False
          FieldName = 'nisn'
          Title.Alignment = taCenter
          Title.Caption = 'NISN'
          Width = 200
          Visible = True
        end
        item
          Alignment = taCenter
          Expanded = False
          FieldName = 'nama'
          Title.Alignment = taCenter
          Title.Caption = 'NAMA SISWA'
          Width = 200
          Visible = True
        end
        item
          Alignment = taCenter
          Expanded = False
          FieldName = 'kelas'
          Title.Alignment = taCenter
          Title.Caption = 'KELAS'
          Width = 200
          Visible = True
        end
        item
          Alignment = taCenter
          Expanded = False
          FieldName = 'periode'
          Title.Alignment = taCenter
          Title.Caption = 'PERIODE'
          Width = 200
          Visible = True
        end
        item
          Alignment = taCenter
          Expanded = False
          FieldName = 'penarikan'
          Title.Alignment = taCenter
          Title.Caption = 'PENARIKAN'
          Visible = True
        end>
    end
  end
end
