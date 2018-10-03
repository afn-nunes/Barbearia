unit CadastroProdutos;

interface
type
  TProduto = class
    private
      fCdProduto: string;
      fTpProduto: string;
      fDescricao: string;
      fObservacao: string;
      fFornecedor: string;
      fCaracteristica: string;
      fVlCusto: Double;
      fvlVenda: Double;
    protected
      function getCdProduto: string;
      function getFornecedor: string;
      procedure setCdProduto(const Value: string);
      procedure setFornecedor(const Value: string);
      function getCaracteristica: string;
      procedure setCaracteristica(const Value: string);
      function getTpProduto: string;
      procedure setTpProduto(const Value: string);
      function getDescricao: string;
      procedure setDescricao(const Value: string);
      function getObservacao: string;
      procedure setObservacao(const Value: string);
      function getvlCusto: Double;
      procedure setVlCusto(const Value: Double);
      function getvlVenda: Double;
      procedure setvlVenda(const Value: Double);
    public
      property cdProduto:string read getCdProduto write setCdProduto;
      property tpProduto:string read getTpProduto write setTpProduto;
      property descricao:string read getDescricao write setDescricao;
      property fornecedor:string read getFornecedor write setFornecedor;
      property observacaoo:string read getObservacao write setObservacao;
      property vlCusto: Double read getvlCusto write setVlCusto;
      property vlVenda: Double read getvlVenda write setvlVenda;
      property caracteristica:string read getCaracteristica write setCaracteristica;
  end;
implementation

{ TProduto }

function TProduto.getCaracteristica: string;
begin
result:= fCaracteristica;
end;

function TProduto.getCdProduto: string;
begin
result:= fCdProduto;
end;

function TProduto.getDescricao: string;
begin
  result:= fDescricao;
end;

function TProduto.getFornecedor: string;
begin
  result:= fFornecedor;
end;

function TProduto.getObservacao: string;
begin
  result:= fObservacao;
end;

function TProduto.getTpProduto: string;
begin
   result:= ftpProduto;
end;

function TProduto.getvlCusto: Double;
begin
   result:= fVlCusto;
end;

function TProduto.getvlVenda: Double;
begin
result:= fvlVenda;
end;

procedure TProduto.setCaracteristica(const Value: string);
begin
  fCaracteristica:= Value;
end;

procedure TProduto.setCdProduto(const Value: string);
begin
  fCdProduto:= Value;
end;

procedure TProduto.setDescricao(const Value: string);
begin
  fDescricao:= Value;
end;

procedure TProduto.setFornecedor(const Value: string);
begin
  fFornecedor:= Value;
end;

procedure TProduto.setObservacao(const Value: string);
begin
  fObservacao:= Value;
end;

procedure TProduto.setTpProduto(const Value: string);
begin
   fTpProduto:= value;
end;

procedure TProduto.setVlCusto(const Value: Double);
begin
  fVlCusto:= Value;
end;

procedure TProduto.setvlVenda(const Value: Double);
begin
  fvlVenda:= Value;
end;

end.
