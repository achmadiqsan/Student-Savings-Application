unit UConvertKelas;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Grids, DBGrids, ExtCtrls;

type
  TFConvertKelas = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    Panel4: TPanel;
    GroupBox1: TGroupBox;
    Label2: TLabel;
    Label4: TLabel;
    Edit1: TEdit;
    ComboBox2: TComboBox;
    GroupBox2: TGroupBox;
    Label1: TLabel;
    Label3: TLabel;
    Label5: TLabel;
    Edit2: TEdit;
    ComboBox1: TComboBox;
    ComboBox3: TComboBox;
    DBGrid1: TDBGrid;
    GroupBox3: TGroupBox;
    Edit3: TEdit;
    RadioButton1: TRadioButton;
    RadioButton2: TRadioButton;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure bersih;
    procedure Panel2Click(Sender: TObject);
    procedure Panel3Click(Sender: TObject);
    procedure pilih;
    procedure Edit3Change(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FConvertKelas: TFConvertKelas;

implementation

uses
  UDataModule;

{$R *.dfm}

procedure TFConvertKelas.bersih;
begin
  Edit1.Clear;
  Edit2.Clear;
  Edit3.Clear;
  ComboBox2.Text := '-- PILIH KELAS --';
  ComboBox1.Text := '-- PILIH KELAS --';
  ComboBox3.Text := '-- PILIH STATUS --';
  RadioButton1.Checked := False;
  RadioButton2.Checked := False;
end;

procedure TFConvertKelas.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Edit1.Clear;
  Edit2.Clear;
  Edit3.Clear;
  ComboBox2.Text := '-- PILIH KELAS --';
  ComboBox1.Text := '-- PILIH KELAS --';
  ComboBox3.Text := '-- PILIH STATUS --';
  RadioButton1.Checked := False;
  RadioButton2.Checked := False;
end;

procedure TFConvertKelas.Panel2Click(Sender: TObject);
begin
  DM.ADOQConvert.Close;
  DM.ADOQConvert.SQL.Clear;
  DM.ADOQConvert.SQL.Add('SELECT * FROM dataSiswa WHERE periode= "'+Edit1.Text+'" AND kelas = "'+ComboBox2.Text+'"');
  DM.ADOQConvert.Open;
  MessageDlg('Pastikan Data Biaya SPP Pada Periode Berikutnya Telah Anda Setting Pada Form Data SPP,'
  + ' Serta Periode Pada Form Setting Periode Jika Belum Silahkan Anda Setting Karena Jika Belum Di Setting'
  + ' Akan Terjadi Error Ketika Melakukan Update Data Kelas Dan Periode... !!!',mtInformation,[mbok],0);
end;

procedure TFConvertKelas.Panel3Click(Sender: TObject);
  var
  k : integer;
begin
  if Edit2.Text = '' then
   MessageDlg('Data Kosong',mtInformation,[mbok],0)
  else
  if ComboBox1.Text = '-- PILIH KELAS --' then
   MessageDlg('Silahkan Pilih Data Kelas',mtInformation,[mbok],0)
  else
  if ComboBox3.Text = '-- PILIH STATUS --' then
   MessageDlg('Silahkan Pilih Data Status',mtInformation,[mbok],0)
  else
    begin
      for k := 1 to DM.ADOQConvert.RecordCount Do
      DM.ADOQConvert.First;
      while DM.ADOQConvert.Eof = False do
      begin
        DM.ADOQConvert.Edit;
        DM.ADOQConvert['kelas'] := ComboBox1.Text;
        DM.ADOQConvert['keterangan'] := ComboBox3.Text;
        DM.ADOQConvert['periode'] := Edit2.Text;
        DM.ADOQConvert.Post;
        DM.ADOQConvert.Next;
      end;
      bersih;
      Edit1.SetFocus;
      MessageDlg('Data Kelas Berhasil Di Update',mtInformation,[mbok],0);
    end;
  //
  pilih;
end;

procedure TFConvertKelas.pilih;
begin
  DM.ADOQConvert.Close;
  DM.ADOQConvert.SQL.Clear;
  DM.ADOQConvert.SQL.Add('SELECT * FROM dataSiswa');
  DM.ADOQConvert.Open;
end;

procedure TFConvertKelas.Edit3Change(Sender: TObject);
begin
  if Edit3.Text ='' then
   begin
     DM.ADOQConvert.Filtered := False;
   end
  else
  if RadioButton1.Checked then
     begin
       Dm.ADOQConvert.Filtered := False;
       Dm.ADOQConvert.Filter :='nisn= '+Quotedstr(Edit3.Text);
       Dm.ADOQConvert.Filtered := True;
     end
  else
  if RadioButton2.Checked then
     begin
       Dm.ADOQConvert.Filtered := False;
       Dm.ADOQConvert.Filter :='nama= '+Quotedstr(Edit3.Text);
       Dm.ADOQConvert.Filtered := True;
     end;
end;

end.
