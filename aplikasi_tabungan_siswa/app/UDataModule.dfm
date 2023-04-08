object DM: TDM
  OldCreateOrder = False
  Left = 232
  Top = 172
  Height = 321
  Width = 702
  object ADOConnection1: TADOConnection
    Connected = True
    ConnectionString = 
      'Provider=Microsoft.Jet.OLEDB.4.0;Data Source=D:\aplikasi_tabunga' +
      'n_siswa\database\database_tabungan_app.mdb;Persist Security Info' +
      '=False'
    LoginPrompt = False
    Mode = cmShareDenyNone
    Provider = 'Microsoft.Jet.OLEDB.4.0'
    Left = 40
    Top = 8
  end
  object ADOLogin: TADOTable
    Active = True
    Connection = ADOConnection1
    CursorType = ctStatic
    TableName = 'login'
    Left = 40
    Top = 64
  end
  object ADOPeriode: TADOTable
    Active = True
    Connection = ADOConnection1
    CursorType = ctStatic
    TableName = 'periode'
    Left = 168
    Top = 8
  end
  object ADOTempPeriode: TADOTable
    Active = True
    Connection = ADOConnection1
    CursorType = ctStatic
    TableName = 'tempPeriode'
    Left = 48
    Top = 128
  end
  object DSPeriode: TDataSource
    DataSet = ADOPeriode
    Left = 240
    Top = 8
  end
  object DSLogin: TDataSource
    DataSet = ADOLogin
    Left = 96
    Top = 72
  end
  object ADODataSiswa: TADOTable
    Active = True
    Connection = ADOConnection1
    CursorType = ctStatic
    TableName = 'dataSiswa'
    Left = 168
    Top = 72
    object ADODataSiswaid: TAutoIncField
      FieldName = 'id'
      ReadOnly = True
    end
    object ADODataSiswanisn: TWideStringField
      FieldName = 'nisn'
      Size = 255
    end
    object ADODataSiswanama: TWideStringField
      FieldName = 'nama'
      Size = 255
    end
    object ADODataSiswakelas: TWideStringField
      FieldName = 'kelas'
      Size = 255
    end
    object ADODataSiswajenis_kelamin: TWideStringField
      FieldName = 'jenis_kelamin'
      Size = 255
    end
    object ADODataSiswaketerangan: TWideStringField
      FieldName = 'keterangan'
      Size = 255
    end
    object ADODataSiswatgl_masuk: TDateTimeField
      FieldName = 'tgl_masuk'
    end
    object ADODataSiswaperiode: TWideStringField
      FieldName = 'periode'
      Size = 255
    end
    object ADODataSiswano_hp_ortu: TWideStringField
      FieldName = 'no_hp_ortu'
      Size = 255
    end
    object ADODataSiswasaldo_tabungan: TBCDField
      FieldName = 'saldo_tabungan'
      DisplayFormat = '#,#0.00;(#,#0.00);#,#0.00'
      Precision = 19
    end
  end
  object DSDataSiswa: TDataSource
    DataSet = ADODataSiswa
    Left = 248
    Top = 80
  end
  object ADOQJumlahData: TADOQuery
    Connection = ADOConnection1
    Parameters = <>
    Left = 152
    Top = 136
  end
  object ADOQCariSiswaSetoran: TADOQuery
    Active = True
    Connection = ADOConnection1
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'SELECT * FROM dataSiswa')
    Left = 48
    Top = 192
    object ADOQCariSiswaSetoranid: TAutoIncField
      FieldName = 'id'
      ReadOnly = True
    end
    object ADOQCariSiswaSetorannisn: TWideStringField
      FieldName = 'nisn'
      Size = 255
    end
    object ADOQCariSiswaSetorannama: TWideStringField
      FieldName = 'nama'
      Size = 255
    end
    object ADOQCariSiswaSetorankelas: TWideStringField
      FieldName = 'kelas'
      Size = 255
    end
    object ADOQCariSiswaSetoranjenis_kelamin: TWideStringField
      FieldName = 'jenis_kelamin'
      Size = 255
    end
    object ADOQCariSiswaSetoranketerangan: TWideStringField
      FieldName = 'keterangan'
      Size = 255
    end
    object ADOQCariSiswaSetorantgl_masuk: TDateTimeField
      FieldName = 'tgl_masuk'
    end
    object ADOQCariSiswaSetoranperiode: TWideStringField
      FieldName = 'periode'
      Size = 255
    end
    object ADOQCariSiswaSetoranno_hp_ortu: TWideStringField
      FieldName = 'no_hp_ortu'
      Size = 255
    end
    object ADOQCariSiswaSetoransaldo_tabungan: TBCDField
      FieldName = 'saldo_tabungan'
      DisplayFormat = '#,#0.00;(#,#0.00);#,#0.00'
      Precision = 19
    end
  end
  object DSCariSiswaSetoran: TDataSource
    DataSet = ADOQCariSiswaSetoran
    Left = 136
    Top = 208
  end
  object ADOPeriodeTemp: TADOTable
    Active = True
    Connection = ADOConnection1
    CursorType = ctStatic
    TableName = 'tempPeriode'
    Left = 240
    Top = 152
  end
  object ADOSetoran: TADOTable
    Active = True
    Connection = ADOConnection1
    CursorType = ctStatic
    TableName = 'setoran'
    Left = 312
    Top = 16
    object ADOSetoranid: TAutoIncField
      FieldName = 'id'
      ReadOnly = True
    end
    object ADOSetorankode_transakasi_setor: TWideStringField
      FieldName = 'kode_transakasi_setor'
      Size = 255
    end
    object ADOSetorantgl: TDateTimeField
      FieldName = 'tgl'
    end
    object ADOSetorannisn: TWideStringField
      FieldName = 'nisn'
      Size = 255
    end
    object ADOSetorannama: TWideStringField
      FieldName = 'nama'
      Size = 255
    end
    object ADOSetorankelas: TWideStringField
      FieldName = 'kelas'
      Size = 255
    end
    object ADOSetoranperiode: TWideStringField
      FieldName = 'periode'
      Size = 255
    end
    object ADOSetoransetoran: TBCDField
      FieldName = 'setoran'
      DisplayFormat = '#,#0.00;(#,#0.00);#,#0.00'
      Precision = 19
    end
  end
  object DSSetoran: TDataSource
    DataSet = ADOSetoran
    Left = 392
    Top = 24
  end
  object KTS: TADOQuery
    Active = True
    Connection = ADOConnection1
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'SELECT * FROM setoran')
    Left = 328
    Top = 80
  end
  object ADOPenarikan: TADOTable
    Active = True
    Connection = ADOConnection1
    CursorType = ctStatic
    TableName = 'penarikan'
    Left = 312
    Top = 136
    object ADOPenarikanid: TAutoIncField
      FieldName = 'id'
      ReadOnly = True
    end
    object ADOPenarikankode_transaksi_tarik: TWideStringField
      FieldName = 'kode_transaksi_tarik'
      Size = 255
    end
    object ADOPenarikantgl: TDateTimeField
      FieldName = 'tgl'
    end
    object ADOPenarikannisn: TWideStringField
      FieldName = 'nisn'
      Size = 255
    end
    object ADOPenarikannama: TWideStringField
      FieldName = 'nama'
      Size = 255
    end
    object ADOPenarikankelas: TWideStringField
      FieldName = 'kelas'
      Size = 255
    end
    object ADOPenarikanperiode: TWideStringField
      FieldName = 'periode'
      Size = 255
    end
    object ADOPenarikanpenarikan: TBCDField
      FieldName = 'penarikan'
      DisplayFormat = '#,#0.00;(#,#0.00);#,#0.00'
      Precision = 19
    end
  end
  object DSPenarikan: TDataSource
    DataSet = ADOPenarikan
    Left = 392
    Top = 144
  end
  object ADOQCariSiswaPenarikan: TADOQuery
    Active = True
    Connection = ADOConnection1
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'SELECT * FROM dataSiswa')
    Left = 256
    Top = 200
    object AutoIncField1: TAutoIncField
      FieldName = 'id'
      ReadOnly = True
    end
    object WideStringField1: TWideStringField
      FieldName = 'nisn'
      Size = 255
    end
    object WideStringField2: TWideStringField
      FieldName = 'nama'
      Size = 255
    end
    object WideStringField3: TWideStringField
      FieldName = 'kelas'
      Size = 255
    end
    object WideStringField4: TWideStringField
      FieldName = 'jenis_kelamin'
      Size = 255
    end
    object WideStringField5: TWideStringField
      FieldName = 'keterangan'
      Size = 255
    end
    object DateTimeField1: TDateTimeField
      FieldName = 'tgl_masuk'
    end
    object WideStringField6: TWideStringField
      FieldName = 'periode'
      Size = 255
    end
    object WideStringField7: TWideStringField
      FieldName = 'no_hp_ortu'
      Size = 255
    end
    object BCDField1: TBCDField
      FieldName = 'saldo_tabungan'
      DisplayFormat = '#,#0.00;(#,#0.00);#,#0.00'
      Precision = 19
    end
  end
  object DSCariSiswaPenarikan: TDataSource
    DataSet = ADOQCariSiswaPenarikan
    Left = 352
    Top = 216
  end
  object KTP: TADOQuery
    Active = True
    Connection = ADOConnection1
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'SELECT * FROM penarikan')
    Left = 400
    Top = 80
  end
  object ADOQConvert: TADOQuery
    Active = True
    Connection = ADOConnection1
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'SELECT * FROM dataSiswa')
    Left = 480
    Top = 16
    object ADOQConvertid: TAutoIncField
      FieldName = 'id'
      ReadOnly = True
    end
    object ADOQConvertnisn: TWideStringField
      FieldName = 'nisn'
      Size = 255
    end
    object ADOQConvertnama: TWideStringField
      FieldName = 'nama'
      Size = 255
    end
    object ADOQConvertkelas: TWideStringField
      FieldName = 'kelas'
      Size = 255
    end
    object ADOQConvertjenis_kelamin: TWideStringField
      FieldName = 'jenis_kelamin'
      Size = 255
    end
    object ADOQConvertketerangan: TWideStringField
      FieldName = 'keterangan'
      Size = 255
    end
    object ADOQConverttgl_masuk: TDateTimeField
      FieldName = 'tgl_masuk'
    end
    object ADOQConvertperiode: TWideStringField
      FieldName = 'periode'
      Size = 255
    end
    object ADOQConvertno_hp_ortu: TWideStringField
      FieldName = 'no_hp_ortu'
      Size = 255
    end
    object ADOQConvertsaldo_tabungan: TBCDField
      FieldName = 'saldo_tabungan'
      DisplayFormat = '#,#0.00;(#,#0.00);#,#0.00'
      Precision = 19
    end
  end
  object DSConvert: TDataSource
    DataSet = ADOQConvert
    Left = 552
    Top = 16
  end
  object ADOQReport: TADOQuery
    Active = True
    Connection = ADOConnection1
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'SELECT * FROM setoran')
    Left = 488
    Top = 88
  end
  object DSReport: TDataSource
    DataSet = ADOQReport
    Left = 568
    Top = 80
  end
  object ADOQReport2: TADOQuery
    Active = True
    Connection = ADOConnection1
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'SELECT * FROM penarikan')
    Left = 496
    Top = 152
  end
  object DSReport2: TDataSource
    DataSet = ADOQReport2
    Left = 576
    Top = 144
  end
  object ADOQuery1: TADOQuery
    Connection = ADOConnection1
    Parameters = <>
    Left = 448
    Top = 208
  end
  object JmlSiswa: TADOQuery
    Active = True
    Connection = ADOConnection1
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'SELECT * FROM dataSiswa')
    Left = 528
    Top = 208
  end
  object Kelas: TADOQuery
    Connection = ADOConnection1
    Parameters = <>
    Left = 584
    Top = 208
  end
  object Total: TADOQuery
    Active = True
    Connection = ADOConnection1
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'SELECT * FROM setoran')
    Left = 608
    Top = 16
  end
  object Grafik: TADOQuery
    Active = True
    Connection = ADOConnection1
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'SELECT * FROM penarikan')
    Left = 616
    Top = 104
  end
  object Grafik2: TADOQuery
    Active = True
    Connection = ADOConnection1
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'SELECT * FROM setoran')
    Left = 624
    Top = 192
  end
  object Total2: TADOQuery
    Active = True
    Connection = ADOConnection1
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'SELECT * FROM penarikan')
    Left = 632
    Top = 72
  end
end
