unit USetoran;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, ComCtrls, StdCtrls, ExtCtrls, DateUtils;

type
  TFSetoran = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    Shape1: TShape;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Panel2: TPanel;
    Panel3: TPanel;
    Panel4: TPanel;
    Panel5: TPanel;
    GroupBox1: TGroupBox;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Edit1: TEdit;
    Edit2: TEdit;
    DateTimePicker1: TDateTimePicker;
    Edit3: TEdit;
    DBGrid1: TDBGrid;
    Edit4: TEdit;
    ComboBox4: TComboBox;
    Edit5: TEdit;
    Panel6: TPanel;
    Panel7: TPanel;
    Edit6: TEdit;
    Panel8: TPanel;
    Edit7: TEdit;
    Edit8: TEdit;
    Edit9: TEdit;
    Label12: TLabel;
    Edit10: TEdit;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Panel8Click(Sender: TObject);
    procedure Panel7Click(Sender: TObject);
    procedure DateTimePicker1Change(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure jmlhData;
    procedure Panel6Click(Sender: TObject);
    procedure Panel5Click(Sender: TObject);
    procedure Panel2Click(Sender: TObject);
    procedure bersih;
    procedure DBGrid1KeyPress(Sender: TObject; var Key: Char);
    procedure Edit8Change(Sender: TObject);
    procedure Edit8KeyPress(Sender: TObject; var Key: Char);
    procedure FormCreate(Sender: TObject);
    procedure Panel4Click(Sender: TObject);
    procedure Panel3Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FSetoran: TFSetoran;

implementation

uses UCariDataSiswaSetoran, UDataModule;

{$R *.dfm}

procedure TFSetoran.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Label14.Caption := '0';
  Label15.Caption := '0';
  Edit1.Clear;
  DateTimePicker1.Date := Now;
  Edit2.Clear;
  Edit3.Clear;
  Edit7.Clear;
  Edit8.Clear;
  Edit9.Clear;
  Edit10.Clear;
  Edit4.Clear;
  Edit6.Clear;
  ComboBox4.Text := '-- PILIH KRITERIA --';
  Edit5.Clear;
  Label13.Caption := 'Label13';
  //
  Dm.ADOSetoran.Close;
  Dm.ADOSetoran.Open;
  Dm.ADOSetoran.Filtered := false;
  //
  DM.ADODataSiswa.Filtered := False;
  DM.ADODataSiswa.Close;
  DM.ADODataSiswa.Open;
end;

procedure TFSetoran.Panel8Click(Sender: TObject);
begin
  FCariDataSiswaSetoran.show;
end;

procedure TFSetoran.Panel7Click(Sender: TObject);
var
  id : string;
begin
  // bersihkan form :
  bersih;
  // pengaturan button :
  Panel7.Enabled := True;  // new
  Panel2.Enabled := True; // add Data
  Panel3.Enabled := False; // delete data
  Panel4.Enabled := False; // update data
  Panel5.Enabled := True;  // reset form
  // coding untuk memilih kode dengan nomor yg paling terbesar :
  DM.KTS.Close;
  DM.KTS.SQL.Clear;
  DM.KTS.SQL.Add('SELECT TOP 1 setoran.kode_transakasi_setor FROM setoran');
  DM.KTS.SQL.Add('ORDER BY setoran.kode_transakasi_setor DESC');
  DM.KTS.Open;

  // coding untuk mengcopy nilai yang di seleksi :
  id := Copy(DM.KTS.Fields[0].AsString, 4, 7);

  // coding jika seleksi = 0 maka id = 00001 jika tdk maka tambah 1 :
  if id <> '' then id := FormatFLoat('0000000', StrtoInt(id) + 1)
  else id := '0000001';

  // coding melakukan pengabungan kode string dan integer :
  Edit1.Text := 'ST-' + id;
  // menghilangkan bug di reset form :
  Label14.Caption := '1';
  Label15.Caption := '0';
end;

procedure TFSetoran.DateTimePicker1Change(Sender: TObject);
var
  formattanggal : TDate;
  thn : Word;
begin
  formattanggal := DateTimePicker1.Date;
  thn := YearOf(formattanggal);
  Label13.Caption := IntToStr(thn);
end;

procedure TFSetoran.FormActivate(Sender: TObject);
begin
  DateTimePicker1.Date := Now;
  // call procedure
  jmlhData;
end;

procedure TFSetoran.jmlhData;
begin
  DM.ADOQJumlahData.Close;
  DM.ADOQJumlahData.SQL.Clear;
  DM.ADOQJumlahData.SQL.Add('SELECT COUNT(*) AS jml FROM setoran');
  DM.ADOQJumlahData.Open;
  // menampilkan data ke edit
  Edit4.Clear;
  Edit4.Text := DM.ADOQJumlahData['jml'];
end;

procedure TFSetoran.Panel6Click(Sender: TObject);
begin
if ComboBox4.Text ='-- PILIH KRITERIA --' then
   begin
     Dm.ADOSetoran.Close;
     Dm.ADOSetoran.Open;
     Dm.ADOSetoran.Filtered := false;
   end
Else
if ComboBox4.Text ='Nama Siswa' then
   begin
     Dm.ADOSetoran.Close;
     Dm.ADOSetoran.Open;
     Dm.ADOSetoran.Filtered := False;
     DM.ADOSetoran.Filter :='nama LIKE '+Quotedstr('%'+Edit5.Text+'%');
     Dm.ADOSetoran.Filtered := True;
     Edit4.Text := inttostr(Dm.ADOSetoran.RecordCount);
   end
else
if ComboBox4.Text ='Kelas' then
   begin
     Dm.ADOSetoran.Close;
     Dm.ADOSetoran.Open;
     Dm.ADOSetoran.Filtered := False;
     DM.ADOSetoran.Filter :='kelas LIKE '+Quotedstr('%'+Edit5.Text+'%');
     Dm.ADOSetoran.Filtered := True;
     Edit4.Text := inttostr(Dm.ADOSetoran.RecordCount);
   end;
end;

procedure TFSetoran.Panel5Click(Sender: TObject);
begin
  Dm.ADODataSiswa.Close;
  Dm.ADODataSiswa.Open;
  Dm.ADODataSiswa.Filtered := false;
  bersih;
end;

procedure TFSetoran.Panel2Click(Sender: TObject);
begin
  if Edit1.Text ='' then
    MessageDlg('Kode Transaksi Kosong',mtInformation,[mbok],0)
  else
  if Label13.Caption ='Label13' then
    MessageDlg('Silahkan Pilih Tanggal',mtInformation,[mbok],0)
  else
  if Edit2.Text ='' then
    MessageDlg('NISN Kosong',mtInformation,[mbok],0)
  else
  if Edit8.Text ='' then
    MessageDlg('Setoran Kosong',mtInformation,[mbok],0)
  else
    begin
      DM.ADOSetoran.Append;
      Dm.ADOSetoran['kode_transakasi_setor'] := edit1.Text;
      Dm.ADOSetoran['tgl'] := DateTimePicker1.Date;
      Dm.ADOSetoran['nisn'] := edit2.Text;
      Dm.ADOSetoran['nama'] := edit3.Text;
      Dm.ADOSetoran['kelas'] := edit7.Text;
      Dm.ADOSetoran['periode'] := Label13.Caption;
      Dm.ADOSetoran['setoran'] := edit8.Text;
      DM.ADOSetoran.Post;
      // manipulasi uang data siswa :
      DM.ADODataSiswa.Close;
      DM.ADODataSiswa.Open;
      DM.ADODataSiswa.Filtered := False;
      DM.ADODataSiswa.Filter :='nisn LIKE '+Quotedstr('%'+Edit2.Text+'%');
      DM.ADODataSiswa.Filtered := True;
      //
      DM.ADODataSiswa.Edit;
      DM.ADODataSiswa['saldo_tabungan'] := Edit10.Text;
      DM.ADODataSiswa.Post;
      //
      DM.ADODataSiswa.Filtered := False;
      DM.ADODataSiswa.Close;
      DM.ADODataSiswa.Open;
      // call procedure :
      bersih;
      // call procedure
      jmlhData;
    end;
end;

procedure TFSetoran.bersih;
begin
  Label14.Caption := '0';
  Label15.Caption := '0';
  Edit1.Clear;
  DateTimePicker1.Date := Now;
  Edit2.Clear;
  Edit3.Clear;
  Edit7.Clear;
  Edit8.Clear;
  Edit9.Clear;
  Edit10.Clear;
  Edit4.Clear;
  Edit6.Clear;
  ComboBox4.Text := '-- PILIH KRITERIA --';
  Edit5.Clear;
  Label13.Caption := 'Label13';
  //
  Dm.ADOSetoran.Close;
  Dm.ADOSetoran.Open;
  Dm.ADOSetoran.Filtered := false;
  // pengaturan button :
  Panel7.Enabled := True;  // new
  Panel2.Enabled := False; // add Data
  Panel3.Enabled := False; // delete data
  Panel4.Enabled := False; // update data
  Panel5.Enabled := True;  // reset form
  // call procedure
  jmlhData;
end;

procedure TFSetoran.DBGrid1KeyPress(Sender: TObject; var Key: Char);
begin
  if Key=#13 then
  begin
       if DM.ADOSetoran.IsEmpty then
        MessageDlg('Data Kosong',mtInformation,[mbok],0)
       else
       begin
          //
          Edit1.Text := DM.ADOSetoran['kode_transakasi_setor'];
          DateTimePicker1.Date := DM.ADOSetoran['tgl'];
          Edit2.Text := DM.ADOSetoran['nisn'];
          Edit3.Text := DM.ADOSetoran['nama'];
          Edit7.Text := DM.ADOSetoran['kelas'];
          Label13.Caption := DM.ADOSetoran['periode'];
          Edit8.Text := DM.ADOSetoran['setoran'];
          Edit6.Text := DM.ADOSetoran['setoran'];
          // manipulasi uang data siswa :
          DM.ADODataSiswa.Close;
          DM.ADODataSiswa.Open;
          DM.ADODataSiswa.Filtered := False;
          DM.ADODataSiswa.Filter :='nisn LIKE '+Quotedstr('%'+Edit2.Text+'%');
          DM.ADODataSiswa.Filtered := True;
          //
          Edit9.Text := DM.ADODataSiswa['saldo_tabungan'];
          Edit10.Text := DM.ADODataSiswa['saldo_tabungan'];
          // pengaturan button :
          Panel7.Enabled := False;  // new
          Panel2.Enabled := False; // add Data
          Panel3.Enabled := True; // delete data
          Panel4.Enabled := True; // update data
          Panel5.Enabled := True;  // reset form
          //
          Label15.Caption := '1';
       end;
  end;
end;

procedure TFSetoran.Edit8Change(Sender: TObject);
begin
  if Label14.Caption = '1' then
  begin
     if Edit8.Text = '' then
      begin
        //
        Edit10.Text := FloatToStr(StrToFloat(Edit9.Text) + 0);
      end
     else
      begin
        //
        Edit10.Text := FloatToStr(StrToFloat(Edit9.Text) + StrToFloat(Edit8.Text));
      end;
  end;
  //
  if Label15.Caption = '1' then
  begin
     if Edit8.Text = '' then
      begin
        //
        Edit10.Text := FloatToStr(StrToFloat(Edit9.Text) + 0 - StrToFloat(Edit6.Text));
      end
     else
      begin
        //
        Edit10.Text := FloatToStr(StrToFloat(Edit9.Text) + StrToFloat(Edit8.Text) - StrToFloat(Edit6.Text));
      end;
  end;
end;

procedure TFSetoran.Edit8KeyPress(Sender: TObject; var Key: Char);
begin
  if not (key in['0'..'9',#8]) then
   begin
     key:=#0;
     MessageDlg('Silahkan Masukkan Angka Tidak Boleh Huruf dan yang Lainnya !!!',mtInformation,[mbok],0);
   end;
end;

procedure TFSetoran.FormCreate(Sender: TObject);
begin
  // pengaturan button :
  Panel7.Enabled := True;  // new
  Panel2.Enabled := False; // add Data
  Panel3.Enabled := False; // delete data
  Panel4.Enabled := False; // update data
  Panel5.Enabled := True;  // reset form
end;

procedure TFSetoran.Panel4Click(Sender: TObject);
begin
  if Edit1.Text ='' then
    MessageDlg('Kode Transaksi Kosong',mtInformation,[mbok],0)
  else
  if Label13.Caption ='Label13' then
    MessageDlg('Silahkan Pilih Tanggal',mtInformation,[mbok],0)
  else
  if Edit2.Text ='' then
    MessageDlg('NISN Kosong',mtInformation,[mbok],0)
  else
  if Edit8.Text ='' then
    MessageDlg('Setoran Kosong',mtInformation,[mbok],0)
  else
    begin
      DM.ADOSetoran.Edit;
      Dm.ADOSetoran['kode_transakasi_setor'] := edit1.Text;
      Dm.ADOSetoran['tgl'] := DateTimePicker1.Date;
      Dm.ADOSetoran['nisn'] := edit2.Text;
      Dm.ADOSetoran['nama'] := edit3.Text;
      Dm.ADOSetoran['kelas'] := edit7.Text;
      Dm.ADOSetoran['periode'] := Label13.Caption;
      Dm.ADOSetoran['setoran'] := edit8.Text;
      DM.ADOSetoran.Post;
      // manipulasi uang data siswa :
      DM.ADODataSiswa.Close;
      DM.ADODataSiswa.Open;
      DM.ADODataSiswa.Filtered := False;
      DM.ADODataSiswa.Filter :='nisn LIKE '+Quotedstr('%'+Edit2.Text+'%');
      DM.ADODataSiswa.Filtered := True;
      //
      DM.ADODataSiswa.Edit;
      DM.ADODataSiswa['saldo_tabungan'] := Edit10.Text;
      DM.ADODataSiswa.Post;
      //
      DM.ADODataSiswa.Filtered := False;
      DM.ADODataSiswa.Close;
      DM.ADODataSiswa.Open;
      // call procedure :
      bersih;
      // call procedure
      jmlhData;
    end;
end;

procedure TFSetoran.Panel3Click(Sender: TObject);
begin
  if DM.ADOSetoran.IsEmpty then
     MessageDlg('Data Kosong',mtInformation,[mbok],0)
  else
  if Application.MessageBox('Yakin Hapus Data ???','Pesan',MB_YESNO or MB_ICONQUESTION)=MrYes then
     begin
      //
      if Edit8.Text = '' then
        begin
          DM.ADODataSiswa.Edit;
          DM.ADODataSiswa['saldo_tabungan'] := Edit10.Text;
          DM.ADODataSiswa.Post;
        end
      else
      if (Edit8.Text <> Edit6.Text) or (Edit8.Text = Edit6.Text)  then
        begin
          DM.ADODataSiswa.Edit;
          DM.ADODataSiswa['saldo_tabungan'] := FloatToStr(StrToFloat(Edit9.Text) - StrToFloat(Edit6.Text));
          DM.ADODataSiswa.Post;
        end;
      //
      DM.ADODataSiswa.Filtered := False;
      DM.ADODataSiswa.Close;
      DM.ADODataSiswa.Open;
      //
      Dm.ADOSetoran.Delete;
      // call procedure :
      bersih;
     end;
  // call procedure
  jmlhData;
end;

end.
