import 'dart:io';

void main() {
  print('--- Cálculo de Rebaja en Pensión Universitaria ---');

  stdout.write('Ingrese la categoría del estudiante (A, B, C, D): ');
  String? categoriaInput = stdin.readLineSync();
  String categoria = categoriaInput != null ? categoriaInput.toUpperCase() : '';

  List<String> categorias = ['A', 'B', 'C', 'D'];
  List<double> pensiones = [550.0, 500.0, 460.0, 400.0];

  int index = categorias.indexOf(categoria);
  if (index == -1) {
    print('Categoría inválida. Debe ser A, B, C o D.');
    return;
  }

  double pensionBase = pensiones[index];

  stdout.write('Ingrese el promedio ponderado del ciclo anterior: ');
  String? promedioInput = stdin.readLineSync();
  double promedio = double.tryParse(promedioInput ?? '') ?? -1;

  if (promedio < 0 || promedio > 20) {
    print('Promedio inválido. Debe estar entre 0 y 20.');
    return;
  }

  double descuentoPorcentaje = getDescuentoPorcentaje(promedio);
  double descuento = pensionBase * (descuentoPorcentaje / 100);
  double nuevaPension = pensionBase - descuento;

  print('\n--- Resultado ---');
  if (descuentoPorcentaje > 0) {
    print('Descuento aplicado: ${descuentoPorcentaje}%');
    print('Monto del descuento: S/. ${descuento.toStringAsFixed(2)}');
  } else {
    print('No se aplicó ningún descuento.');
  }
  print('Nueva pensión: S/. ${nuevaPension.toStringAsFixed(2)}');
}

double getDescuentoPorcentaje(double promedio) {
  if (promedio < 14.00) {
    return 0.0;
  } else if (promedio < 16.00) {
    return 10.0;
  } else if (promedio < 18.00) {
    return 12.0;
  } else {
    return 15.0;
  }
}
