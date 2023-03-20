import 'package:projeto_escola/pessoa_model.dart';

class Aluno extends Pessoa {
  int _matricula = 100;
  int _contaDisciplinas = 0;

  int get quantidadeDisciplinas {
    return _contaDisciplinas;
  }

  void aumentadisciplinas() {
    _contaDisciplinas++;
  }

  int get getMatricula => _matricula;

  Aluno(String nome, String cpf) : super(nome, cpf, 0);

  Aluno.matricula(String nome, String cpf, int finalMatricula)
      : super(nome, cpf, 0) {
    _matricula += finalMatricula;
  }

  @override
  Pessoa matriculaPessoa(String nome, String cpf, int finalMatricula) {
    Aluno a = Aluno.matricula(nome, cpf, finalMatricula);
    return a;
  }
}
