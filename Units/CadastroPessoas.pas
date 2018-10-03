unit CadastroPessoas;

interface
uses
  modConexao,System.SysUtils;
type
  tPessoa = class
    private
      FIDPessoa: string;
      FCodigo : string;
      FNome : string;
      FTelefone : string;
      FEmail: string;
      FCaracteristica : string;
      FTpProduto : string;
      FDataNascimento : TDateTime;
    protected
      function GetCaracteristica: string;
      function GetEmail: string;
      function GetNome: string;
      function GetTelefone: string;
      function GetDataNascimento: TDateTime;
      function GetCodigo: string;
      procedure SetCodigo(const Value: string);
      procedure SetDataNascimento(const Value: TDateTime);
      procedure SetCaracteristica(const Value: string);
      procedure SetEmail(const Value: string);
      procedure SetNome(const Value: string);
      procedure SetTelefone(const Value: string);
      procedure SetID(const Value: string);
    public
      property codigo: string read GetCodigo write SetCodigo;
      property nome :string read GetNome write SetNome;
      property telefone : string read GetTelefone write SetTelefone;
      property email: string read GetEmail write SetEmail;
      property caracteristica : string read GetCaracteristica write SetCaracteristica;
      property tpProduto : string read GetCaracteristica write SetCaracteristica;
      property DataNascimento : TDateTime read GetDataNascimento write SetDataNascimento;
  end;
implementation

{ tPessoa }

function tPessoa.GetDataNascimento: TDateTime;
begin
  Result:= FDataNascimento;
end;

function tPessoa.GetCaracteristica: string;
begin
  result:= fCaracteristica;
end;

function tPessoa.GetCodigo: string;
begin
  result:= fCodigo;
end;

function tPessoa.GetEmail: string;
begin
  result:= fEmail;
end;

function tPessoa.GetNome: string;
begin
  result:= fNome;
end;

function tPessoa.GetTelefone: string;
begin
 result:= fTelefone;
end;

procedure tPessoa.SetDataNascimento(const Value: TDateTime);
begin
  FDataNascimento:= Value;
end;

procedure tPessoa.SetCaracteristica(const Value: string);
begin
  fCaracteristica:= Value;
end;

procedure tPessoa.SetCodigo(const Value: string);
begin
  fCodigo:= Value;
end;

procedure tPessoa.SetEmail(const Value: string);
begin
  fEmail:= Value;
end;

procedure tPessoa.SetID(const Value: string);
begin
  FIDPessoa:= Value;
end;

procedure tPessoa.SetNome(const Value: string);
begin
  fNome:= Value;
end;

procedure tPessoa.SetTelefone(const Value: string);
begin
  fTelefone:= Value;
end;

end.
