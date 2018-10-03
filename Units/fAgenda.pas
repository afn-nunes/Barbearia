unit fAgenda;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics,  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.StdCtrls, Vcl.ComCtrls,
  Vcl.Grids, Vcl.DBGrids, Datasnap.DBClient,dateutils, Vcl.Buttons,midaslib,
  System.IniFiles,  Vcl.ExtCtrls;

type
  TfrmAgenda = class(TForm)
    cdsAgenda: TClientDataSet;
    dsAgenda: TDataSource;
    DBGrid1: TDBGrid;
    cal: TMonthCalendar;
    edtData: TEdit;
    cdsAgendaData: TDateField;
    cdsAgendaDetalhes: TStringField;
    cdsAgendaHoraInicial: TStringField;
    cdsAgendaHoraFinal: TStringField;
    cbbHoraInicial: TComboBox;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    btnAgendar: TBitBtn;
    edtDetalhes: TEdit;
    edtNmAluno: TEdit;
    cbbHoraFinal: TComboBox;
    cbb1: TComboBox;
    img1: TImage;
    tmr1: TTimer;
    procedure calClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnAgendarClick(Sender: TObject);
    procedure btnAlterarAlunoClick(Sender: TObject);
    procedure cbb1Change(Sender: TObject);
    procedure DBGrid1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure dsAgendaDataChange(Sender: TObject; Field: TField);
    procedure btnSalvarClick(Sender: TObject);
    procedure btn1Click(Sender: TObject);
    procedure tmr1Timer(Sender: TObject);
  private
    procedure criarSubDiretorio;
    { Private declarations }
  public
    diretorio: string;
    procedure carregarAgenda;
    procedure PreenchegridVazio;
    procedure listarAlunos;
    procedure SalvarCadastro;
    procedure carregarAluno;
    procedure deletarAgendamento;
    function  jaExiste(Horario,data: string): Boolean;
    function ProximaSexta:TDateTime;
    procedure carregarParecer;
    { Public declarations }
  end;

var
  frmAgenda: TfrmAgenda;

implementation

{$R *.dfm}

uses CadastroDeClientes;

//procedure TfrmAgenda.btnAgendarClick(Sender: TObject);
//begin
//  SalvarCadastro;
//  carregarAgenda;
//end;
//
//procedure TfrmAgenda.btnAlterarAlunoClick(Sender: TObject);
//begin
//  listarAlunos;
//end;
//
//procedure TfrmAgenda.calClick(Sender: TObject);
//begin
//  edtData.Text:= FormatDateTime('dd/mm/yyy',(cal.Date));
//  edtDetalhes.Text:= '';
//  cbbHoraInicial.ItemIndex:= -1;
//  cbbHoraFinal.ItemIndex:= -1;
//  carregarAgenda;
//  carregarParecer;
//end;
//
//procedure TfrmAgenda.carregarAgenda;
//var
//  Hora,HoraArquivo,data: string;
//  linhas,colunas: TStringList;
//  i: Integer;
//begin
//  PreenchegridVazio;
////  if FileExists(diretorio+FrmCadastroPessoa.AlunoSelecionado+'.txt') then
//    begin
//      linhas:= TStringList.Create;
//      colunas:= TStringList.Create;
//      try
////        Linhas.LoadFromFile(diretorio+FrmCadastroPessoa.AlunoSelecionado+'.txt');
//        cdsAgenda.First;
//        while not cdsAgenda.eof do
//          begin
//            hora:= cdsAgendaHoraInicial.Text;
//              for i:= 0 to linhas.Count - 1 do
//              begin
//                colunas.Delimiter := '|';
//                colunas.DelimitedText := linhas[i];
//                data:= colunas.Strings[0];
//                HoraArquivo:= colunas.Strings[1];
//                if (HoraArquivo = hora) and (data = edtData.Text) then
//                  begin
//                  cdsAgenda.edit;
//                  cdsAgendaDetalhes.Text:= colunas.Strings[3];
//                  cdsagenda.post;
//                  end;
//              end;
//            cdsAgenda.Next;
//          end;
//      finally
//        linhas.Free;
//        colunas.Free;
//      end;
//    end
//end;
//
//procedure TfrmAgenda.deletarAgendamento;
//var
//  linhas,colunas: TStringList;
//  Arquivo: TIniFile;
//  data,horario:string;
//  i: Integer;
//begin
//      data:= edtData.Text;
//      horario:= cdsAgendaHoraInicial.Text;
//      linhas:= TStringList.Create;
//      colunas:= TStringList.Create;
//    try
//     if FileExists(diretorio+FrmCadastroPessoa.AlunoSelecionado+'.txt') then
//      begin
//       Linhas.LoadFromFile(diretorio+FrmCadastroPessoa.AlunoSelecionado+'.txt' );
//        for i:= 0 to linhas.Count - 1 do
//            begin
//              colunas.Delimiter := '|';
//              colunas.DelimitedText := linhas[i];
//              if (colunas.Strings[0] = data) and (colunas.Strings[1] = horario) then
//                begin
//                  linhas.Delete(i);
//                  linhas.SaveToFile(diretorio+frmCadastroPessoa.AlunoSelecionado+'.txt');
//                  carregarAgenda;
//                  Exit;
//                end;
//            end;
//      end;
//    finally
//        linhas.Free;
//        colunas.Free;
//    end;
//
//end;
//
//procedure TfrmAgenda.dsAgendaDataChange(Sender: TObject; Field: TField);
//begin
//mmo1.Lines.Text:= cdsAgendaDetalhes.ToString;
//end;
//
//procedure TfrmAgenda.carregarAluno;
//var
//  Lista: TStringList;
//  Alunos: TIniFile;
//  nmAluno: string;
//  i: Integer;
//begin
//  edtDetalhes.Text:= '';
//  cbbHoraInicial.ItemIndex:= -1;
//  cbbHoraFinal.ItemIndex:= -1;
//  Alunos:= TIniFile.Create(diretorio+'Alunos.ini');
//  lista:= TStringList.Create;
//  Alunos.ReadSections(Lista);
//  nmaluno:= cbb1.Items[cbb1.ItemIndex];
//  for I := 0 to Lista.Count - 1 do
//    if Alunos.readstring(Lista[i],'Nome','') = nmAluno then
//      begin
//      FrmCadastroPessoa.AlunoSelecionado:=Lista[i];
//      end;
//  edtNmAluno.Text:= nmAluno;
//  img1.Picture:= nil;
//  if FileExists(diretorio+'\imagens\'+ FrmCadastroPessoa.AlunoSelecionado+'.bmp') then
//    img1.Picture.LoadFromFile(diretorio+'\imagens\'+ FrmCadastroPessoa.AlunoSelecionado+'.bmp');
//  carregarAgenda;
//end;
//
//procedure TfrmAgenda.carregarParecer;
//var
//  data,diretorioParecer:string;
//begin
//  mmo1.Clear;
//  mmo2.Clear;
//
//  data:= FormatDateTime('dd-mm-yyyy',(cal.Date));
//  diretorioParecer:= diretorio+'Pareceres\';
//  if FileExists(diretorioParecer+FrmCadastroPessoa.AlunoSelecionado+'\'+data+'.txt') then
//    begin
//       mmo1.lines.LoadFromFile(diretorioParecer+FrmCadastroPessoa.AlunoSelecionado+'\'+data+'.txt');
//    end;
//  data:= FormatDateTime('dd-mm-yyyy',(proximasexta));
//  if FileExists(diretorioParecer+'Gerencia\'+data+'.txt') then
//    begin
//       mmo2.lines.LoadFromFile(diretorioParecer+'Gerencia\'+data+'.txt');
//    end;
//
//end;
//
//procedure TfrmAgenda.cbb1Change(Sender: TObject);
//begin
//  carregarAluno;
//end;
//
//procedure TfrmAgenda.DBGrid1KeyDown(Sender: TObject; var Key: Word;
//  Shift: TShiftState);
//begin
//  if Key = VK_DELETE then
//    begin
//      deletarAgendamento;
//    end;
//end;
//
//procedure TfrmAgenda.FormCreate(Sender: TObject);
//begin
//  cal.Date:= Now;
//  cdsAgenda.CreateDataSet;
//  diretorio:= ExtractFilePath(Application.ExeName) +'arquivos\';
//  carregarAluno;
//  criarSubdiretorio;
//  lblProximoParecer.Caption:= FormatDateTime('DD/MM/YYYY',ProximaSexta);
//  tmr1.Enabled:= false;
//end;
//
//procedure TfrmAgenda.FormShow(Sender: TObject);
//begin
//  edtData.Text:= FormatDateTime('dd/mm/yyyy',now);
//  PreenchegridVazio;
//  carregarAgenda;
//  listarAlunos;
//  carregarParecer;
//end;
//
//function TfrmAgenda.jaExiste(Horario,data: string): Boolean;
//var
//  linhas,Colunas: TStringList;
//  i: Integer;
//begin
//    colunas := TStringList.Create();
//    linhas := TStringList.Create();
//    try
//     if FileExists(diretorio+FrmCadastroPessoa.AlunoSelecionado+'.txt') then
//      begin
//       Linhas.LoadFromFile(diretorio+FrmCadastroPessoa.AlunoSelecionado+'.txt' );
//        for i:= 0 to linhas.Count - 1 do
//        begin
//          colunas.Delimiter := '|';
//          colunas.DelimitedText := linhas[i];
//          if (colunas.Strings[0] = data) and (colunas.Strings[1] = horario) then
//            begin
//            result:= true;
//            Exit;
//            end;
//        end;
//      end;
//    finally
//      colunas.Free;
//      linhas.free;
//    end;
//end;
//
//procedure TfrmAgenda.SalvarCadastro;
//var
//  arq: TextFile; { declarando a variável "arq" do tipo arquivo texto }
//  nome: string;
//begin
//  if jaExiste(cbbHoraInicial.Items[cbbHoraInicial.ItemIndex],edtdata.Text) then
//    begin
//      Application.MessageBox('Já existe um agendamento em um dos horários informados, verifique','Aviso',MB_OK);
//      Exit;
//    end;
//  if strtotime(cbbHoraFinal.Text) <= strtotime(cbbHoraInicial.Text) then
//    begin
//      ShowMessage('A hora final informada é inferior a hora Inicial, Verifique');
//      Exit;
//    end;
//
//  nome:= FrmCadastroPessoa.AlunoSelecionado;
//  AssignFile(arq, diretorio+nome+'.txt');
//  try
//      Append(arq)
//  except
//    Rewrite(arq);
//  end;
//
//  cdsAgenda.Open;
//  cdsAgenda.First;
//  while not cdsagenda.Eof do
//    begin
//      if (cdsAgendaHoraInicial.Text >= cbbHoraInicial.Items[cbbHoraInicial.ItemIndex]) and
//         (cdsAgendaHoraFinal.Text <= cbbHoraFinal.Items[cbbHoraFinal.ItemIndex])
//      then
//        begin
//          cdsAgenda.edit;
//          cdsAgendaDetalhes.Text:= edtDetalhes.Text;
//          Writeln(arq, '"'+edtData.text+'"','|',cdsAgendaHoraInicial.AsString, '|',cdsAgendaHoraFinal.AsString, '|','"'+cdsAgendaDetalhes.AsString+'"');
//          cdsagenda.post;
//        end;
//      cdsagenda.next;
//    end;
//  CloseFile(arq);
//  edtDetalhes.Text:= '';
//  cbbHoraInicial.ItemIndex:= -1;
//  cbbHoraFinal.ItemIndex:= -1;
//end;
//
//procedure TfrmAgenda.tmr1Timer(Sender: TObject);
//begin
//  lblProximoParecer.Visible:= not(lblProximoParecer.Visible);
//end;
//
//procedure TfrmAgenda.PreenchegridVazio;// Preenche o Form com as datas vazias
//var
//   horaInicial,horaFinal,hora: TTime;
//   Alunos: TIniFile;
//begin
//  cdsAgenda.EmptyDataSet;
//  cdsAgenda.Open;
//  alunos:= TIniFile.Create(diretorio +'Alunos.ini');
//  try
//    edtNmAluno.Text:= Alunos.ReadString(FrmCadastroPessoa.AlunoSelecionado,'Nome','');
//    HoraInicial:= StrToTime('08:00:00');
//    HoraFinal:= StrToTime('18:00:00');
//    hora:= horainicial;
//    cdsAgenda.Open;
//    while hora <= HoraFinal do
//      begin
//        cdsAgenda.Insert;
//        cdsAgendaHoraInicial.asstring:= timetostr(hora);
//        cbbHoraInicial.Items.Add(timetostr(hora));
//        hora:= hora + StrToTime('00:'+ IntToStr(15)+':00');
//        cbbHoraFinal.Items.Add(timetostr(hora));
//        cdsAgendaHoraFinal.asstring:= timetostr(hora);
//        cdsagenda.Post;
//      end;
//    cdsagenda.First;
//  finally
//  Alunos.Free;
//  end;
//end;
//
//procedure TfrmAgenda.listarAlunos;
//var
//  ini: TIniFile;
//  lista: TStringList;
//  i,j: Integer;
//begin
//  ini:= TIniFile.Create(ExtractFilePath(Application.ExeName)+ 'Arquivos\Alunos.ini');
//  lista:= TStringList.Create;
//  ini.ReadSections(lista);
//  try
//  for I := 0 to lista.Count - 1 do
//    begin
//        cbb1.Items.Add(ini.readstring(lista[i],'Nome',''));
//    end;
//  for j := 0 to cbb1.Items.Count -1 do
//    if cbb1.Items[j] = edtNmAluno.Text then
//      begin
//        cbb1.ItemIndex:= cbb1.items.IndexOf(edtNmAluno.Text);
//        Exit;
//      end;
//  finally
//    ini.Free;
//    lista.Free;
//  end;
//end;
//function TfrmAgenda.ProximaSexta:TDateTime;
//var
//  data: TDateTime;
//begin
//  data:= now;
//  result:= data;
//  while DayOfTheWeek(data) <> 5 do
//    begin
//    data:= data +1;
//    result:= data;
//    end;
//end;
//
//procedure TfrmAgenda.criarSubDiretorio;
//var
//  lista:tstringlist;
//  arquivo:TIniFile;
//  i: integer;
//begin
//  arquivo:= tinifile.Create(diretorio+'Alunos.ini');
//  lista:= TStringList.Create;
//  arquivo.ReadSections(lista);
//  try
//   for i:= 0 to lista.Count - 1 do
//    begin
//      if not directoryexists(diretorio+'Pareceres\'+lista[i]) then
//        CreateDir(diretorio+'Pareceres\'+lista[i]);
//    end;
//    if not directoryexists(diretorio+'Pareceres\Gerencia\') then
//      CreateDir(diretorio+'Pareceres\Gerencia\');
//  finally
//   arquivo.Free;
//   lista.Free;
//  end;
//end;

end.
