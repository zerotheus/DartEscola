import 'package:projeto_escola/aluno.dart';
import 'package:projeto_escola/disciplinas.dart';
import 'package:projeto_escola/pessoa_model.dart';
import 'dart:io';

import 'package:projeto_escola/professor.dart';

class Escola {
  //List<Pessoa> pessoas = List.empty(growable: true);
  List<Aluno> alunos = List.empty(growable: true);
  List<Professor> professores = List.empty(growable: true);
  List<Disciplina> disciplinas = List.empty(growable: true);

  int retornaQuantidadeAlunos() {
    return alunos.length;
  }

  Disciplina adicionaDisciplina() {
    print("Informe o codigo");
    int codigo = int.parse(stdin.readLineSync()!);
    print("Informe nome da Disciplina");
    String? nomedaDisciplina = stdin.readLineSync();
    Disciplina d = Disciplina(codigo, professores[0], nomedaDisciplina!);
    return d;
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
    String cpf = "cpf";
    for (int i = 0; i < alunos.length; i++) {
      if (alunos[i].getCpf == cpf) {
        return i;
      }
    }
    return -1;
  }
}

void main() {
  Escola escola = Escola();
  escola.alunos.add(escola.adicionaAluno());
  //escola.alunos.add(escola.adicionaAluno());
  //escola.alunos.add(escola.adicionaAluno());
  for (var i = 0; i < escola.retornaQuantidadeAlunos(); i++) {
    print(escola.alunos[i].getMatricula);
  }
  escola.professores.add(escola.adicionaProfessor());
  print(escola.professores[0].getNome);
  escola.disciplinas.add(escola.adicionaDisciplina());
}
