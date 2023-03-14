import 'package:projeto_escola/aluno.dart';
import 'package:projeto_escola/professor.dart';

class Disciplina {
  int codigo = 0;
  late Professor _professor;
  List<Aluno> _alunos = List.empty(growable: true);

  Disciplina(int codigo, Professor professor) {
    _professor = professor;
    this.codigo = codigo;
  }

  void adicionaAlunoNadisciplina(Aluno a) {
    _alunos.add(a);
  }
}
