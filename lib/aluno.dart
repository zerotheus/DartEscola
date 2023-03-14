import 'package:projeto_escola/pessoa_model.dart';
import 'package:projeto_escola/projeto_escola.dart';

class Aluno extends Pessoa {
  int _matricula = 100;

  int get getMatricula => _matricula;

  Aluno(String nome, String cpf) : super(nome, cpf) {}

  Aluno.matricula(String nome, String cpf, int finalMatricula)
      : super(nome, cpf) {
    this._matricula += finalMatricula;
  }

  @override
  Pessoa matriculaPessoa(String nome, String cpf, int finalMatricula) {
    Aluno a = Aluno.matricula(nome, cpf, finalMatricula);
    return a;
  }
}
