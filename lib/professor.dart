import 'package:projeto_escola/pessoa_model.dart';

class Professor extends Pessoa {
  int matricula = 10000;

  Professor(String nome, String cpf, int finalMatricula) : super(nome, cpf, 1) {
    matricula += finalMatricula;
  }

  @override
  Pessoa matriculaPessoa(String nome, String cpf, int finalMatricula) {
    throw UnimplementedError();
  }
}
