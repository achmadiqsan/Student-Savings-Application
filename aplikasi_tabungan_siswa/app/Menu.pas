unit Menu;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, frxpngimage, ExtCtrls, StdCtrls, TeeProcs, TeEngine, Chart,
  Series, Menus;

type
  TFMenu = class(TForm)
    Panel1: TPanel;
    Shape1: TShape;
    Label1: TLabel;
    Image1: TImage;
    Image2: TImage;
    Shape2: TShape;
    Shape3: TShape;
    Shape4: TShape;
    Image3: TImage;
    Label2: TLabel;
    Shape5: TShape;
    Image4: TImage;
    Shape6: TShape;
    Image5: TImage;
    Label4: TLabel;
    Image6: TImage;
    Shape7: TShape;
    Image7: TImage;
    Label7: TLabel;
    Shape8: TShape;
    Shape9: TShape;
    Image8: TImage;
    Image9: TImage;
    Label8: TLabel;
    Label9: TLabel;
    Panel2: TPanel;
    Panel3: TPanel;
    Label10: TLabel;
    Label11: TLabel;
    Shape10: TShape;
    Image10: TImage;
    Label12: TLabel;
    Panel4: TPanel;
    Shape11: TShape;
    Image11: TImage;
    Label13: TLabel;
    Panel5: TPanel;
    Shape12: TShape;
    Image12: TImage;
    Label14: TLabel;
    Panel6: TPanel;
    Shape13: TShape;
    Image13: TImage;
    Label15: TLabel;
    Panel7: TPanel;
    Shape14: TShape;
    Image14: TImage;
    Label16: TLabel;
    Panel8: TPanel;
    Shape15: TShape;
    Image15: TImage;
    Label17: TLabel;
    Panel9: TPanel;
    Shape16: TShape;
    Label18: TLabel;
    Label19: TLabel;
    Label20: TLabel;
    Shape17: TShape;
    Image16: TImage;
    Label21: TLabel;
    Image17: TImage;
    Image18: TImage;
    Chart1: TChart;
    Chart2: TChart;
    Panel10: TPanel;
    Panel11: TPanel;
    Series1: TBarSeries;
    Series2: TBarSeries;
    MainMenu1: TMainMenu;
    D1: TMenuItem;
    DATASISWA1: TMenuItem;
    CONVERTDATA1: TMenuItem;
    RANSAKSI1: TMenuItem;
    SETORAN1: TMenuItem;
    PENARIKAN1: TMenuItem;
    REPORT1: TMenuItem;
    LAPORAN1: TMenuItem;
    EXIT1: TMenuItem;
    NO1: TMenuItem;
    YES1: TMenuItem;
    S1: TMenuItem;
    S2: TMenuItem;
    S3: TMenuItem;
    Panel12: TPanel;
    Panel13: TPanel;
    Panel14: TPanel;
    procedure S3Click(Sender: TObject);
    procedure exitApp;
    procedure YES1Click(Sender: TObject);
    procedure Image2Click(Sender: TObject);
    procedure S2Click(Sender: TObject);
    procedure Image1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure DATASISWA1Click(Sender: TObject);
    procedure CONVERTDATA1Click(Sender: TObject);
    procedure SETORAN1Click(Sender: TObject);
    procedure PENARIKAN1Click(Sender: TObject);
    procedure LAPORAN1Click(Sender: TObject);
    procedure buttonDataSiswa;
    procedure buttonSetoran;
    procedure buttonPenarikan;
    procedure buttonReport;
    procedure Image17Click(Sender: TObject);
    procedure Image4Click(Sender: TObject);
    procedure Image6Click(Sender: TObject);
    procedure Image8Click(Sender: TObject);
    procedure jumlahsiswaMale;
    procedure jumlahsiswaFemale;
    procedure FormActivate(Sender: TObject);
    procedure kelas1;
    procedure kelas2;
    procedure kelas3;
    procedure kelas4;
    procedure kelas5;
    procedure kelas6;
    procedure totalSetoran;
    procedure totalPenarikan;
    procedure grafikSetorKelas1;
    procedure grafikSetorKelas2;
    procedure grafikSetorKelas3;
    procedure grafikSetorKelas4;
    procedure grafikSetorKelas5;
    procedure grafikSetorKelas6;
    procedure grafikTarikKelas1;
    procedure grafikTarikKelas2;
    procedure grafikTarikKelas3;
    procedure grafikTarikKelas4;
    procedure grafikTarikKelas5;
    procedure grafikTarikKelas6;
    procedure grafik1;
    procedure grafik2;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FMenu: TFMenu;
  periodeTemp : string;
  TS,TP : Real;

implementation

uses ULogin, UPeriode, UDataModule, USettingUsers, UConvertKelas,
  UDataSiswa, USetoran, UPenarikan, UReport2;

{$R *.dfm}

procedure TFMenu.exitApp;
begin
  // membersihkan temp peridoe :
  DM.ADOTempPeriode.Edit;
  DM.ADOTempPeriode['periode'] := '-';
  DM.ADOTempPeriode.Post;
  // tutup menu dan show login kembali :
  FMenu.Close;
  FLogin.Show;
end;

procedure TFMenu.S3Click(Sender: TObject);
begin
  // tampilkan form periode :
  FPeriode.Show;
end;

procedure TFMenu.YES1Click(Sender: TObject);
begin
  // call procedure
  exitApp;
end;

procedure TFMenu.Image2Click(Sender: TObject);
begin
  // call procedure
  exitApp;
end;

procedure TFMenu.S2Click(Sender: TObject);
begin
  // tampilkan form users :
  FUser.show;
end;

procedure TFMenu.Image1Click(Sender: TObject);
begin
DM.ADOPeriodeTemp.Close;
DM.ADOPeriodeTemp.open;
    periodeTemp := DM.ADOPeriodeTemp['periode'];
  jumlahsiswaMale;
  Panel2.Caption := DM.JmlSiswa['MALE'];
  DM.JmlSiswa.Close;
  DM.JmlSiswa.Open;
  //
  jumlahsiswaFemale;
  Panel3.Caption := DM.JmlSiswa['FEMALE'];
      Chart1.Series[0].Clear;
    Chart2.Series[0].Clear;
  //
  kelas1;
  Panel4.Caption := DM.Kelas['KELAS_1'];
  //
  kelas2;
  Panel5.Caption := DM.Kelas['KELAS_2'];
  //
  kelas3;
  Panel6.Caption := DM.Kelas['KELAS_3'];
  //
  kelas4;
  Panel7.Caption := DM.Kelas['KELAS_4'];
  //
  kelas5;
  Panel8.Caption := DM.Kelas['KELAS_5'];
  //
  kelas6;
  Panel9.Caption := DM.Kelas['KELAS_6'];
//
//
  totalSetoran;
  TS := DM.Total['TS'];
  Panel13.Caption := 'Rp. ' + FormatFloat('#,#0;(#,#0);#,#0',TS);
  //Panel13.Caption := FloatToStr(TS);

  totalPenarikan;
  TP := DM.Total2['TP'];
  Panel14.Caption := 'Rp. ' +  FormatFloat('#,#0;(#,#0);#,#0',TP);
  //Panel14.Caption := FloatToStr(TP);
//
  Panel12.Caption := 'Rp. ' +  FormatFloat('#,#0;(#,#0);#,#0',TS - TP);
  //Panel12.Caption := FloatToStr(TS - TP);
//
  grafik1;
// //  GRAFIK 2 :
  grafik2;
  // show pesan berhasil refresh :
  MessageDlg('Data Berhasil Di Refresh',mtInformation,[mbok],0)
end;

procedure TFMenu.FormCreate(Sender: TObject);
// code untuk disable close button pada form :
var
  hSysMenu:HMENU;
begin
  hSysMenu:=GetSystemMenu(Self.Handle,False);
  if hSysMenu <> 0 then
  begin
    EnableMenuItem(hSysMenu,SC_CLOSE,MF_BYCOMMAND or MF_GRAYED);
    DrawMenuBar(Self.Handle);
  end;
end;

procedure TFMenu.DATASISWA1Click(Sender: TObject);
begin
  // call procedure
  buttonDataSiswa;
end;

procedure TFMenu.CONVERTDATA1Click(Sender: TObject);
begin
  // call procedure
  FConvertKelas.show;
end;

procedure TFMenu.SETORAN1Click(Sender: TObject);
begin
  // call procedure
  buttonSetoran;
end;

procedure TFMenu.PENARIKAN1Click(Sender: TObject);
begin
  // call procedure
  buttonPenarikan;
end;

procedure TFMenu.LAPORAN1Click(Sender: TObject);
begin
  // call procedure
  buttonReport;
end;

procedure TFMenu.buttonDataSiswa;
begin
// tampilkan form data siswa :
  FDataSiswa.show;
end;

procedure TFMenu.buttonSetoran;
begin
// tampilkan form setoran :
  FSetoran.show;
end;

procedure TFMenu.buttonPenarikan;
begin
// tampilkan form penarikan :
  FPenarikan.show;
end;

procedure TFMenu.buttonReport;
begin
// tampilkan form report :
  FReport2.show;
end;

procedure TFMenu.Image17Click(Sender: TObject);
begin
  // call procedure
  buttonReport;
end;

procedure TFMenu.Image4Click(Sender: TObject);
begin
  // call procedure
  buttonSetoran;
end;

procedure TFMenu.Image6Click(Sender: TObject);
begin
  // call procedure
  buttonPenarikan;
end;

procedure TFMenu.Image8Click(Sender: TObject);
begin
  // call procedure
  buttonDataSiswa;
end;

procedure TFMenu.jumlahsiswaFemale;
begin
//
//DM.ADOPeriodeTemp.Close;
//DM.ADOPeriodeTemp.open;
//  periodeTemp := DM.ADOPeriodeTemp['periode'];
  DM.JmlSiswa.Close;
  DM.JmlSiswa.SQL.Clear;
  DM.JmlSiswa.SQL.Add('SELECT COUNT(*) AS FEMALE FROM dataSiswa WHERE jenis_kelamin="Perempuan" ');
  DM.JmlSiswa.SQL.Add('AND keterangan = "Siswa Aktif" AND periode = "'+periodeTemp+'"');
  DM.JmlSiswa.Open;
end;

procedure TFMenu.jumlahsiswaMale;
begin
//
//DM.ADOPeriodeTemp.Close;
//DM.ADOPeriodeTemp.open;
//  periodeTemp := DM.ADOPeriodeTemp['periode'];
  DM.JmlSiswa.Close;
  DM.JmlSiswa.SQL.Clear;
  DM.JmlSiswa.SQL.Add('SELECT COUNT(*) AS MALE FROM dataSiswa WHERE jenis_kelamin="Laki - Laki" ');
  DM.JmlSiswa.SQL.Add('AND keterangan = "Siswa Aktif" AND periode = "'+periodeTemp+'"');
  DM.JmlSiswa.Open;
end;

procedure TFMenu.FormActivate(Sender: TObject);
begin
DM.ADOPeriodeTemp.Close;
DM.ADOPeriodeTemp.open;
    periodeTemp := DM.ADOPeriodeTemp['periode'];
  jumlahsiswaMale;
  Panel2.Caption := DM.JmlSiswa['MALE'];
  DM.JmlSiswa.Close;
  DM.JmlSiswa.Open;
  //
  jumlahsiswaFemale;
  Panel3.Caption := DM.JmlSiswa['FEMALE'];
      Chart1.Series[0].Clear;
    Chart2.Series[0].Clear;
  //
  kelas1;
  Panel4.Caption := DM.Kelas['KELAS_1'];
  //
  kelas2;
  Panel5.Caption := DM.Kelas['KELAS_2'];
  //
  kelas3;
  Panel6.Caption := DM.Kelas['KELAS_3'];
  //
  kelas4;
  Panel7.Caption := DM.Kelas['KELAS_4'];
  //
  kelas5;
  Panel8.Caption := DM.Kelas['KELAS_5'];
  //
  kelas6;
  Panel9.Caption := DM.Kelas['KELAS_6'];
//
//
  totalSetoran;
  TS := DM.Total['TS'];
  Panel13.Caption := 'Rp. ' + FormatFloat('#,#0;(#,#0);#,#0',TS);
  //Panel13.Caption := FloatToStr(TS);

  totalPenarikan;
  TP := DM.Total2['TP'];
  Panel14.Caption := 'Rp. ' +  FormatFloat('#,#0;(#,#0);#,#0',TP);
  //Panel14.Caption := FloatToStr(TP);
//
  Panel12.Caption := 'Rp. ' +  FormatFloat('#,#0;(#,#0);#,#0',TS - TP);
  //Panel12.Caption := FloatToStr(TS - TP);
//
  grafik1;
// //  GRAFIK 2 :
  grafik2;
end;

procedure TFMenu.kelas1;
begin
//
  //periodeTemp := DM.ADOPeriodeTemp['periode'];
  DM.Kelas.Close;
  DM.Kelas.SQL.Clear;
  DM.Kelas.SQL.Add('SELECT COUNT(*) AS KELAS_1 FROM dataSiswa WHERE kelas="Kelas 1" ');
  DM.Kelas.SQL.Add('AND keterangan = "Siswa Aktif" AND periode = "'+periodeTemp+'"');
  DM.Kelas.Open;
end;

procedure TFMenu.kelas2;
begin
 //
  // periodeTemp := DM.ADOPeriodeTemp['periode'];
  DM.Kelas.Close;
  DM.Kelas.SQL.Clear;
  DM.Kelas.SQL.Add('SELECT COUNT(*) AS KELAS_2 FROM dataSiswa WHERE kelas="Kelas 2" ');
  DM.Kelas.SQL.Add('AND keterangan = "Siswa Aktif" AND periode = "'+periodeTemp+'"');
  DM.Kelas.Open;
end;

procedure TFMenu.kelas3;
begin
//
  //periodeTemp := DM.ADOPeriodeTemp['periode'];
  DM.Kelas.Close;
  DM.Kelas.SQL.Clear;
  DM.Kelas.SQL.Add('SELECT COUNT(*) AS KELAS_3 FROM dataSiswa WHERE kelas="Kelas 3" ');
  DM.Kelas.SQL.Add('AND keterangan = "Siswa Aktif" AND periode = "'+periodeTemp+'"');
  DM.Kelas.Open;
end;

procedure TFMenu.kelas4;
begin
//
  //periodeTemp := DM.ADOPeriodeTemp['periode'];
  DM.Kelas.Close;
  DM.Kelas.SQL.Clear;
  DM.Kelas.SQL.Add('SELECT COUNT(*) AS KELAS_4 FROM dataSiswa WHERE kelas="Kelas 4" ');
  DM.Kelas.SQL.Add('AND keterangan = "Siswa Aktif" AND periode = "'+periodeTemp+'"');
  DM.Kelas.Open;
end;

procedure TFMenu.kelas5;
begin
 //
  // periodeTemp := DM.ADOPeriodeTemp['periode'];
  DM.Kelas.Close;
  DM.Kelas.SQL.Clear;
  DM.Kelas.SQL.Add('SELECT COUNT(*) AS KELAS_5 FROM dataSiswa WHERE kelas="Kelas 5" ');
  DM.Kelas.SQL.Add('AND keterangan = "Siswa Aktif" AND periode = "'+periodeTemp+'"');
  DM.Kelas.Open;
end;

procedure TFMenu.kelas6;
begin
//
  //periodeTemp := DM.ADOPeriodeTemp['periode'];
  DM.Kelas.Close;
  DM.Kelas.SQL.Clear;
  DM.Kelas.SQL.Add('SELECT COUNT(*) AS KELAS_6 FROM dataSiswa WHERE kelas="Kelas 6" ');
  DM.Kelas.SQL.Add('AND keterangan = "Siswa Aktif" AND periode = "'+periodeTemp+'"');
  DM.Kelas.Open;
end;

procedure TFMenu.totalPenarikan;
begin
//
  //periodeTemp := DM.ADOPeriodeTemp['periode'];
  DM.Total2.Close;
  DM.Total2.SQL.Clear;
  DM.Total2.SQL.Add('SELECT SUM(penarikan) AS TP FROM penarikan WHERE periode = "'+periodeTemp+'" ');
  DM.Total2.Open;
end;

procedure TFMenu.totalSetoran;
begin
//
  //periodeTemp := DM.ADOPeriodeTemp['periode'];
  DM.Total.Close;
  DM.Total.SQL.Clear;
  DM.Total.SQL.Add('SELECT SUM(setoran) AS TS FROM setoran WHERE periode = "'+periodeTemp+'" ');
  DM.Total.Open;
end;

procedure TFMenu.grafikSetorKelas1;
begin
//
  //periodeTemp := DM.ADOPeriodeTemp['periode'];
  DM.Grafik2.Close;
  DM.Grafik2.SQL.Clear;
  DM.Grafik2.SQL.Add('SELECT SUM(setoran) AS KELAS_1 FROM setoran WHERE kelas="Kelas 1" ');
  DM.Grafik2.SQL.Add('AND periode = "'+periodeTemp+'"');
  DM.Grafik2.Open;
end;

procedure TFMenu.grafikSetorKelas2;
begin
//
  //periodeTemp := DM.ADOPeriodeTemp['periode'];
  DM.Grafik2.Close;
  DM.Grafik2.SQL.Clear;
  DM.Grafik2.SQL.Add('SELECT SUM(setoran) AS KELAS_2 FROM setoran WHERE kelas="Kelas 2" ');
  DM.Grafik2.SQL.Add('AND periode = "'+periodeTemp+'"');
  DM.Grafik2.Open;
end;

procedure TFMenu.grafikSetorKelas3;
begin
//
 // periodeTemp := DM.ADOPeriodeTemp['periode'];
  DM.Grafik2.Close;
  DM.Grafik2.SQL.Clear;
  DM.Grafik2.SQL.Add('SELECT SUM(setoran) AS KELAS_3 FROM setoran WHERE kelas="Kelas 3" ');
  DM.Grafik2.SQL.Add('AND periode = "'+periodeTemp+'"');
  DM.Grafik2.Open;
end;

procedure TFMenu.grafikSetorKelas4;
begin
//
 // periodeTemp := DM.ADOPeriodeTemp['periode'];
  DM.Grafik2.Close;
  DM.Grafik2.SQL.Clear;
  DM.Grafik2.SQL.Add('SELECT SUM(setoran) AS KELAS_4 FROM setoran WHERE kelas="Kelas 4" ');
  DM.Grafik2.SQL.Add('AND periode = "'+periodeTemp+'"');
  DM.Grafik2.Open;
end;

procedure TFMenu.grafikSetorKelas5;
begin
//
  //periodeTemp := DM.ADOPeriodeTemp['periode'];
  DM.Grafik2.Close;
  DM.Grafik2.SQL.Clear;
  DM.Grafik2.SQL.Add('SELECT SUM(setoran) AS KELAS_5 FROM setoran WHERE kelas="Kelas 5" ');
  DM.Grafik2.SQL.Add('AND periode = "'+periodeTemp+'"');
  DM.Grafik2.Open;
end;

procedure TFMenu.grafikSetorKelas6;
begin
//
  //periodeTemp := DM.ADOPeriodeTemp['periode'];
  DM.Grafik2.Close;
  DM.Grafik2.SQL.Clear;
  DM.Grafik2.SQL.Add('SELECT SUM(setoran) AS KELAS_6 FROM setoran WHERE kelas="Kelas 6" ');
  DM.Grafik2.SQL.Add('AND periode = "'+periodeTemp+'"');
  DM.Grafik2.Open;
end;

procedure TFMenu.grafikTarikKelas1;
begin
//
  //periodeTemp := DM.ADOPeriodeTemp['periode'];
  DM.Grafik.Close;
  DM.Grafik.SQL.Clear;
  DM.Grafik.SQL.Add('SELECT SUM(penarikan) AS KELAS_P1 FROM penarikan WHERE kelas="Kelas 1" ');
  DM.Grafik.SQL.Add('AND periode = "'+periodeTemp+'"');
  DM.Grafik.Open;
end;

procedure TFMenu.grafikTarikKelas2;
begin
//
  //periodeTemp := DM.ADOPeriodeTemp['periode'];
  DM.Grafik.Close;
  DM.Grafik.SQL.Clear;
  DM.Grafik.SQL.Add('SELECT SUM(penarikan) AS KELAS_P2 FROM penarikan WHERE kelas="Kelas 2" ');
  DM.Grafik.SQL.Add('AND periode = "'+periodeTemp+'"');
  DM.Grafik.Open;
end;

procedure TFMenu.grafikTarikKelas3;
begin
//
  //periodeTemp := DM.ADOPeriodeTemp['periode'];
  DM.Grafik.Close;
  DM.Grafik.SQL.Clear;
  DM.Grafik.SQL.Add('SELECT SUM(penarikan) AS KELAS_P3 FROM penarikan WHERE kelas="Kelas 3" ');
  DM.Grafik.SQL.Add('AND periode = "'+periodeTemp+'"');
  DM.Grafik.Open;
end;

procedure TFMenu.grafikTarikKelas4;
begin
//
  //periodeTemp := DM.ADOPeriodeTemp['periode'];
  DM.Grafik.Close;
  DM.Grafik.SQL.Clear;
  DM.Grafik.SQL.Add('SELECT SUM(penarikan) AS KELAS_P4 FROM penarikan WHERE kelas="Kelas 4" ');
  DM.Grafik.SQL.Add('AND periode = "'+periodeTemp+'"');
  DM.Grafik.Open;
end;

procedure TFMenu.grafikTarikKelas5;
begin
//
  //periodeTemp := DM.ADOPeriodeTemp['periode'];
  DM.Grafik.Close;
  DM.Grafik.SQL.Clear;
  DM.Grafik.SQL.Add('SELECT SUM(penarikan) AS KELAS_P5 FROM penarikan WHERE kelas="Kelas 5" ');
  DM.Grafik.SQL.Add('AND periode = "'+periodeTemp+'"');
  DM.Grafik.Open;
end;

procedure TFMenu.grafikTarikKelas6;
begin
 //
  // periodeTemp := DM.ADOPeriodeTemp['periode'];
  DM.Grafik.Close;
  DM.Grafik.SQL.Clear;
  DM.Grafik.SQL.Add('SELECT SUM(penarikan) AS KELAS_P6 FROM penarikan WHERE kelas="Kelas 6" ');
  DM.Grafik.SQL.Add('AND periode = "'+periodeTemp+'"');
  DM.Grafik.Open;
end;

procedure TFMenu.grafik1;
begin
  //periodeTemp := DM.ADOPeriodeTemp['periode'];
//  Chart1.Series[0].Clear;

//  DM.Grafik2.Close;
//  DM.Grafik2.Open;
  
  grafikSetorKelas1;
    if DM.Grafik2['KELAS_1'] <> null then
  begin
    Chart1.Series[0].Add(DM.Grafik2['KELAS_1'],'Kelas 1');
  end
  else
  begin
    Chart1.Series[0].Add(StrToFloat('0'),'Kelas 1');
  end;
  //
  
  grafikSetorKelas2;
    if DM.Grafik2['KELAS_2'] <> null then
  begin
    Chart1.Series[0].Add(DM.Grafik2['KELAS_2'],'Kelas 2');
  end
  else
  begin
    Chart1.Series[0].Add(StrToFloat('0'),'Kelas 2');
  end;
//
  grafikSetorKelas3;
  if DM.Grafik2['KELAS_3'] <> null then
  begin
    Chart1.Series[0].Add(DM.Grafik2['KELAS_3'],'Kelas 3');
  end
  else
  begin
    Chart1.Series[0].Add(StrToFloat('0'),'Kelas 3');
  end;
//
  grafikSetorKelas4;
  if DM.Grafik2['KELAS_4'] <> null then
  begin
    Chart1.Series[0].Add(DM.Grafik2['KELAS_4'],'Kelas 4');
  end
  else
  begin
    Chart1.Series[0].Add(StrToFloat('0'),'Kelas 4');
  end;
//
  grafikSetorKelas5;
  if DM.Grafik2['KELAS_5'] <> null then
  begin
    Chart1.Series[0].Add(DM.Grafik2['KELAS_5'],'Kelas 5');
  end
  else
  begin
    Chart1.Series[0].Add(StrToFloat('0'),'Kelas 5');
  end;
//
  grafikSetorKelas6;
  if DM.Grafik2['KELAS_6'] <> null then
  begin
    Chart1.Series[0].Add(DM.Grafik2['KELAS_6'],'Kelas 6');
  end
  else
  begin
    Chart1.Series[0].Add(StrToFloat('0'),'Kelas 6');
  end;
end;

procedure TFMenu.grafik2;
begin
//
//periodeTemp := DM.ADOPeriodeTemp['periode'];
//    Chart2.Series[0].Clear;

//  DM.Grafik.Close;
//  DM.Grafik.Open;

  grafikTarikKelas1;
  if DM.Grafik['KELAS_P1'] <> null then
  begin
    Chart2.Series[0].Add(DM.Grafik['KELAS_P1'],'Kelas 1');
  end
  else
  begin
    Chart2.Series[0].Add(StrToFloat('0'),'Kelas 1');
  end;

  grafikTarikKelas2;
  if DM.Grafik['KELAS_P2'] <> null then
  begin
    Chart2.Series[0].Add(DM.Grafik['KELAS_P2'],'Kelas 2');
  end
  else
  begin
    Chart2.Series[0].Add(StrToFloat('0'),'Kelas 2');
  end;

  grafikTarikKelas3;
  if DM.Grafik['KELAS_P3'] <> null then
  begin
    Chart2.Series[0].Add(DM.Grafik['KELAS_P3'],'Kelas 3');
  end
  else
  begin
    Chart2.Series[0].Add(StrToFloat('0'),'Kelas 3');
  end;

  grafikTarikKelas4;
  if DM.Grafik['KELAS_P4'] <> null then
  begin
    Chart2.Series[0].Add(DM.Grafik['KELAS_P4'],'Kelas 4');
  end
  else
 begin
    Chart2.Series[0].Add(StrToFloat('0'),'Kelas 4');
 end;

  grafikTarikKelas5;
  if DM.Grafik['KELAS_P5'] <> null then
 begin
   Chart2.Series[0].Add(DM.Grafik['KELAS_P5'],'Kelas 5');
  end
  else
  begin
    Chart2.Series[0].Add(StrToFloat('0'),'Kelas 5');
  end;

  grafikTarikKelas6;
 if DM.Grafik['KELAS_P6'] <> null then
 begin
   Chart2.Series[0].Add(DM.Grafik['KELAS_P6'],'Kelas 6');
  end
  else
 begin
   Chart2.Series[0].Add(StrToFloat('0'),'Kelas 6');
 end;
end;

end.
