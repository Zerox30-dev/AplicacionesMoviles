import 'dart:io';

void main() {
  // Definición de las pensiones por categoría
  const pensiones = {
    'A': 550,
    'B': 500,
    'C': 460,
    'D': 400,
  };

  // Definición de los descuentos según el promedio
  const descuentos = {
    0: 0.0,
    14: 0.1,
    16: 0.12,
    18: 0.15,
  };

  // Solicitar la categoría del estudiante
  print("Ingrese la categoría del estudiante (A, B, C, D):");
  String? categoria = stdin.readLineSync()?.toUpperCase();

  // Verificar si la categoría es válida
  if (!pensiones.containsKey(categoria)) {
    print("Categoría inválida. Por favor, ingrese A, B, C o D.");
    return;
  }

  // Solicitar el promedio del estudiante
  print("Ingrese el promedio del ciclo anterior (0 a 20):");
  double? promedio = double.tryParse(stdin.readLineSync()!);

  // Verificar si el promedio es válido
  if (promedio == null || promedio < 0 || promedio > 20) {
    print("Promedio inválido. Por favor, ingrese un valor entre 0 y 20.");
    return;
  }

  // Determinar el porcentaje de descuento basado en el promedio
  double porcentajeDescuento = 0.0;
  if (promedio < 14) {
    porcentajeDescuento = descuentos[0]!;
  } else if (promedio < 16) {
    porcentajeDescuento = descuentos[14]!;
  } else if (promedio < 18) {
    porcentajeDescuento = descuentos[16]!;
  } else {
    porcentajeDescuento = descuentos[18]!;
  }

  // Calcular la pensión original y la rebaja
  double pensionActual = pensiones[categoria]!.toDouble();
  double rebaja = pensionActual * porcentajeDescuento;
  double nuevaPension = pensionActual - rebaja;

  // Mostrar los resultados
  print("Pensión actual: S/. ${pensionActual.toStringAsFixed(2)}");
  print("Rebaja: S/. ${rebaja.toStringAsFixed(2)}");
  print("Nueva pensión: S/. ${nuevaPension.toStringAsFixed(2)}");
}
