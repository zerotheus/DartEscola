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

  Pessoa adicionaProfessor(String nome, String cpf) {
    Pessoa p = Professor(nome, cpf, 0);
    return p;
  }

  Aluno adicionaAluno(String nome, String cpf) {
    Aluno a = Aluno.matricula(nome, cpf, retornaQuantidadeAlunos());
    return a;
  }

  Pessoa adicionaPessoa(int tipo) {
    print("digite o nome p");
    String? nome = stdin.readLineSync();
    print("informe o cpf p");
    String? cpf = stdin.readLineSync();
    if (tipo == 0) {
      return adicionaAluno(nome!, cpf!);
    }
    if (tipo == 1) {
      return adicionaProfessor(nome!, cpf!);
    }
    throw Exception();
  }

  int procuraPessoa(List<Pessoa> p) {
    print("informe o cpf");
    String cpf = 'aaa';
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

  void listaPessoas(List<Pessoa> p) {
    for (int i = 0; i < p.length; i++) {
      print(p[i].getNome);
      print(p[i].getCpf);
    }
  }
}

void main() {
  Escola escola = Escola();
  escola.alunos.add(escola.adicionaPessoa(0));
  escola.alunos.add(escola.adicionaPessoa(0));

  // print(escola.alunos[0].runtimeType);

  //escola.alunos.add(escola.adicionaAluno());
  for (var i = 0; i < escola.alunos.length; i++) {
    print(escola.alunos[i].getNome);
  }
  escola.professores.add(escola.adicionaPessoa(1));
  print(escola.professores[0].getNome);
  escola.disciplinas.add(escola.adicionaDisciplina());
  escola.disciplinas[0].adicionaAlunoNadisciplina(
      escola.alunos[0] as Aluno); // assim que se faz um downcast
  escola.disciplinas[0].listaAlunosdaDisciplina();

  print(escola.removePessoa(escola.alunos));
  for (var i = 0; i < escola.alunos.length; i++) {
    print(escola.alunos[i].getNome);
  }
}
