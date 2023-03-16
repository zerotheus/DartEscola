import 'dart:ffi';

abstract class Pessoa {
  String _nome = "sem nome";
  String _cpf = "00000000000";
  late Pessoa _funcao;
  //Char _sexo;
  //int dia, mes, ano;

  Pessoa(String nome, String cpf) {
    _nome = nome;
    _cpf = cpf;
  }

  set setNome(String nome) {
    _nome = nome;
  }

  String get getNome {
    return _nome;
  }

  set setCpf(String cpf) {
    _cpf = cpf;
  }

  String get getCpf {
    return _cpf;
  }

  Pessoa matriculaPessoa(String nome, String cpf, int finalMatricula);
}
