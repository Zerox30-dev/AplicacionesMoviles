import 'dart:io';

class Estudiante {
  String codigo;
  String nombres;
  double nota1;
  double nota2;

  Estudiante(this.codigo, this.nombres, this.nota1, this.nota2);

  void mostrarinformacion() {
    print('Código: $codigo');
    print('Nombres: $nombres');
    print('Nota 1: $nota1');
    print('Nota 2: $nota2');
    print('Promedio: ${calcularPromedio()}');
  }

  double calcularPromedio() {
    return (nota1 + nota2) / 2;
  }
}

void main() {
  Estudiante estudiante = crearEstudiante();
  estudiante.mostrarinformacion();
}

Estudiante crearEstudiante() {
  String codigo = solicitarEntrada('Ingrese el código de estudiante:');
  String nombres = solicitarEntrada('Ingrese los nombres del estudiante:');
  double nota1 = double.parse(solicitarEntrada('Ingrese la primera nota:'));
  double nota2 = double.parse(solicitarEntrada('Ingrese la segunda nota:'));

  return Estudiante(codigo, nombres, nota1, nota2);
}

String solicitarEntrada(String mensaje) {
  print(mensaje);
  return stdin.readLineSync()!;
}
