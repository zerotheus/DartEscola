import 'package:projeto_escola/aluno.dart';
import 'package:projeto_escola/professor.dart';

class Disciplina {
  int codigo = 0;
  String _nomedaDisciplina;
  late Professor _professor;
  List<Aluno> _alunos = List.empty(growable: true);

  Disciplina(int codigo, Professor professor, String nomedaDisciplina) {
    _professor = professor;
    this.codigo = codigo;
    _nomedaDisciplina = nomedaDisciplina;
  }

  void adicionaAlunoNadisciplina(Aluno a) {
    _alunos.add(a);
  }
}
