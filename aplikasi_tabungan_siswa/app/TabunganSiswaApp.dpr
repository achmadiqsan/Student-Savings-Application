program TabunganSiswaApp;

uses
  Forms,
  Menu in 'Menu.pas' {FMenu},
  UDataSiswa in 'UDataSiswa.pas' {FDataSiswa},
  USetoran in 'USetoran.pas' {FSetoran},
  UPenarikan in 'UPenarikan.pas' {FPenarikan},
  UConvertKelas in 'UConvertKelas.pas' {FConvertKelas},
  UReport2 in 'UReport2.pas' {FReport2},
  UCetakReport in 'UCetakReport.pas' {FCetakLaporan},
  ULogin in 'ULogin.pas' {FLogin},
  UDataModule in 'UDataModule.pas' {DM: TDataModule},
  UPeriode in 'UPeriode.pas' {FPeriode},
  USettingUsers in 'USettingUsers.pas' {FUser},
  UCariDataSiswaSetoran in 'UCariDataSiswaSetoran.pas' {FCariDataSiswaSetoran},
  UCariDataSiswaPenarikan in 'UCariDataSiswaPenarikan.pas' {FCariDataSiswaPenarikan};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TDM, DM);
  Application.CreateForm(TFLogin, FLogin);
  Application.CreateForm(TFMenu, FMenu);
  Application.CreateForm(TFDataSiswa, FDataSiswa);
  Application.CreateForm(TFSetoran, FSetoran);
  Application.CreateForm(TFPenarikan, FPenarikan);
  Application.CreateForm(TFConvertKelas, FConvertKelas);
  Application.CreateForm(TFCetakLaporan, FCetakLaporan);
  Application.CreateForm(TFPeriode, FPeriode);
  Application.CreateForm(TFReport2, FReport2);
  Application.CreateForm(TFUser, FUser);
  Application.CreateForm(TFCariDataSiswaSetoran, FCariDataSiswaSetoran);
  Application.CreateForm(TFCariDataSiswaPenarikan, FCariDataSiswaPenarikan);
  Application.Run;
end.
