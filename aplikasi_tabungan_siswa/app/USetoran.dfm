object FSetoran: TFSetoran
  Left = 48
  Top = 158
  Width = 1311
  Height = 524
  BorderIcons = [biSystemMenu]
  Caption = 'SETORAN'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  OnActivate = FormActivate
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 1295
    Height = 485
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
      Caption = 'FORM TRANSAKSI SETORAN'
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
    object Label9: TLabel
      Left = 463
      Top = 79
      Width = 88
      Height = 19
      Caption = 'Jumlah Data'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object Label10: TLabel
      Left = 847
      Top = 77
      Width = 123
      Height = 19
      Caption = 'Kriteria Pencarian'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object Label11: TLabel
      Left = 1006
      Top = 80
      Width = 130
      Height = 19
      Caption = 'Cari Nama Siswa :'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object Panel2: TPanel
      Left = 806
      Top = 8
      Width = 113
      Height = 41
      Cursor = crHandPoint
      BevelInner = bvRaised
      Caption = 'Add Data'
      Color = 14120960
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 0
      OnClick = Panel2Click
    end
    object Panel3: TPanel
      Left = 926
      Top = 8
      Width = 113
      Height = 41
      Cursor = crHandPoint
      BevelInner = bvRaised
      Caption = 'Delete Data'
      Color = 14120960
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 1
      OnClick = Panel3Click
    end
    object Panel4: TPanel
      Left = 1046
      Top = 8
      Width = 113
      Height = 41
      Cursor = crHandPoint
      BevelInner = bvRaised
      Caption = 'Update Data'
      Color = 14120960
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 2
      OnClick = Panel4Click
    end
    object Panel5: TPanel
      Left = 1166
      Top = 8
      Width = 113
      Height = 41
      Cursor = crHandPoint
      BevelInner = bvRaised
      Caption = 'Reset Form'
      Color = 14120960
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 3
      OnClick = Panel5Click
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
      TabOrder = 4
      object Label2: TLabel
        Left = 38
        Top = 33
        Width = 118
        Height = 19
        Caption = 'Kode Transaksi :'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -16
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object Label3: TLabel
        Left = 108
        Top = 117
        Width = 48
        Height = 19
        Caption = 'NISN :'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -16
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object Label4: TLabel
        Left = 109
        Top = 203
        Width = 47
        Height = 19
        Caption = 'Kelas :'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -16
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object Label5: TLabel
        Left = 91
        Top = 248
        Width = 65
        Height = 19
        Caption = 'Setoran :'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -16
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object Label6: TLabel
        Left = 106
        Top = 291
        Width = 50
        Height = 19
        Caption = 'Saldo :'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -16
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object Label7: TLabel
        Left = 88
        Top = 73
        Width = 68
        Height = 19
        Caption = 'Tanggal :'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -16
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object Label8: TLabel
        Left = 59
        Top = 159
        Width = 97
        Height = 19
        Caption = 'Nama Siswa :'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -16
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object Label12: TLabel
        Left = 65
        Top = 333
        Width = 91
        Height = 19
        Caption = 'Total Saldo :'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -16
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object Label13: TLabel
        Left = 380
        Top = 75
        Width = 55
        Height = 19
        Caption = 'Label13'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -16
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        Visible = False
      end
      object Label14: TLabel
        Left = 387
        Top = 248
        Width = 9
        Height = 19
        Caption = '0'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -16
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        Visible = False
      end
      object Label15: TLabel
        Left = 387
        Top = 288
        Width = 9
        Height = 19
        Caption = '0'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -16
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        Visible = False
      end
      object Edit1: TEdit
        Left = 166
        Top = 32
        Width = 213
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
        Left = 167
        Top = 116
        Width = 211
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
        Left = 166
        Top = 73
        Width = 213
        Height = 24
        Date = 45008.000000000000000000
        Format = 'dd-MMM-yyyy'
        Time = 45008.000000000000000000
        TabOrder = 2
        OnChange = DateTimePicker1Change
      end
      object Edit3: TEdit
        Left = 165
        Top = 158
        Width = 213
        Height = 24
        Enabled = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 3
      end
      object Panel8: TPanel
        Left = 386
        Top = 114
        Width = 55
        Height = 25
        Cursor = crHandPoint
        BevelInner = bvRaised
        Caption = 'Cari'
        Color = 14120960
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 4
        OnClick = Panel8Click
      end
      object Edit7: TEdit
        Left = 165
        Top = 203
        Width = 213
        Height = 24
        Enabled = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 5
      end
      object Edit8: TEdit
        Left = 165
        Top = 245
        Width = 213
        Height = 24
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 6
        OnChange = Edit8Change
        OnKeyPress = Edit8KeyPress
      end
      object Edit9: TEdit
        Left = 165
        Top = 287
        Width = 213
        Height = 24
        Enabled = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 7
      end
      object Edit10: TEdit
        Left = 165
        Top = 329
        Width = 213
        Height = 24
        Enabled = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 8
      end
    end
    object DBGrid1: TDBGrid
      Left = 464
      Top = 136
      Width = 817
      Height = 335
      DataSource = DM.DSSetoran
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
      TabOrder = 5
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clBlack
      TitleFont.Height = -11
      TitleFont.Name = 'Tahoma'
      TitleFont.Style = []
      OnKeyPress = DBGrid1KeyPress
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
    object Edit4: TEdit
      Left = 464
      Top = 105
      Width = 88
      Height = 24
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 6
    end
    object ComboBox4: TComboBox
      Left = 847
      Top = 101
      Width = 148
      Height = 24
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ItemHeight = 16
      ParentFont = False
      TabOrder = 7
      Text = '-- PILIH KRITERIA --'
      Items.Strings = (
        'Nama Siswa'
        'Kelas')
    end
    object Edit5: TEdit
      Left = 1006
      Top = 103
      Width = 149
      Height = 24
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 8
    end
    object Panel6: TPanel
      Left = 1163
      Top = 88
      Width = 113
      Height = 41
      Cursor = crHandPoint
      BevelInner = bvRaised
      Caption = 'Cari Data'
      Color = 14120960
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 9
      OnClick = Panel6Click
    end
    object Panel7: TPanel
      Left = 686
      Top = 8
      Width = 113
      Height = 41
      Cursor = crHandPoint
      BevelInner = bvRaised
      Caption = 'New'
      Color = 14120960
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 10
      OnClick = Panel7Click
    end
    object Edit6: TEdit
      Left = 560
      Top = 105
      Width = 131
      Height = 24
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 11
    end
  end
end
