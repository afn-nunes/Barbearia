program ConfiguraINI;

uses
  Forms,
  ConfigurarIni in 'ConfigurarIni.pas' {frmConfigurarINI},
  SelecaoDiretorio in 'SelecaoDiretorio.pas' {frmSelecionaDiretorio};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TfrmConfigurarINI, frmConfigurarINI);
  Application.CreateForm(TfrmSelecionaDiretorio, frmSelecionaDiretorio);
  Application.Run;
end.
