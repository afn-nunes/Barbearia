unit modConexao;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Stan.Param,
  FireDAC.DatS, FireDAC.DApt.Intf, FireDAC.DApt, FireDAC.Phys.PGDef,
  FireDAC.Phys.PG, Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client,
  Data.FMTBcd, Data.SqlExpr, Datasnap.Provider, Datasnap.DBClient, DBAccess, Uni,
  MemDS, UniProvider, PostgreSQLUniProvider;

type
  TdmConexao = class(TDataModule)
    conexao: TUniConnection;
    PostgreSQLUniProvider1: TPostgreSQLUniProvider;
    cdsPessoa: TClientDataSet;
    dspPessoa: TDataSetProvider;
    qryPessoa: TUniQuery;
    qryPessoaidPessoa: TIntegerField;
    qryPessoanomePessoa: TStringField;
    qryPessoatelefone: TStringField;
    qryPessoaemail: TStringField;
    qryPessoacaracteristica: TStringField;
    qryPessoatipoProduto: TStringField;
    qryPessoaaniversario: TDateField;
    cdsPessoaidPessoa: TIntegerField;
    cdsPessoanomePessoa: TStringField;
    cdsPessoatelefone: TStringField;
    cdsPessoaemail: TStringField;
    cdsPessoacaracteristica: TStringField;
    cdsPessoatipoProduto: TStringField;
    cdsPessoaaniversario: TDateField;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dmConexao: TdmConexao;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

end.
