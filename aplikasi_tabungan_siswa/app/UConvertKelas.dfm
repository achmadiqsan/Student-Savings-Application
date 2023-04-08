object FConvertKelas: TFConvertKelas
  Left = 167
  Top = 128
  Width = 1015
  Height = 518
  BorderIcons = [biSystemMenu]
  Caption = 'CONVERT KELAS'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 999
    Height = 479
    Align = alClient
    Color = clWhite
    Font.Charset = ANSI_CHARSET
    Font.Color = clWhite
    Font.Height = -13
    Font.Name = 'Roboto'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 0
    object Panel2: TPanel
      Left = 460
      Top = 8
      Width = 84
      Height = 64
      Cursor = crHandPoint
      Caption = 'Filter'
      Color = 14120960
      TabOrder = 0
      OnClick = Panel2Click
    end
    object Panel3: TPanel
      Left = 15
      Top = 154
      Width = 973
      Height = 29
      Cursor = crHandPoint
      Caption = 'Convert'
      Color = 14120960
      TabOrder = 1
      OnClick = Panel3Click
    end
    object Panel4: TPanel
      Left = 14
      Top = 144
      Width = 973
      Height = 3
      BevelOuter = bvNone
      Color = 14120960
      TabOrder = 2
    end
    object GroupBox1: TGroupBox
      Left = 13
      Top = 1
      Width = 438
      Height = 75
      Caption = ' FILTER DATA : '
      Font.Charset = ANSI_CHARSET
      Font.Color = 4210752
      Font.Height = -13
      Font.Name = 'Roboto'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 3
      object Label2: TLabel
        Left = 15
        Top = 20
        Width = 44
        Height = 15
        Caption = 'Periode'
        Font.Charset = ANSI_CHARSET
        Font.Color = 4210752
        Font.Height = -13
        Font.Name = 'Roboto'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label4: TLabel
        Left = 220
        Top = 12
        Width = 32
        Height = 15
        Caption = 'Kelas'
        Font.Charset = ANSI_CHARSET
        Font.Color = 4210752
        Font.Height = -13
        Font.Name = 'Roboto'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Edit1: TEdit
        Left = 15
        Top = 38
        Width = 199
        Height = 23
        BevelInner = bvNone
        Font.Charset = ANSI_CHARSET
        Font.Color = 4210752
        Font.Height = -13
        Font.Name = 'Roboto'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 0
      end
      object ComboBox2: TComboBox
        Left = 221
        Top = 36
        Width = 199
        Height = 23
        Font.Charset = ANSI_CHARSET
        Font.Color = 4210752
        Font.Height = -13
        Font.Name = 'Roboto'
        Font.Style = [fsBold]
        ItemHeight = 15
        ParentFont = False
        TabOrder = 1
        Text = '-- PILIH KELAS --'
        Items.Strings = (
          'Kelas 1'
          'Kelas 2'
          'Kelas 3'
          'Kelas 4'
          'Kelas 5'
          'Kelas 6'
          'Lulus')
      end
    end
    object GroupBox2: TGroupBox
      Left = 549
      Top = 1
      Width = 438
      Height = 75
      Caption = ' UPDATE DATA KELAS DAN PERIODE : '
      Font.Charset = ANSI_CHARSET
      Font.Color = 4210752
      Font.Height = -13
      Font.Name = 'Roboto'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 4
      object Label1: TLabel
        Left = 15
        Top = 19
        Width = 44
        Height = 15
        Caption = 'Periode'
        Font.Charset = ANSI_CHARSET
        Font.Color = 4210752
        Font.Height = -13
        Font.Name = 'Roboto'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label3: TLabel
        Left = 154
        Top = 18
        Width = 32
        Height = 15
        Caption = 'Kelas'
        Font.Charset = ANSI_CHARSET
        Font.Color = 4210752
        Font.Height = -13
        Font.Name = 'Roboto'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label5: TLabel
        Left = 294
        Top = 18
        Width = 39
        Height = 15
        Caption = 'Status'
        Font.Charset = ANSI_CHARSET
        Font.Color = 4210752
        Font.Height = -13
        Font.Name = 'Roboto'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Edit2: TEdit
        Left = 15
        Top = 37
        Width = 130
        Height = 23
        BevelInner = bvNone
        Font.Charset = ANSI_CHARSET
        Font.Color = 4210752
        Font.Height = -13
        Font.Name = 'Roboto'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 0
      end
      object ComboBox1: TComboBox
        Left = 155
        Top = 36
        Width = 132
        Height = 23
        Font.Charset = ANSI_CHARSET
        Font.Color = 4210752
        Font.Height = -13
        Font.Name = 'Roboto'
        Font.Style = [fsBold]
        ItemHeight = 15
        ParentFont = False
        TabOrder = 1
        Text = '-- PILIH KELAS --'
        Items.Strings = (
          'Kelas 1'
          'Kelas 2'
          'Kelas 3'
          'Kelas 4'
          'Kelas 5'
          'Kelas 6'
          'Lulus')
      end
      object ComboBox3: TComboBox
        Left = 294
        Top = 36
        Width = 138
        Height = 23
        Font.Charset = ANSI_CHARSET
        Font.Color = 4210752
        Font.Height = -13
        Font.Name = 'Roboto'
        Font.Style = [fsBold]
        ItemHeight = 15
        ParentFont = False
        TabOrder = 2
        Text = '-- PILIH STATUS --'
        Items.Strings = (
          'Siswa Aktif'
          'Siswa Non-Aktif'
          'Pindah Sekolah'
          'Lulus')
      end
    end
    object DBGrid1: TDBGrid
      Left = 15
      Top = 197
      Width = 972
      Height = 268
      DataSource = DM.DSConvert
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -13
      Font.Name = 'Roboto'
      Font.Style = [fsBold]
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
      ParentFont = False
      TabOrder = 5
      TitleFont.Charset = ANSI_CHARSET
      TitleFont.Color = clBlack
      TitleFont.Height = -13
      TitleFont.Name = 'Roboto'
      TitleFont.Style = [fsBold]
      Columns = <
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
          FieldName = 'jenis_kelamin'
          Title.Alignment = taCenter
          Title.Caption = 'JENIS KELAMIN'
          Width = 200
          Visible = True
        end
        item
          Alignment = taCenter
          Expanded = False
          FieldName = 'keterangan'
          Title.Alignment = taCenter
          Title.Caption = 'KETERANGAN'
          Width = 200
          Visible = True
        end
        item
          Alignment = taCenter
          Expanded = False
          FieldName = 'tgl_masuk'
          Title.Alignment = taCenter
          Title.Caption = 'TANGGAL MASUK'
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
          FieldName = 'no_hp_ortu'
          Title.Alignment = taCenter
          Title.Caption = 'NNO HP ORANG TUA'
          Width = 150
          Visible = True
        end
        item
          Alignment = taCenter
          Expanded = False
          FieldName = 'saldo_tabungan'
          Title.Alignment = taCenter
          Title.Caption = 'SALDO TABUNGAN'
          Visible = True
        end>
    end
    object GroupBox3: TGroupBox
      Left = 14
      Top = 80
      Width = 971
      Height = 58
      Caption = ' Cari Data '
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -13
      Font.Name = 'Roboto'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 6
      object Edit3: TEdit
        Left = 12
        Top = 21
        Width = 688
        Height = 23
        BevelInner = bvNone
        Font.Charset = ANSI_CHARSET
        Font.Color = 4210752
        Font.Height = -13
        Font.Name = 'Roboto'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 0
        OnChange = Edit3Change
      end
      object RadioButton1: TRadioButton
        Left = 719
        Top = 23
        Width = 113
        Height = 17
        Caption = 'NISN'
        TabOrder = 1
      end
      object RadioButton2: TRadioButton
        Left = 847
        Top = 23
        Width = 113
        Height = 17
        Caption = 'Nama Siswa'
        TabOrder = 2
      end
    end
  end
end
