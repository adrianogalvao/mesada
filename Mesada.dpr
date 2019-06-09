program Mesada;

uses
  System.StartUpCopy,
  FMX.Forms,
  UFMenu in 'UFMenu.pas' {FMenu},
  UFrameMensagem in 'UFrameMensagem.pas' {FrameMensagem: TFrame},
  UFDialog in 'UFDialog.pas' {FDialog};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TFMenu, FMenu);
  Application.Run;
end.
