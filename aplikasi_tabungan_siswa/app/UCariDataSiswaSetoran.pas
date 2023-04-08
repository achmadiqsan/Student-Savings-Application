unit UCariDataSiswaSetoran;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Grids, DBGrids, ExtCtrls;

type
  TFCariDataSiswaSetoran = class(TForm)
    Panel1: TPanel;
    Panel3: TPanel;
    Panel5: TPanel;
    GroupBox1: TGroupBox;
    Edit1: TEdit;
    RadioButton1: TRadioButton;
    RadioButton2: TRadioButton;
    RadioButton3: TRadioButton;
    DBGrid1: TDBGrid;
    procedure FormCreate(Sender: TObject);
    procedure Panel3Click(Sender: TObject);
    procedure callfilter;
    procedure FormActivate(Sender: TObject);
    procedure uncallfilter;
    procedure Edit1Change(Sender: TObject);
    procedure DBGrid1KeyPress(Sender: TObject; var Key: Char);
    procedure tutup;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FCariDataSiswaSetoran: TFCariDataSiswaSetoran;

implementation

uses
  UDataModule, USetoran;

{$R *.dfm}

procedure TFCariDataSiswaSetoran.callfilter;
begin
  DM.ADOPeriodeTemp.Close;
  DM.ADOPeriodeTemp.Open;
  //
  DM.ADOQCariSiswaSetoran.Close;
  DM.ADOQCariSiswaSetoran.SQL.Clear;
  DM.ADOQCariSiswaSetoran.SQL.Add('SELECT * FROM dataSiswa WHERE periode ="'+DM.ADOPeriodeTemp['periode']+'" AND keterangan="Siswa Aktif"');
  DM.ADOQCariSiswaSetoran.Open;
end;

procedure TFCariDataSiswaSetoran.FormCreate(Sender: TObject);
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

procedure TFCariDataSiswaSetoran.Panel3Click(Sender: TObject);
begin
  tutup;
end;

procedure TFCariDataSiswaSetoran.FormActivate(Sender: TObject);
begin
  callfilter;
end;

procedure TFCariDataSiswaSetoran.uncallfilter;
begin
  //
  DM.ADOQCariSiswaSetoran.Close;
  DM.ADOQCariSiswaSetoran.SQL.Clear;
  DM.ADOQCariSiswaSetoran.SQL.Add('SELECT * FROM dataSiswa');
  DM.ADOQCariSiswaSetoran.Open;
end;

procedure TFCariDataSiswaSetoran.Edit1Change(Sender: TObject);
begin
  if Edit1.Text ='' then
   begin
     Dm.ADOQCariSiswaSetoran.Filtered := False;
   end
  else
  if RadioButton1.Checked then
     begin
       Dm.ADOQCariSiswaSetoran.Filtered := False;
       Dm.ADOQCariSiswaSetoran.Filter :='nisn= '+Quotedstr(Edit1.Text);
       Dm.ADOQCariSiswaSetoran.Filtered := True;
     end
  else
  if RadioButton2.Checked then
     begin
       Dm.ADOQCariSiswaSetoran.Filtered := False;
       Dm.ADOQCariSiswaSetoran.Filter :='nama= '+Quotedstr(Edit1.Text);
       Dm.ADOQCariSiswaSetoran.Filtered := True;
     end
  else
  if RadioButton3.Checked then
     begin
       Dm.ADOQCariSiswaSetoran.Filtered := False;
       Dm.ADOQCariSiswaSetoran.Filter :='kelas= '+Quotedstr(Edit1.Text);
       Dm.ADOQCariSiswaSetoran.Filtered := True;
     end;
end;

procedure TFCariDataSiswaSetoran.DBGrid1KeyPress(Sender: TObject;
  var Key: Char);
begin
  if Key=#13 then
  begin
    //
    FSetoran.edit2.text := Dm.ADOQCariSiswaSetoran['nisn'];
    FSetoran.edit3.text := Dm.ADOQCariSiswaSetoran['nama'];
    FSetoran.edit7.text := Dm.ADOQCariSiswaSetoran['kelas'];
    FSetoran.edit9.text := Dm.ADOQCariSiswaSetoran['saldo_tabungan'];
    tutup;
  end;
end;

procedure TFCariDataSiswaSetoran.tutup;
begin
  Edit1.Clear;
  RadioButton1.Checked := False;
  RadioButton2.Checked := False;
  RadioButton3.Checked := False;
  uncallfilter;
  close;
end;

end.
