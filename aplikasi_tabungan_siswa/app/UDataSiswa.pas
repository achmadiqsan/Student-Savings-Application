unit UDataSiswa;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, ComCtrls, Grids, DBGrids, DateUtils;

type
  TFDataSiswa = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    Panel2: TPanel;
    Shape1: TShape;
    Panel3: TPanel;
    Panel4: TPanel;
    Panel5: TPanel;
    GroupBox1: TGroupBox;
    Edit1: TEdit;
    Label2: TLabel;
    Label3: TLabel;
    Edit2: TEdit;
    Label4: TLabel;
    ComboBox1: TComboBox;
    Label5: TLabel;
    ComboBox2: TComboBox;
    Label6: TLabel;
    ComboBox3: TComboBox;
    Label7: TLabel;
    DateTimePicker1: TDateTimePicker;
    Label8: TLabel;
    Edit3: TEdit;
    DBGrid1: TDBGrid;
    Label9: TLabel;
    Edit4: TEdit;
    Label10: TLabel;
    ComboBox4: TComboBox;
    Label11: TLabel;
    Edit5: TEdit;
    Panel6: TPanel;
    Edit6: TEdit;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure DateTimePicker1Change(Sender: TObject);
    procedure Panel2Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure jmlhData;
    procedure Panel4Click(Sender: TObject);
    procedure Panel3Click(Sender: TObject);
    procedure Panel6Click(Sender: TObject);
    procedure Panel5Click(Sender: TObject);
    procedure berish;
    procedure DBGrid1KeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FDataSiswa: TFDataSiswa;

implementation

uses
  UDataModule;

{$R *.dfm}

procedure TFDataSiswa.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Edit1.Clear;
  Edit2.Clear;
  ComboBox1.Text := '-- PILIH KELAS --';
  ComboBox2.Text := '-- PILIH JENIS KELAMIN --';
  ComboBox3.Text := '-- PILIH KETERANGAN SISWA --';
  DateTimePicker1.Date := Now;
  Edit3.Clear;
  Edit4.Clear;
  ComboBox4.Text := '-- PILIH KRITERIA --';
  Edit5.Clear;
  Edit6.Clear;
end;

procedure TFDataSiswa.DateTimePicker1Change(Sender: TObject);
var
  formattanggal : TDate;
  thn : Word;
begin
  formattanggal := DateTimePicker1.Date;
  thn := YearOf(formattanggal);
  Edit6.Text := IntToStr(thn);
end;

procedure TFDataSiswa.Panel2Click(Sender: TObject);
begin
   if Edit1.Text ='' then
    MessageDlg('NISN Kosong',mtInformation,[mbok],0)
   else
   if Edit2.Text ='' then
    MessageDlg('Nama Siswa Kosong',mtInformation,[mbok],0)
   else
   if Edit3.Text ='' then
    MessageDlg('No. HP Orang Tua Kosong',mtInformation,[mbok],0)
   else
   if Edit6.Text ='' then
    MessageDlg('Silahkan Pilih Tanggal Masuk',mtInformation,[mbok],0)
   else
   if ComboBox1.Text ='-- PILIH KELAS --' then
    MessageDlg('Silahkan Pilih Kelas',mtInformation,[mbok],0)
   else
   if ComboBox2.Text ='-- PILIH JENIS KELAMIN --' then
    MessageDlg('Silahkan Pilih Jenis Kelamin',mtInformation,[mbok],0)
   else
   if ComboBox3.Text ='-- PILIH KETERANGAN SISWA --' then
    MessageDlg('Silahkan Pilih Keterangan Siswa',mtInformation,[mbok],0)
   else
   if Dm.ADODataSiswa.Locate('nisn',Edit1.Text,[]) then
    MessageDlg('NISN Telah Ada',mtInformation,[mbok],0)
   else
    begin
      Dm.ADODataSiswa.Append;
      Dm.ADODataSiswa['nisn'] := edit1.Text;
      Dm.ADODataSiswa['nama'] := edit2.Text;
      Dm.ADODataSiswa['kelas'] := ComboBox1.Text;
      Dm.ADODataSiswa['jenis_kelamin'] := ComboBox2.Text;
      Dm.ADODataSiswa['keterangan'] := ComboBox3.Text;
      Dm.ADODataSiswa['tgl_masuk'] := DateTimePicker1.Date;
      Dm.ADODataSiswa['periode'] := edit6.Text;
      Dm.ADODataSiswa['no_hp_ortu'] := edit3.Text;
      Dm.ADODataSiswa['saldo_tabungan'] := '0';
      DM.ADODataSiswa.Post;
      Edit1.Clear;
      Edit2.Clear;
      Edit3.Clear;
      Edit6.Clear;
      DateTimePicker1.Date := Now;
      ComboBox1.Text :='-- PILIH KELAS --';
      ComboBox2.Text :='-- PILIH JENIS KELAMIN --';
      ComboBox3.Text :='-- PILIH KETERANGAN SISWA --';
    end;
    // call procedure
    jmlhData;
end;

procedure TFDataSiswa.FormActivate(Sender: TObject);
begin
  // menggunakan filter biasa karena lebih mudah dan data sedikit
  // asusmsi untuk data banyak dan skala besar harus menggunaakn Ado Query
  // dengan filter SQL tapi harus merubah bayak coding DM sampai ke form
  // karena terikat satu sama lain
  Dm.ADODataSiswa.Close;
  Dm.ADODataSiswa.Open;
  Dm.ADODataSiswa.Filtered := False;
  DM.ADODataSiswa.Filter :='periode LIKE '+Quotedstr('%'+DM.ADOTempPeriode['periode']+'%');
  Dm.ADODataSiswa.Filtered := True;
  //
  DateTimePicker1.Date := Now;
  // call procedure
  jmlhData;
end;

procedure TFDataSiswa.jmlhData;
begin
  DM.ADOQJumlahData.Close;
  DM.ADOQJumlahData.SQL.Clear;
  DM.ADOQJumlahData.SQL.Add('SELECT COUNT(*) AS jml FROM dataSiswa');
  DM.ADOQJumlahData.Open;
  // menampilkan data ke edit
  Edit4.Clear;
  Edit4.Text := DM.ADOQJumlahData['jml'];
end;

procedure TFDataSiswa.Panel4Click(Sender: TObject);
begin
   if Edit1.Text ='' then
    MessageDlg('NISN Kosong',mtInformation,[mbok],0)
   else
   if Edit2.Text ='' then
    MessageDlg('Nama Siswa Kosong',mtInformation,[mbok],0)
   else
   if Edit3.Text ='' then
    MessageDlg('No. HP Orang Tua Kosong',mtInformation,[mbok],0)
   else
   if Edit6.Text ='' then
    MessageDlg('Silahkan Pilih Tanggal Masuk',mtInformation,[mbok],0)
   else
   if ComboBox1.Text ='-- PILIH KELAS --' then
    MessageDlg('Silahkan Pilih Kelas',mtInformation,[mbok],0)
   else
   if ComboBox2.Text ='-- PILIH JENIS KELAMIN --' then
    MessageDlg('Silahkan Pilih Jenis Kelamin',mtInformation,[mbok],0)
   else
   if ComboBox3.Text ='-- PILIH KETERANGAN SISWA --' then
    MessageDlg('Silahkan Pilih Keterangan Siswa',mtInformation,[mbok],0)
   else
    begin
      Dm.ADODataSiswa.Edit;
      Dm.ADODataSiswa['nisn'] := edit1.Text;
      Dm.ADODataSiswa['nama'] := edit2.Text;
      Dm.ADODataSiswa['kelas'] := ComboBox1.Text;
      Dm.ADODataSiswa['jenis_kelamin'] := ComboBox2.Text;
      Dm.ADODataSiswa['keterangan'] := ComboBox3.Text;
      Dm.ADODataSiswa['tgl_masuk'] := DateTimePicker1.Date;
      Dm.ADODataSiswa['periode'] := edit6.Text;
      Dm.ADODataSiswa['no_hp_ortu'] := edit3.Text;
      DM.ADODataSiswa.Post;
      Edit1.Clear;
      Edit2.Clear;
      Edit3.Clear;
      Edit6.Clear;
      DateTimePicker1.Date := Now;
      ComboBox1.Text :='-- PILIH KELAS --';
      ComboBox2.Text :='-- PILIH JENIS KELAMIN --';
      ComboBox3.Text :='-- PILIH KETERANGAN SISWA --';
    end;
    // call procedure
    jmlhData;
end;

procedure TFDataSiswa.Panel3Click(Sender: TObject);
begin
  if DM.ADODataSiswa.IsEmpty then
     MessageDlg('Data Kosong',mtInformation,[mbok],0)
  else
  if Application.MessageBox('Yakin Hapus Data ???','Pesan',MB_YESNO or MB_ICONQUESTION)=MrYes then
     begin
      Dm.ADODataSiswa.Delete;
      Edit1.Clear;
      Edit2.Clear;
      Edit3.Clear;
      Edit6.Clear;
      DateTimePicker1.Date := Now;
      ComboBox1.Text :='-- PILIH KELAS --';
      ComboBox2.Text :='-- PILIH JENIS KELAMIN --';
      ComboBox3.Text :='-- PILIH KETERANGAN SISWA --';
     end;
  // call procedure
  jmlhData;
end;

procedure TFDataSiswa.Panel6Click(Sender: TObject);
begin
if Edit5.Text = '' then
  begin
    MessageDlg('Data Perncarian Tidak Boleh Kosong',mtInformation,[mbok],0)
  end
else
if ComboBox4.Text ='-- PILIH KRITERIA --' then
   begin
     Dm.ADODataSiswa.Close;
     Dm.ADODataSiswa.Open;
     Dm.ADODataSiswa.Filtered := false;
   end
Else
if ComboBox4.Text ='Nama Siswa' then
   begin
     Dm.ADODataSiswa.Close;
     Dm.ADODataSiswa.Open;
     Dm.ADODataSiswa.Filtered := False;
     DM.ADODataSiswa.Filter :='nama LIKE '+Quotedstr('%'+Edit5.Text+'%')+'And periode = '+Quotedstr(DM.ADOPeriodeTemp['periode']);
     Dm.ADODataSiswa.Filtered := True;
     Edit4.Text := inttostr(Dm.ADODataSiswa.RecordCount);
   end
else
if ComboBox4.Text ='Kelas' then
   begin
     Dm.ADODataSiswa.Close;
     Dm.ADODataSiswa.Open;
     Dm.ADODataSiswa.Filtered := False;
     DM.ADODataSiswa.Filter :='kelas LIKE '+Quotedstr('%'+Edit5.Text+'%')+'And periode LIKE '+Quotedstr(DM.ADOPeriodeTemp['periode']);
     Dm.ADODataSiswa.Filtered := True;
     Edit4.Text := inttostr(Dm.ADODataSiswa.RecordCount);
   end;
end;

procedure TFDataSiswa.Panel5Click(Sender: TObject);
begin
  Dm.ADODataSiswa.Close;
  Dm.ADODataSiswa.Open;
  Dm.ADODataSiswa.Filtered := false;
  berish;
end;

procedure TFDataSiswa.berish;
begin
  Edit1.Clear;
  Edit2.Clear;
  ComboBox1.Text := '-- PILIH KELAS --';
  ComboBox2.Text := '-- PILIH JENIS KELAMIN --';
  ComboBox3.Text := '-- PILIH KETERANGAN SISWA --';
  DateTimePicker1.Date := Now;
  Edit3.Clear;
  Edit4.Clear;
  ComboBox4.Text := '-- PILIH KRITERIA --';
  Edit5.Clear;
  Edit6.Clear;
  // call procedure
  jmlhData;
end;

procedure TFDataSiswa.DBGrid1KeyPress(Sender: TObject; var Key: Char);
begin
  if Key=#13 then
  begin
       if DM.ADODataSiswa.IsEmpty then
        MessageDlg('Data Kosong',mtInformation,[mbok],0)
       else
       begin
          edit1.Text := Dm.ADODataSiswa['nisn'];
          edit2.Text := Dm.ADODataSiswa['nama'];
          ComboBox1.Text := Dm.ADODataSiswa['kelas'];
          ComboBox2.Text := Dm.ADODataSiswa['jenis_kelamin'];
          ComboBox3.Text := Dm.ADODataSiswa['keterangan'];
          DateTimePicker1.Date := Dm.ADODataSiswa['tgl_masuk'];
          edit3.Text := Dm.ADODataSiswa['no_hp_ortu'];
       end;
  end;
end;

end.
