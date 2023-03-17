import 'dart:ffi';

abstract class Pessoa {
  String _nome = "sem nome";
  String _cpf = "00000000000";
  late int _funcao;
  //Char _sexo;
  //int dia, mes, ano;

  Pessoa(String nome, String cpf, int funcao) {
    this.setNome = nome;
    //_cpf = cpf;
    this.setCpf = cpf;
    _funcao = funcao;
  }

  set setNome(String nome) {
    RegExp regex = RegExp(r'[0-9]');
    if (regex.hasMatch(nome)) {
      throw "Nomes nao contem numeros";
    }
    _nome = nome;
  }

  String get getNome {
    return _nome;
  }

  set setCpf(String cpf) {
    RegExp regex = RegExp(r'[0-9]');
    if (!regex.hasMatch(cpf)) {
      throw "cpf contem somente numeros";
    }
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
