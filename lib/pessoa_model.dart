import 'dart:ffi';

abstract class Pessoa {
  String _nome = "sem nome";
  String _cpf = "00000000000";
  late int _funcao;
  //Char _sexo;
  //int dia, mes, ano;

  Pessoa(String nome, String cpf, int funcao) {
    _nome = nome;
    _cpf = cpf;
    _funcao = funcao;
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

  set setFuncao(int funcao) {
    _funcao = funcao;
  }

  int get funcao {
    return _funcao;
  }

  Pessoa matriculaPessoa(String nome, String cpf, int finalMatricula);
}
