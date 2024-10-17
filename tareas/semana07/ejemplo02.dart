import 'dart:io';

class Estudiante {
  String codigo;
  String nombres;
  double nota1;
  double nota2;

  Estudiante(this.codigo, this.nombres, this.nota1, this.nota2);

  void mostrarInformacion() {
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
  print('Ingrese el codigo de estudiante');
  String? codigo = stdin.readLineSync();

  print('Ingrese los nombres del estudiante');
  String? nombres = stdin.readLineSync();

  print('Ingrese la primera nota');
  double nota1 = double.parse(stdin.readLineSync()!);

  print('Ingrese la segunda nota');
  double nota2 = double.parse(stdin.readLineSync()!);

  Estudiante estudiante = Estudiante(codigo!, nombres!, nota1, nota2);
  estudiante.mostrarInformacion();
}
