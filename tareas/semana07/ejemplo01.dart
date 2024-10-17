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
  List<Estudiante> listaEstudiantes = [];

  listaEstudiantes.add(Estudiante('001', 'Juan Perez', 15.5, 17.8));
  listaEstudiantes.add(Estudiante('002', 'Ana Gomez', 18.2, 19.5));

  for (var estudiante in listaEstudiantes) {
    estudiante.mostrarinformacion();
    print('---');
  }
}
