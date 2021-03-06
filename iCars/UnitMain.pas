unit UnitMain;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.Memo.Types,
  FMX.Controls.Presentation, FMX.ScrollBox, FMX.Memo;

type
  TFrmMain = class(TForm)
    memo: TMemo;
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmMain: TFrmMain;

implementation

{$R *.fmx}
uses Horse,
     Horse.CORS,
     Horse.Jhonson,
     Horse.BasicAuthentication,
     Horse.Compression,
     Controller.Carro;
procedure TFrmMain.FormShow(Sender: TObject);
begin
  THorse.Use(Compression());
  THorse.Use(Jhonson());
  THorse.Use(CORS);

  THorse.Use(HorseBasicAuthentication(
    function(const AUsername, APassword: string): Boolean
    begin
      // Here inside you can access your database and validate if username and password are valid
      Result := AUsername.Equals('root') and APassword.Equals('secret');
    end));

    // Controlador

    // Registro das Rotas
    Controller.Carro.RegistrarRotas;

    THorse.Listen(8082, procedure(Horse: THorse)
    begin
      Memo.lines.Add('Servidor executando na porta : ' + Horse.Port.ToString)
    end);
end;

end.
