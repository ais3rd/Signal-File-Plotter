unit Unit1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, VclTee.TeeGDIPlus, VCLTee.TeEngine,
  Vcl.ExtCtrls, VCLTee.TeeProcs, VCLTee.Chart, VCLTee.Series;

type
  TForm1 = class(TForm)
    Button1: TButton;
    Chart1: TChart;
    Series1: TLineSeries;
    OpenDialog1: TOpenDialog;
    procedure Button1Click(Sender: TObject);

  private
  public
  end;

var
  Form1: TForm1;
  // file_name : variabel file teks untuk file data yang dibuka
  file_name: TextFile;
  // line : satu baris yang dibaca dari file
  line: string;
  // fs        : frekuensi sampling (Hz)
  // i         : indeks sampel n
  // comma_pos : posisi pemisah ';' di dalam baris
  fs, i, comma_pos: integer;
  // Data : nilai sampel sinyal x[n] (amplitudo)
  Data: array[0..5001] of double;

implementation

{$R *.dfm}

procedure TForm1.Button1Click(Sender: TObject);
begin
  i := 0;
  fs := 500;
  if OpenDialog1.Execute then
    begin
      assignfile(file_name, OpenDialog1.filename);
      reset(file_name);
      while not EOF(file_name) do
        begin
          readln(file_name, line);
          comma_pos := Pos(';', line);
          Data[i] := strtofloat (copy(line, comma_pos + 1, length(line)));
          // Konversi sampel ke waktu: t = n / fs
          // Untuk sumbu X dalam sampel: ganti i/fs menjadi i,
          // lalu ubah BottomAxis.Title.Caption menjadi 'Sample(s)'
          Series1.addxy(i/fs, Data[i]);
          i := i+1;
        end;
      closefile(file_name);
    end;
end;

end.
