import 'dart:indexed_db';

import 'package:projeto_escola/aluno.dart';
import 'package:projeto_escola/disciplinas.dart';
import 'package:projeto_escola/escola_menus.dart';
import 'package:projeto_escola/pessoa_model.dart';
import 'dart:io';

import 'package:projeto_escola/professor.dart';

class Escola {
  List<Pessoa> pessoas = List.empty(growable: true);
  List<Pessoa> alunos = List.empty(growable: true);
  List<Pessoa> professores = List.empty(growable: true);
  List<Disciplina> disciplinas = List.empty(growable: true);

  int finalMatriculaAlunos() {
    final Aluno a = alunos.last as Aluno;
    return a.getMatricula % 100 + 1;
  }

  int procuraDisciplina() {
    print("Informe o codigo da disciplina");
    int codigo = int.parse(stdin.readLineSync()!);
    for (int i = 0; i < disciplinas.length; i++) {
      if (disciplinas[i].codigo == codigo) {
        return i;
      }
    }
    return -1;
  }

  void listaDisciplinas() {
    for (int i = 0; i < disciplinas.length; i++) {
      print(disciplinas[i].getNome);
      print(disciplinas[i].codigo);
    }
  }

  bool removeDisciplina() {
    final int index = procuraDisciplina();
    if (index < 0) {
      throw "Disciplina nao encontrada";
    }
    disciplinas.removeAt(index);
    return true;
  }

  void editaDisciplina() {
    final int index = procuraDisciplina();
    if (index < 0) {
      throw "Disciplina nao encontrada";
    }
    Disciplina d = adicionaDisciplina();
    disciplinas[index] = d;
  }

  Disciplina adicionaDisciplina() {
    print("Informe o codigo");
    int codigo = int.parse(stdin.readLineSync()!);
    print("Informe nome da Disciplina");
    String? nomedaDisciplina = stdin.readLineSync();
    print("Informe o professor da disiciplina");
    final int index = procuraPessoa(this.professores);
    if (index < 0) {
      throw "Professor nao encontrado";
    }
    Disciplina d =
        Disciplina(codigo, professores[index] as Professor, nomedaDisciplina!);
    return d;
  }

  void cadastros() {
    int retorno = 5;
    while (retorno != 0) {
      retorno = menuCadastro();
      try {
        if (retorno == 1) {
          final Pessoa p = adicionaPessoa(0);
          alunos.add(p);
          pessoas.add(p);
          continue;
        }
        if (retorno == 2) {
          final Pessoa p = adicionaPessoa(1);
          professores.add(p);
          pessoas.add(p);
          continue;
        }
        if (retorno == 3) {
          CadastroDisciplina();
        }
        if (retorno == 4) {
          final int indexDisciplina = procuraDisciplina();
          final int indexAluno = procuraPessoa(alunos);
          disciplinas[indexDisciplina]
              .adicionaAlunoNadisciplina(alunos[indexAluno] as Aluno);
        }
      } catch (e) {
        print("Error no cadastro");
      }
    }
  }

  Pessoa adicionaProfessor(String nome, String cpf) {
    Pessoa p = Professor(nome, cpf, 0);
    return p;
  }

  Aluno adicionaAluno(String nome, String cpf) {
    Aluno a = Aluno.matricula(nome, cpf, finalMatriculaAlunos());
    return a;
  }

  Pessoa adicionaPessoa(int tipo) {
    print("digite o nome");
    String? nome = stdin.readLineSync();
    print("informe o cpf");
    try {
      String? cpf = stdin.readLineSync();
      if (tipo == 0) {
        return adicionaAluno(nome!, cpf!);
      }
      if (tipo == 1) {
        return adicionaProfessor(nome!, cpf!);
      }
    } catch (e) {
      print(e.toString());
    }
    throw Exception();
  }

  int procuraPessoa(List<Pessoa> p) {
    print("informe o cpf");
    String? cpf = stdin.readLineSync();
    for (int i = 0; i < p.length; i++) {
      if (p[i].getCpf == cpf) {
        return i;
      }
    }
    return -1;
  }

  bool removePessoa(List<Pessoa> p) {
    int retorno = procuraPessoa(p);
    if (retorno == -1) {
      return false;
    }
    p.removeAt(retorno);
    return true;
  }

  bool editaPessoa(List<Pessoa> p) {
    int retorno = procuraPessoa(p);
    if (retorno == -1) {
      return false;
    }
    p[retorno] = adicionaPessoa(p[retorno].funcao);
    return true;
  }

  void editar() {
    int retorno = 1;
    while (retorno != 0) {
      retorno = menuEdita();
      if (retorno == 1) {
        editaPessoa(alunos);
        continue;
      }
      if (retorno == 2) {
        editaPessoa(professores);
        continue;
      }
      if (retorno == 3) {
        editaDisciplina();
        continue;
      }
      return;
    }
  }

  void listagem() {
    int retorno = 1;
    while (retorno != 0) {
      retorno = menuListar();
      if (retorno == 1) {
        listaPessoas(alunos);
        continue;
      }
      if (retorno == 2) {
        listaPessoas(professores);
        continue;
      }
      if (retorno == 3) {
        listaDisciplinas();
        continue;
      }
      if (retorno == 4) {
        final int indexDisciplina = procuraDisciplina();
        disciplinas[indexDisciplina].listaAlunosdaDisciplina();
      }
      return;
    }
  }

  void remover() {
    int retorno = 1;
    while (retorno != 0) {
      retorno = menuRemove();
      if (retorno == 1) {
        removePessoa(this.alunos);
        continue;
      }
      if (retorno == 2) {
        removePessoa(this.professores);
        continue;
      }
      if (retorno == 3) {
        removeDisciplina();
      }
      if (retorno == 4) {
        final int indexDisciplina = procuraDisciplina();
        if (indexDisciplina < 0) {
          throw "Disciplina nao encontrada";
        }
        final int indexAluno = procuraPessoa(alunos);
        disciplinas[indexDisciplina]
            .removeAlunodaDisciplina(alunos[indexAluno].getCpf);
      }
      return;
    }
  }

  void listaPessoas(List<Pessoa> p) {
    for (int i = 0; i < p.length; i++) {
      print(p[i].getNome);
      print(p[i].getCpf);
    }
  }

  void CadastroDisciplina() {
    disciplinas.add(adicionaDisciplina());
  }
}

void main() {
  Escola escola = Escola();
  int retorno = 1;
  while (retorno != 0) {
    retorno = menuInciar();
    if (retorno == 1) {
      escola.cadastros();
      continue;
    }
    if (retorno == 2) {
      escola.editar();
      continue;
    }
    if (retorno == 3) {
      escola.remover();
      continue;
    }
    if (retorno == 4) {
      escola.listagem();
      continue;
    }
  }
}
