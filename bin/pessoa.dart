/*classe abstrata tipada e não atribuida pois não podemos instanciar*/
abstract class Pessoa {
  String _nome;

  Pessoa({
    required String nome
  }): _nome = nome;

  String get nome => _nome;

  set nome(String nome){
    if (nome.isNotEmpty){
      _nome=nome;
    }
  }

  String descricao();
}