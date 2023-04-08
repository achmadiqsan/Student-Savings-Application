unit UCariDataSiswaPenarikan;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, StdCtrls, ExtCtrls;

type
  TFCariDataSiswaPenarikan = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    GroupBox1: TGroupBox;
    Edit1: TEdit;
    RadioButton1: TRadioButton;
    RadioButton2: TRadioButton;
    RadioButton3: TRadioButton;
    DBGrid1: TDBGrid;
    procedure FormCreate(Sender: TObject);
    procedure callfilter;
    procedure Panel2Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure uncallfilter;
    procedure Edit1Change(Sender: TObject);
    procedure tutup;
    procedure DBGrid1KeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FCariDataSiswaPenarikan: TFCariDataSiswaPenarikan;

implementation

uses
  UDataModule, UPenarikan;

{$R *.dfm}

procedure TFCariDataSiswaPenarikan.callfilter;
begin
  DM.ADOPeriodeTemp.Close;
  DM.ADOPeriodeTemp.Open;
  //
  DM.ADOQCariSiswaPenarikan.Close;
  DM.ADOQCariSiswaPenarikan.SQL.Clear;
  DM.ADOQCariSiswaPenarikan.SQL.Add('SELECT * FROM dataSiswa WHERE periode ="'+DM.ADOPeriodeTemp['periode']+'" AND keterangan="Siswa Aktif"');
  DM.ADOQCariSiswaPenarikan.Open;
end;

procedure TFCariDataSiswaPenarikan.FormCreate(Sender: TObject);
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

procedure TFCariDataSiswaPenarikan.Panel2Click(Sender: TObject);
begin
  tutup;
end;

procedure TFCariDataSiswaPenarikan.FormActivate(Sender: TObject);
begin
  callfilter;
end;

procedure TFCariDataSiswaPenarikan.uncallfilter;
begin
  //
  DM.ADOQCariSiswaSetoran.Close;
  DM.ADOQCariSiswaSetoran.SQL.Clear;
  DM.ADOQCariSiswaSetoran.SQL.Add('SELECT * FROM dataSiswa');
  DM.ADOQCariSiswaSetoran.Open;
end;


procedure TFCariDataSiswaPenarikan.Edit1Change(Sender: TObject);
begin
  if Edit1.Text ='' then
   begin
     Dm.ADOQCariSiswaPenarikan.Filtered := False;
   end
  else
  if RadioButton1.Checked then
     begin
       Dm.ADOQCariSiswaPenarikan.Filtered := False;
       Dm.ADOQCariSiswaPenarikan.Filter :='nisn= '+Quotedstr(Edit1.Text);
       Dm.ADOQCariSiswaPenarikan.Filtered := True;
     end
  else
  if RadioButton2.Checked then
     begin
       Dm.ADOQCariSiswaPenarikan.Filtered := False;
       Dm.ADOQCariSiswaPenarikan.Filter :='nama= '+Quotedstr(Edit1.Text);
       Dm.ADOQCariSiswaPenarikan.Filtered := True;
     end
  else
  if RadioButton3.Checked then
     begin
       Dm.ADOQCariSiswaPenarikan.Filtered := False;
       Dm.ADOQCariSiswaPenarikan.Filter :='kelas= '+Quotedstr(Edit1.Text);
       Dm.ADOQCariSiswaPenarikan.Filtered := True;
     end;
end;

procedure TFCariDataSiswaPenarikan.tutup;
begin
  Edit1.Clear;
  RadioButton1.Checked := False;
  RadioButton2.Checked := False;
  RadioButton3.Checked := False;
  uncallfilter;
  close;
end;

procedure TFCariDataSiswaPenarikan.DBGrid1KeyPress(Sender: TObject;
  var Key: Char);
begin
  if Key=#13 then
  begin
    //
    FPenarikan.edit2.text := Dm.ADOQCariSiswaSetoran['nisn'];
    FPenarikan.edit3.text := Dm.ADOQCariSiswaSetoran['nama'];
    FPenarikan.edit7.text := Dm.ADOQCariSiswaSetoran['kelas'];
    FPenarikan.edit9.text := Dm.ADOQCariSiswaSetoran['saldo_tabungan'];
    tutup;
  end;
end;

end.
