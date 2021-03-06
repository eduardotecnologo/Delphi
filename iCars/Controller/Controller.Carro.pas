unit Controller.Carro;

interface

uses Horse,
      System.JSON,
      System.SysUtils,
      Controller.Comum;
      // DAO.Carro;

procedure RegistrarRotas;
procedure ListarCarros(Req: THorseRequest; Res: THorseResponse; Nxt: TProc);
procedure ListarCarrosId(Req: THorseRequest; Res: THorseResponse; Nxt: TProc);
procedure CadastrarCarro(Req: THorseRequest; Res: THorseResponse; Nxt: TProc);

implementation

procedure RegistrarRotas;
begin
    THorse.Get('/carros', ListarCarros);
    THorse.Get('/carros/:id_carro', ListarCarrosId);
    THorse.Post('/carros', CadastrarCarro);
end;

procedure ListarCarros(Req: THorseRequest; Res: THorseResponse; Nxt: TProc);
begin
    Res.Send('Listando os carros...').Status(200);
end;
procedure ListarCarrosId(Req: THorseRequest; Res: THorseResponse; Nxt: TProc);
begin
    Res.Send('Listando o detalhe de um carro...').Status(200);
end;
procedure CadastrarCarro(Req: THorseRequest; Res: THorseResponse; Nxt: TProc);
begin
    Res.Send('Cadastrando um carro...').Status(201);
end;

end.
