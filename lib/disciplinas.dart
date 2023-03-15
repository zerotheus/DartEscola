import 'package:projeto_escola/aluno.dart';
import 'package:projeto_escola/professor.dart';

class Disciplina {
  int codigo = 0;
  String _nomedaDisciplina = "Sem nome";
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

  void trocaProfessor(Professor p) {}

  void listaAlunosdaDisciplina() {
    for (var i = 0; i < _alunos.length; i++) {
      print("Aluno: " +
          _alunos[i].getNome +
          " Matricula: " +
          _alunos[i].getMatricula.toString());
    }
  }
}
