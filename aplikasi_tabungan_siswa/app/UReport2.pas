unit UReport2;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Grids, DBGrids, ComCtrls, ExtCtrls;

type
  TFReport2 = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    Shape1: TShape;
    Panel3: TPanel;
    GroupBox1: TGroupBox;
    Label2: TLabel;
    Label3: TLabel;
    Label5: TLabel;
    Label4: TLabel;
    Edit1: TEdit;
    Edit2: TEdit;
    DateTimePicker1: TDateTimePicker;
    DateTimePicker2: TDateTimePicker;
    Panel4: TPanel;
    Panel2: TPanel;
    RadioButton1: TRadioButton;
    RadioButton2: TRadioButton;
    DBGrid1: TDBGrid;
    DBGrid2: TDBGrid;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Panel2Click(Sender: TObject);
    procedure Panel4Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Panel3Click(Sender: TObject);
    procedure DateTimePicker1Change(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FReport2: TFReport2;

implementation

uses
  UDataModule, UCetakReport;

{$R *.dfm}

procedure TFReport2.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  RadioButton1.Checked := False;
  RadioButton2.Checked := False;
  DateTimePicker1.Date := Now;
  DateTimePicker2.Date := Now;
  Edit1.Clear;
  Edit2.Clear;
  DM.ADOQReport.Active := False;
  DBGrid1.Visible := True;
  DBGrid2.Visible := False;
end;

procedure TFReport2.Panel2Click(Sender: TObject);
begin
  if RadioButton1.Checked then
  begin
    DBGrid1.Visible := True;
    DBGrid2.Visible := False;
    Edit1.Clear;
    Edit2.Clear;
    DM.ADOQuery1.Close;
    DM.ADOQuery1.SQL.Clear;
    DM.ADOQuery1.SQL.Add('SELECT SUM(setoran) AS tot_nilai FROM setoran WHERE (CDATE(tgl) BETWEEN #'+FormatDateTime('d-mmm-yyyy', DateTimePicker1.Date)+'# AND #'+FormatDateTime('d-mmm-yyyy', DateTimePicker2.Date)+'#)');
    DM.ADOQuery1.Open;
    //Edit2.Text := DM.ADOQReport['tot_nilai'];
    if DM.ADOQuery1['tot_nilai'] <> null then
    begin
      Edit2.Text := 'Rp. ' + FormatFloat('#,#0.00;(#,#0.00);#,#0.00',StrToFloat(DM.ADOQuery1['tot_nilai']));
    end
    else
    begin
      Edit2.Text := 'Rp. ' + FormatFloat('#,#0.00;(#,#0.00);#,#0.00',0);
    end;
    //
    DM.ADOQReport.Close;
    DM.ADOQReport.SQL.Clear;
    DM.ADOQReport.SQL.Add('SELECT * FROM setoran WHERE (CDATE(tgl) BETWEEN #'+FormatDateTime('d-mmm-yyyy', DateTimePicker1.Date)+'# AND #'+FormatDateTime('d-mmm-yyyy', DateTimePicker2.Date)+'#)');
    DM.ADOQReport.Open;
    Edit1.Text := inttostr(Dm.ADOQReport.RecordCount);
  end
  else
  if RadioButton2.Checked then
  begin
    DBGrid2.Visible := True;
    DBGrid1.Visible := False;
    Edit1.Clear;
    Edit2.Clear;
    DM.ADOQuery1.Close;
    DM.ADOQuery1.SQL.Clear;
    DM.ADOQuery1.SQL.Add('SELECT SUM(penarikan) AS tot_nilai2 FROM penarikan WHERE (CDATE(tgl) BETWEEN #'+FormatDateTime('d-mmm-yyyy', DateTimePicker1.Date)+'# AND #'+FormatDateTime('d-mmm-yyyy', DateTimePicker2.Date)+'#)');
    DM.ADOQuery1.Open;
    //Edit2.Text := DM.ADOQReport['tot_nilai'];
    if DM.ADOQuery1['tot_nilai2'] <> null then
    begin
      Edit2.Text := 'Rp. ' + FormatFloat('#,#0.00;(#,#0.00);#,#0.00',StrToFloat(DM.ADOQuery1['tot_nilai2']));
    end
    else
    begin
      Edit2.Text := 'Rp. ' + FormatFloat('#,#0.00;(#,#0.00);#,#0.00',0);
    end;
    //
    DM.ADOQReport2.Close;
    DM.ADOQReport2.SQL.Clear;
    DM.ADOQReport2.SQL.Add('SELECT * FROM penarikan WHERE (CDATE(tgl) BETWEEN #'+FormatDateTime('d-mmm-yyyy', DateTimePicker1.Date)+'# AND #'+FormatDateTime('d-mmm-yyyy', DateTimePicker2.Date)+'#)');
    DM.ADOQReport2.Open;
    Edit1.Text := inttostr(Dm.ADOQReport2.RecordCount);
  end
end;

procedure TFReport2.Panel4Click(Sender: TObject);
begin
  RadioButton1.Checked := False;
  RadioButton2.Checked := False;
  DateTimePicker1.Date := Now;
  DateTimePicker2.Date := Now;
  Edit1.Clear;
  Edit2.Clear;
  DM.ADOQReport.Active := False;
  DBGrid1.Visible := True;
  DBGrid2.Visible := False;
end;

procedure TFReport2.FormCreate(Sender: TObject);
begin
  RadioButton1.Checked := False;
  RadioButton2.Checked := False;
  DateTimePicker1.Date := Now;
  DateTimePicker2.Date := Now;
  Edit1.Clear;
  Edit2.Clear;
  DM.ADOQReport.Active := False;
  DBGrid1.Visible := True;
  DBGrid2.Visible := False;
end;

procedure TFReport2.Panel3Click(Sender: TObject);
begin
  if RadioButton1.Checked then
  begin
    FCetakLaporan.QRLabel4.Caption := DM.ADOTempPeriode['periode'];
    FCetakLaporan.QRLabel27.Caption := 'Data From ' + DateToStr(DateTimePicker1.Date) + ' To ' + DateToStr(DateTimePicker2.Date);
    FCetakLaporan.QRLabel23.Caption := FormatDateTime('d mmmm yyyy', Now);
    FCetakLaporan.QuickRep1.Preview;
  end
  else
  if RadioButton2.Checked then
  begin
    FCetakLaporan.QRLabel14.Caption := DM.ADOTempPeriode['periode'];
    FCetakLaporan.QRLabel28.Caption := 'Data From ' + DateToStr(DateTimePicker1.Date) + ' To ' + DateToStr(DateTimePicker2.Date);
    FCetakLaporan.QRLabel25.Caption := FormatDateTime('d mmmm yyyy', Now);
    FCetakLaporan.QuickRep2.Preview;
  end;
end;

procedure TFReport2.DateTimePicker1Change(Sender: TObject);
begin
//Label5.Caption := FormatDateTime('d-mmm-yyyy', DateTimePicker1.Date);
end;

end.
