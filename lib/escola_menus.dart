import 'dart:io';

int menuInciar() {
  final int escolha;
  print("1. Cadastrar");
  print("2. Editar");
  print("3. remover");
  print("4. listar");
  print("0. finalizar");
  escolha = int.parse(stdin.readLineSync()!);
  return escolha;
}

int menuCadastro() {
  print("1. Cadastro Aluno");
  print("2. Cadastro professor");
  final int escolha;
  escolha = int.parse(stdin.readLineSync()!);
  return escolha;
}

int menuEdita() {
  print("1. Editar aluno");
  print("2. Editar professor");
  print("3. Editar disciplina");
  final int escolha;
  escolha = int.parse(stdin.readLineSync()!);
  return escolha;
}

int menuRemove() {
  print("1. Remover aluno");
  print("2. Remover professor");
  print("3. Remover disciplina");
  final int escolha;
  escolha = int.parse(stdin.readLineSync()!);
  return escolha;
}

int menuListar() {
  print("1. Listar aluno");
  print("2. Listar professor");
  print("3. Listar disciplina");
  final int escolha;
  escolha = int.parse(stdin.readLineSync()!);
  return escolha;
}
