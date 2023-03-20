import 'dart:io';

int menuInciar() {
  final int escolha;
  print("1. Cadastrar");
  print("2. Editar");
  print("3. remover");
  print("4. listar");
  print("0. finalizar");
  escolha = int.parse(stdin.readLineSync()!);
  if (escolha.isNaN) {
    print("Por favor digite um numero");
    return menuInciar();
  }
  return escolha;
}

int menuCadastro() {
  print("1. Cadastro Aluno");
  print("2. Cadastro professor");
  print("3. Cadastrar Disciplina");
  print("4. Cadastrar aluno na disciplina");
  print("0. Voltar");
  final int escolha;
  escolha = int.parse(stdin.readLineSync()!);
  if (escolha.isNaN) {
    print("Por favor digite um numero");
    return menuCadastro();
  }
  return escolha;
}

int menuEdita() {
  print("1. Editar aluno");
  print("2. Editar professor");
  print("3. Editar disciplina");
  print("0. Voltar");
  final int escolha;
  escolha = int.parse(stdin.readLineSync()!);
  if (escolha.isNaN) {
    print("Por favor digite um numero");
    return menuEdita();
  }
  return escolha;
}

int menuRemove() {
  print("1. Remover aluno");
  print("2. Remover professor");
  print("3. Remover disciplina");
  print("4. Remover aluno da disciplina");
  print("0. Voltar");

  final int escolha;
  escolha = int.parse(stdin.readLineSync()!);
  if (escolha.isNaN) {
    print("Por favor digite um numero");
    return menuRemove();
  }

  return escolha;
}

int menuListar() {
  print("1. Listar aluno");
  print("2. Listar professor");
  print("3. Listar disciplina");
  print("4. Listar todas as pessoas");
  print("5. Listar todos alunos de uma disciplina");
  print("0. Voltar");
  final int escolha;
  escolha = int.parse(stdin.readLineSync()!);
  if (escolha.isNaN) {
    print("Por favor digite um numero");
    return menuListar();
  }
  return escolha;
}
