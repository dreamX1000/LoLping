program LoLping;

uses
  Vcl.Forms,
  frmMain in 'frmMain.pas' {formMain},
  Vcl.Themes,
  Vcl.Styles;

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.Title := 'League of Legends Ping Check';
  Application.CreateForm(TformMain, formMain);
  Application.Run;
end.
