import 'package:projeto_escola/pessoa_model.dart';

class Professor extends Pessoa {
  int matricula = 10000;

  Professor(super.nome, super.cpf);
  Professor.cadastra(String nome, String cpf, int finalMatricula)
      : super(nome, cpf) {
    this.matricula += finalMatricula;
  }

  Pessoa matriculaPessoa(String nome, String cpf, int finalMatricula) {
    Professor p = Professor.cadastra(nome, cpf, finalMatricula);
    return p;
  }
}
