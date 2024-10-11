import 'dart:io';

void main() {
  print('--- Cálculo de Rebaja en Pensión Universitaria ---');

  stdout.write('Ingrese la categoría del estudiante (A, B, C, D): ');
  String? categoriaInput = stdin.readLineSync();
  String categoria = categoriaInput != null ? categoriaInput.toUpperCase() : '';


  if (!['A', 'B', 'C', 'D'].contains(categoria)) {
    print('Categoría inválida. Debe ser A, B, C o D.');
    return;
  }

  double pensionBase = getPensionBase(categoria);


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

double getPensionBase(String categoria) {
  switch (categoria) {
    case 'A':
      return 550.0;
    case 'B':
      return 500.0;
    case 'C':
      return 460.0;
    case 'D':
      return 400.0;
    default:
      return 0.0;
  }
}

double getDescuentoPorcentaje(double promedio) {
  if (promedio >= 0 && promedio <= 13.99) {
    return 0.0;
  } else if (promedio >= 14.00 && promedio <= 15.99) {
    return 10.0;
  } else if (promedio >= 16.00 && promedio <= 17.99) {
    return 12.0;
  } else if (promedio >= 18.00 && promedio <= 20.00) {
    return 15.0;
  } else {
    return 0.0;
  }
}
