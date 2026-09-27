import 'pessoa.dart';
import 'idade_invalida_exception.dart';

class Cliente extends Pessoa{

  String _endereco;
  int _idade;
  bool _ativo;
  /*encapsulamento*/
  Cliente({
    required String nome,
    required String endereco,
    required int idade,
    bool ativo = true,
  }) : _endereco=endereco,
        _idade=idade,
        _ativo=ativo,
        super(nome:nome){

    if (idade < 0){
      throw IdadeInvalidaException('Idade não pode ser negativa');
    }
  }

  String get endereco => _endereco;
  set endereco(String endereco) => _endereco=endereco;

  int get idade => _idade;
  set idade(int idade){
    if (idade>=0){
      _idade=idade;
    }
  }

  bool get ativo => _ativo;
  set ativo(bool ativo) => _ativo=ativo;

  bool maiorDeIdade()=>idade>= 18;
  /*Polimorfismo e abistração*/
  @override
  String descricao() {
    return 'IMPLEMENTACAO';
  }
}