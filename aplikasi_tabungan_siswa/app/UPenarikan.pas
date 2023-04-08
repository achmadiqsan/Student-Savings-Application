unit UPenarikan;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Grids, DBGrids, ComCtrls, ExtCtrls, DateUtils;

type
  TFPenarikan = class(TForm)
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
    Label12: TLabel;
    Edit1: TEdit;
    Edit2: TEdit;
    DateTimePicker1: TDateTimePicker;
    Edit3: TEdit;
    Panel8: TPanel;
    Edit7: TEdit;
    Edit8: TEdit;
    Edit9: TEdit;
    Edit10: TEdit;
    DBGrid1: TDBGrid;
    Edit4: TEdit;
    ComboBox1: TComboBox;
    Edit5: TEdit;
    Panel6: TPanel;
    Panel7: TPanel;
    Edit6: TEdit;
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
  FPenarikan: TFPenarikan;

implementation

uses
  UDataModule, UCariDataSiswaPenarikan;

{$R *.dfm}

procedure TFPenarikan.FormClose(Sender: TObject; var Action: TCloseAction);
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
  ComboBox1.Text := '-- PILIH KRITERIA --';
  Edit5.Clear;
  Label13.Caption := 'Label13';
  //
  Dm.ADOPenarikan.Close;
  Dm.ADOPenarikan.Open;
  Dm.ADOPenarikan.Filtered := false;
  //
  DM.ADODataSiswa.Filtered := False;
  DM.ADODataSiswa.Close;
  DM.ADODataSiswa.Open;
end;

procedure TFPenarikan.Panel8Click(Sender: TObject);
begin
FCariDataSiswaPenarikan.show;
end;

procedure TFPenarikan.Panel7Click(Sender: TObject);
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
  DM.KTP.Close;
  DM.KTP.SQL.Clear;
  DM.KTP.SQL.Add('SELECT TOP 1 penarikan.kode_transaksi_tarik FROM penarikan');
  DM.KTP.SQL.Add('ORDER BY penarikan.kode_transaksi_tarik DESC');
  DM.KTP.Open;

  // coding untuk mengcopy nilai yang di seleksi :
  id := Copy(DM.KTP.Fields[0].AsString, 4, 7);

  // coding jika seleksi = 0 maka id = 00001 jika tdk maka tambah 1 :
  if id <> '' then id := FormatFLoat('0000000', StrtoInt(id) + 1)
  else id := '0000001';

  // coding melakukan pengabungan kode string dan integer :
  Edit1.Text := 'PN-' + id;
  // menghilangkan bug di reset form :
  Label14.Caption := '1';
  Label15.Caption := '0';
end;

procedure TFPenarikan.DateTimePicker1Change(Sender: TObject);
var
  formattanggal : TDate;
  thn : Word;
begin
  formattanggal := DateTimePicker1.Date;
  thn := YearOf(formattanggal);
  Label13.Caption := IntToStr(thn);
end;

procedure TFPenarikan.FormActivate(Sender: TObject);
begin
  DateTimePicker1.Date := Now;
  // call procedure
  jmlhData;
end;

procedure TFPenarikan.jmlhData;
begin
  DM.ADOQJumlahData.Close;
  DM.ADOQJumlahData.SQL.Clear;
  DM.ADOQJumlahData.SQL.Add('SELECT COUNT(*) AS jml FROM penarikan');
  DM.ADOQJumlahData.Open;
  // menampilkan data ke edit
  Edit4.Clear;
  Edit4.Text := DM.ADOQJumlahData['jml'];
end;

procedure TFPenarikan.Panel6Click(Sender: TObject);
begin
if ComboBox1.Text ='-- PILIH KRITERIA --' then
   begin
     Dm.ADOPenarikan.Close;
     Dm.ADOPenarikan.Open;
     Dm.ADOPenarikan.Filtered := false;
   end
Else
if ComboBox1.Text ='Nama Siswa' then
   begin
     Dm.ADOPenarikan.Close;
     Dm.ADOPenarikan.Open;
     Dm.ADOPenarikan.Filtered := False;
     DM.ADOPenarikan.Filter :='nama LIKE '+Quotedstr('%'+Edit5.Text+'%');
     Dm.ADOPenarikan.Filtered := True;
     Edit4.Text := inttostr(Dm.ADOPenarikan.RecordCount);
   end
else
if ComboBox1.Text ='Kelas' then
   begin
     Dm.ADOPenarikan.Close;
     Dm.ADOPenarikan.Open;
     Dm.ADOPenarikan.Filtered := False;
     DM.ADOPenarikan.Filter :='kelas LIKE '+Quotedstr('%'+Edit5.Text+'%');
     Dm.ADOPenarikan.Filtered := True;
     Edit4.Text := inttostr(Dm.ADOPenarikan.RecordCount);
   end;
end;

procedure TFPenarikan.Panel5Click(Sender: TObject);
begin
  Dm.ADODataSiswa.Close;
  Dm.ADODataSiswa.Open;
  Dm.ADODataSiswa.Filtered := false;
  bersih;
end;

procedure TFPenarikan.Panel2Click(Sender: TObject);
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
      DM.ADOPenarikan.Append;
      Dm.ADOPenarikan['kode_transaksi_tarik'] := edit1.Text;
      Dm.ADOPenarikan['tgl'] := DateTimePicker1.Date;
      Dm.ADOPenarikan['nisn'] := edit2.Text;
      Dm.ADOPenarikan['nama'] := edit3.Text;
      Dm.ADOPenarikan['kelas'] := edit7.Text;
      Dm.ADOPenarikan['periode'] := Label13.Caption;
      Dm.ADOPenarikan['penarikan'] := edit8.Text;
      DM.ADOPenarikan.Post;
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

procedure TFPenarikan.bersih;
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
  ComboBox1.Text := '-- PILIH KRITERIA --';
  Edit5.Clear;
  Label13.Caption := 'Label13';
  //
  Dm.ADOPenarikan.Close;
  Dm.ADOPenarikan.Open;
  Dm.ADOPenarikan.Filtered := false;
  // pengaturan button :
  Panel7.Enabled := True;  // new
  Panel2.Enabled := False; // add Data
  Panel3.Enabled := False; // delete data
  Panel4.Enabled := False; // update data
  Panel5.Enabled := True;  // reset form
  // call procedure
  jmlhData;
end;

procedure TFPenarikan.DBGrid1KeyPress(Sender: TObject; var Key: Char);
begin
  if Key=#13 then
  begin
       if DM.ADOPenarikan.IsEmpty then
        MessageDlg('Data Kosong',mtInformation,[mbok],0)
       else
       begin
          //
          Edit1.Text := DM.ADOPenarikan['kode_transaksi_tarik'];
          DateTimePicker1.Date := DM.ADOPenarikan['tgl'];
          Edit2.Text := DM.ADOPenarikan['nisn'];
          Edit3.Text := DM.ADOPenarikan['nama'];
          Edit7.Text := DM.ADOPenarikan['kelas'];
          Label13.Caption := DM.ADOPenarikan['periode'];
          Edit8.Text := DM.ADOPenarikan['penarikan'];
          Edit6.Text := DM.ADOPenarikan['penarikan'];
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

procedure TFPenarikan.Edit8Change(Sender: TObject);
begin
  if Label14.Caption = '1' then
  begin
     if Edit8.Text = '' then
      begin
        //
        Edit10.Text := FloatToStr(StrToFloat(Edit9.Text) - 0);
      end
     else
      begin
        //
        Edit10.Text := FloatToStr(StrToFloat(Edit9.Text) - StrToFloat(Edit8.Text));
      end;
  end;
  //
  if Label15.Caption = '1' then
  begin
     if Edit8.Text = '' then
      begin
        //
        Edit10.Text := FloatToStr(StrToFloat(Edit9.Text) - 0 + StrToFloat(Edit6.Text));
      end
     else
      begin
        //
        Edit10.Text := FloatToStr(StrToFloat(Edit9.Text) - StrToFloat(Edit8.Text) + StrToFloat(Edit6.Text));
      end;
  end;
end;

procedure TFPenarikan.Edit8KeyPress(Sender: TObject; var Key: Char);
begin
  if not (key in['0'..'9',#8]) then
   begin
     key:=#0;
     MessageDlg('Silahkan Masukkan Angka Tidak Boleh Huruf dan yang Lainnya !!!',mtInformation,[mbok],0);
   end;
end;

procedure TFPenarikan.FormCreate(Sender: TObject);
begin
  // pengaturan button :
  Panel7.Enabled := True;  // new
  Panel2.Enabled := False; // add Data
  Panel3.Enabled := False; // delete data
  Panel4.Enabled := False; // update data
  Panel5.Enabled := True;  // reset form
end;

procedure TFPenarikan.Panel4Click(Sender: TObject);
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
    MessageDlg('Penarikan Kosong',mtInformation,[mbok],0)
  else
    begin
      DM.ADOPenarikan.Edit;
      Dm.ADOPenarikan['kode_transaksi_tarik'] := edit1.Text;
      Dm.ADOPenarikan['tgl'] := DateTimePicker1.Date;
      Dm.ADOPenarikan['nisn'] := edit2.Text;
      Dm.ADOPenarikan['nama'] := edit3.Text;
      Dm.ADOPenarikan['kelas'] := edit7.Text;
      Dm.ADOPenarikan['periode'] := Label13.Caption;
      Dm.ADOPenarikan['penarikan'] := edit8.Text;
      DM.ADOPenarikan.Post;
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

procedure TFPenarikan.Panel3Click(Sender: TObject);
begin
  if DM.ADOPenarikan.IsEmpty then
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
          DM.ADODataSiswa['saldo_tabungan'] := FloatToStr(StrToFloat(Edit9.Text) + StrToFloat(Edit6.Text));
          DM.ADODataSiswa.Post;
        end;
      //
      DM.ADODataSiswa.Filtered := False;
      DM.ADODataSiswa.Close;
      DM.ADODataSiswa.Open;
      //
      Dm.ADOPenarikan.Delete;
      // call procedure :
      bersih;
     end;
  // call procedure
  jmlhData;
end;

end.
