program ServerHorse;

uses
  System.StartUpCopy,
  FMX.Forms,
  UnitMain in 'UnitMain.pas' {FrmMain},
  Controller.Carro in 'Controller\Controller.Carro.pas',
  Controller.Comum in 'Controller\Controller.Comum.pas',
  DAO.Connection in 'DAO\DAO.Connection.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TFrmMain, FrmMain);
  Application.Run;
end.
