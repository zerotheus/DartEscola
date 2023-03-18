import 'package:projeto_escola/aluno.dart';
import 'package:projeto_escola/professor.dart';

class Disciplina {
  int codigo = 0;
  String _nomedaDisciplina = "Sem nome";
  late Professor _professor;
  List<Aluno> _alunos = List.empty(growable: true);

  Disciplina(int codigo, Professor professor, String nomedaDisciplina) {
    this.setProfessor = professor;
    this.codigo = codigo;
    _nomedaDisciplina = nomedaDisciplina;
  }

  String get getNome {
    return _nomedaDisciplina;
  }

  void adicionaAlunoNadisciplina(Aluno a) {
    _alunos.add(a);
  }

  void removeAlunodaDisciplina(String cpf) {
    for (int i = 0; i < _alunos.length; i++) {
      if (_alunos[i].getCpf == cpf) {
        _alunos.removeAt(i);
        return;
      }
    }
    throw "Aluno nao encontrado";
  }

  set setProfessor(Professor p) {}

  void listaAlunosdaDisciplina() {
    for (var i = 0; i < _alunos.length; i++) {
      print("Aluno: " +
          _alunos[i].getNome +
          " Matricula: " +
          _alunos[i].getMatricula.toString());
    }
  }
}
