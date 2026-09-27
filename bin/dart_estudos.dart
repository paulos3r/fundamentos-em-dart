import 'cliente.dart';
import 'pessoa.dart';

void main(){

  print ('Olá, Dart');

  final String nome = 'Paulo';
  int quantidade = 30;
  double preco = 30.2;
  bool ativo = true;
  const desconto = 0.1;
  String? email;
  double acrecimo=0.08;

  print('Nome: $nome');
  print('Quantidade: $quantidade');
  print('Preço: $preco');
  print('Ativo: $ativo');
  print('Desconto: $desconto');
  print('Acrecimo: $acrecimo');

  final subtotal = calcularSubtotal(preco, quantidade);
  final valorDesconto = calcularDesconto(subtotal, desconto);
  final total = calcularTotal(subtotal:subtotal, valorDesconto:valorDesconto);
  final aplicarAcrescimo = aplicarAcrecimo(preco: preco);

  print('Subtotal: $subtotal');
  print('Valor do desconto: $valorDesconto');
  print('Total:  $total');

  print('$email');
  String? telefone;
  print(telefone ?? 'Telefone não informado');
  String? cidade;
  print( cidade?.toUpperCase() ?? "Cidade não informada" );

  print(aplicarAcrescimo);


  final cliente = Cliente(nome: 'Sérgio', endereco: 'Goiás', idade: 20);

  print(cliente.nome);
  print(cliente.endereco);
  print(cliente.idade);
  print(cliente.ativo);

  cliente.nome = 'ricardo';

  print(cliente.nome);

  cliente.maiorDeIdade();
  /*polimorfismo*/
  print( cliente.descricao());
  /*Abistração*/
  final Pessoa pessoa = Cliente(nome: 'Sérgio', endereco: 'Goiás', idade: 20);

  print(pessoa.descricao());

  /*Listas, map, set */

  List<String> nomesF = [
    'Roberta',
    'Jaqueline',
    'Amanda'
  ];
  final nomesM = <String>[ /*Aplicação de inferência*/
    'Robert',
    'Wilson',
    'Darque'
  ];

  print('Nome Feminino 1: ${nomesF[0]}');

  nomesM.add('Pedro');


  for(final nome in nomesM){
    print(nome);
  }
  for(int i=0; i<nomesF.length;i++){
    print('Nome ${i+1} - ${nomesF[i]}');
  }
  /**/
  final nomesMaiorQue5 = nomesM.where((nome)=>nome.length>5);

  for(final nome in nomesMaiorQue5){
    print(nome);
  }

  final clientes = <Cliente> [
    Cliente(nome: 'Robert', endereco: 'Goiás', idade: 30, ativo:false),
    Cliente(nome: 'Wilson', endereco: 'Minas Gerais', idade: 20),
    Cliente(nome: 'Darque', endereco: 'São Paulo', idade: 15),
    Cliente(nome: 'Pedro', endereco: 'Pernanbuco', idade: 33)
  ];

  final clientesAtivos = clientes.where((cliente)=>cliente.ativo);
  print('**** ATIVOS ****');

  for(final cliente in clientesAtivos){
    print('Cliente: ${cliente.nome} Ativo ${cliente.ativo}');
  }

  final idadeDeCliente = clientes.map((cliente)=> cliente.idade).toList();

  print(idadeDeCliente);

  final clientesAtivosAcimaDe18Anos = clientes
      .where(
          (cliente)=> cliente.ativo &&
                      cliente.maiorDeIdade()
      )
      .map((cliente)=>cliente.nome)
      .toList();

  print(clientesAtivosAcimaDe18Anos);

  final estados = <String>{ /*Trabalhando com Set valor unico*/
    'Goiás',
    'são Paulo',
    'goiás',
    'São paulo',
    'Goiás',
    'Goias',
    'Minas Gerais',
    'São Paulo',
    'são Paulo',
  };

  print(estados);

  final clienteMap = <String,dynamic> {
    'nome' : 'Paulo',
    'estado' : 'Góias',
    'idade' : 20,
    'ativo' : true,
    'numeros' : [
      {'numero':'999999999'},
      {'numero':'888888888'}
    ],
  };

  print(clienteMap['nome']);
  print(clienteMap['nome'].toString().toUpperCase());
  print(clienteMap.containsValue(10));


  clienteMap['idade'] = 20;
  clienteMap['telefone'] = '777777777';
  clienteMap.remove('estado');

  final existsPaulo = clienteMap.containsValue('Paulo');

  print('$clienteMap  |  $existsPaulo' );


  for(final entry in clienteMap.entries){
    if(entry.key !='numeros') {
      print('${entry.key} | ${entry.value}');
    }else{
      for(final numero in entry.value){
        print('numero | ${numero['numero']}');
      }
    }
  }

  /*tratamento de erros*/

  try {
    final cliente = Cliente(
      nome:'Daniel',
      endereco: 'Bahia',
      idade: 42,
    );
    print('Cliente: ${cliente.nome} criado com sucesso');
  }on ArgumentError catch (erro) {
    print('Cliente Inválido: $erro');
  }
}
double calcularSubtotal(double preco, int quantidade){return preco* quantidade;}
double calcularDesconto(double subtotal, double desconto) => subtotal * desconto;
double calcularTotal({required double subtotal, required double valorDesconto}) => subtotal-valorDesconto;
double aplicarAcrecimo({required double preco, double percentual=0.05}){return preco + (preco * percentual);}