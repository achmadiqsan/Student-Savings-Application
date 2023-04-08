unit UDataModule;

interface

uses
  SysUtils, Classes, DB, ADODB;

type
  TDM = class(TDataModule)
    ADOConnection1: TADOConnection;
    ADOLogin: TADOTable;
    ADOPeriode: TADOTable;
    ADOTempPeriode: TADOTable;
    DSPeriode: TDataSource;
    DSLogin: TDataSource;
    ADODataSiswa: TADOTable;
    DSDataSiswa: TDataSource;
    ADODataSiswaid: TAutoIncField;
    ADODataSiswanisn: TWideStringField;
    ADODataSiswanama: TWideStringField;
    ADODataSiswakelas: TWideStringField;
    ADODataSiswajenis_kelamin: TWideStringField;
    ADODataSiswaketerangan: TWideStringField;
    ADODataSiswatgl_masuk: TDateTimeField;
    ADODataSiswaperiode: TWideStringField;
    ADODataSiswano_hp_ortu: TWideStringField;
    ADODataSiswasaldo_tabungan: TBCDField;
    ADOQJumlahData: TADOQuery;
    ADOQCariSiswaSetoran: TADOQuery;
    DSCariSiswaSetoran: TDataSource;
    ADOQCariSiswaSetoranid: TAutoIncField;
    ADOQCariSiswaSetorannisn: TWideStringField;
    ADOQCariSiswaSetorannama: TWideStringField;
    ADOQCariSiswaSetorankelas: TWideStringField;
    ADOQCariSiswaSetoranjenis_kelamin: TWideStringField;
    ADOQCariSiswaSetoranketerangan: TWideStringField;
    ADOQCariSiswaSetorantgl_masuk: TDateTimeField;
    ADOQCariSiswaSetoranperiode: TWideStringField;
    ADOQCariSiswaSetoranno_hp_ortu: TWideStringField;
    ADOQCariSiswaSetoransaldo_tabungan: TBCDField;
    ADOPeriodeTemp: TADOTable;
    ADOSetoran: TADOTable;
    DSSetoran: TDataSource;
    KTS: TADOQuery;
    ADOPenarikan: TADOTable;
    DSPenarikan: TDataSource;
    ADOSetoranid: TAutoIncField;
    ADOSetorankode_transakasi_setor: TWideStringField;
    ADOSetorantgl: TDateTimeField;
    ADOSetorannisn: TWideStringField;
    ADOSetorannama: TWideStringField;
    ADOSetorankelas: TWideStringField;
    ADOSetoranperiode: TWideStringField;
    ADOSetoransetoran: TBCDField;
    ADOPenarikanid: TAutoIncField;
    ADOPenarikankode_transaksi_tarik: TWideStringField;
    ADOPenarikantgl: TDateTimeField;
    ADOPenarikannisn: TWideStringField;
    ADOPenarikannama: TWideStringField;
    ADOPenarikankelas: TWideStringField;
    ADOPenarikanperiode: TWideStringField;
    ADOPenarikanpenarikan: TBCDField;
    ADOQCariSiswaPenarikan: TADOQuery;
    AutoIncField1: TAutoIncField;
    WideStringField1: TWideStringField;
    WideStringField2: TWideStringField;
    WideStringField3: TWideStringField;
    WideStringField4: TWideStringField;
    WideStringField5: TWideStringField;
    DateTimeField1: TDateTimeField;
    WideStringField6: TWideStringField;
    WideStringField7: TWideStringField;
    BCDField1: TBCDField;
    DSCariSiswaPenarikan: TDataSource;
    KTP: TADOQuery;
    ADOQConvert: TADOQuery;
    DSConvert: TDataSource;
    ADOQConvertid: TAutoIncField;
    ADOQConvertnisn: TWideStringField;
    ADOQConvertnama: TWideStringField;
    ADOQConvertkelas: TWideStringField;
    ADOQConvertjenis_kelamin: TWideStringField;
    ADOQConvertketerangan: TWideStringField;
    ADOQConverttgl_masuk: TDateTimeField;
    ADOQConvertperiode: TWideStringField;
    ADOQConvertno_hp_ortu: TWideStringField;
    ADOQConvertsaldo_tabungan: TBCDField;
    ADOQReport: TADOQuery;
    DSReport: TDataSource;
    ADOQReport2: TADOQuery;
    DSReport2: TDataSource;
    ADOQuery1: TADOQuery;
    JmlSiswa: TADOQuery;
    Kelas: TADOQuery;
    Total: TADOQuery;
    Grafik: TADOQuery;
    Grafik2: TADOQuery;
    Total2: TADOQuery;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DM: TDM;

implementation

{$R *.dfm}

end.
