import 'package:projeto_escola/aluno.dart';
import 'package:projeto_escola/disciplinas.dart';
import 'package:projeto_escola/escola_menus.dart';
import 'package:projeto_escola/pessoa_model.dart';
import 'dart:io';

import 'package:projeto_escola/professor.dart';

class Escola {
  //List<Pessoa> pessoas = List.empty(growable: true);
  List<Pessoa> alunos = List.empty(growable: true);
  List<Pessoa> professores = List.empty(growable: true);
  List<Disciplina> disciplinas = List.empty(growable: true);

  int retornaQuantidadeAlunos() {
    return alunos.length;
  }

  int ProcuraDisciplina() {
    print("Informe o codigo da disciplina");
    int codigo = int.parse(stdin.readLineSync()!);
    for (int i = 0; i < disciplinas.length; i++) {
      if (disciplinas[i].codigo == codigo) {
        return i;
      }
    }
    return -1;
  }

  Disciplina adicionaDisciplina() {
    print("Informe o codigo");
    int codigo = int.parse(stdin.readLineSync()!);
    print("Informe nome da Disciplina");
    String? nomedaDisciplina = stdin.readLineSync();
    Disciplina d =
        Disciplina(codigo, professores[0] as Professor, nomedaDisciplina!);
    return d;
  }

  void cadastraPessoa(Escola escola) {
    int retorno = 5;
    while (retorno != 0) {
      retorno = menuCadastro();
      if (retorno == 1) {
        escola.alunos.add(adicionaPessoa(0));
      }
      if (retorno == 2) {
        escola.professores.add(adicionaPessoa(1));
      }
    }
  }

  Pessoa adicionaPessoa(int tipo) {
    print("digite o nome");
    String? nome = stdin.readLineSync();
    print("informe o cpf");
    String? cpf = stdin.readLineSync();
    Aluno a = Aluno.matricula(nome!, cpf!, retornaQuantidadeAlunos());
    return a;
  }

  Aluno adicionaAluno() {
    print("digite o nome");
    String? nome = stdin.readLineSync();
    print("informe o cpf");
    String? cpf = stdin.readLineSync();
    Aluno a = Aluno.matricula(nome!, cpf!, retornaQuantidadeAlunos());
    return a;
  }

  Professor adicionaProfessor() {
    print("digite o nome p");
    String? nome = stdin.readLineSync();
    print("informe o cpf p");
    String? cpf = stdin.readLineSync();
    Professor a = Professor.cadastra(nome!, cpf!, 0);
    return a;
  }

  int procuraProfessor() {
    print("informe o cpf");
    String cpf = "cpf";
    for (int i = 0; i < professores.length; i++) {
      if (professores[i].getCpf == cpf) {
        return i;
      }
    }
    return -1;
  }

  int procuraAluno() {
    print("informe o cpf");
    String cpf = 'aaa';
    for (int i = 0; i < alunos.length; i++) {
      if (alunos[i].getCpf == cpf) {
        return i;
      }
    }
    return -1;
  }

  bool removeAluno(List<Pessoa> a) {
    int retorno = procuraAluno();
    if (retorno == -1) {
      return false;
    }
    a.removeAt(retorno);
    return true;
  }

  bool removeProfessor(List<Pessoa> p) {
    int retorno = procuraProfessor();
    if (retorno == -1) {
      return false;
    }
    return true;
  }
}

void main() {
  Escola escola = Escola();
  escola.alunos.add(escola.adicionaAluno());
  escola.alunos.add(escola.adicionaAluno());

  // print(escola.alunos[0].runtimeType);

  //escola.alunos.add(escola.adicionaAluno());
  for (var i = 0; i < escola.alunos.length; i++) {
    print(escola.alunos[i].getNome);
  }
  escola.professores.add(escola.adicionaProfessor());
  print(escola.professores[0].getNome);
  escola.disciplinas.add(escola.adicionaDisciplina());
  escola.disciplinas[0].adicionaAlunoNadisciplina(
      escola.alunos[0] as Aluno); // assim que se faz um downcast
  escola.disciplinas[0].listaAlunosdaDisciplina();

  print(escola.removeAluno(escola.alunos));
  for (var i = 0; i < escola.alunos.length; i++) {
    print(escola.alunos[i].getNome);
  }
}
