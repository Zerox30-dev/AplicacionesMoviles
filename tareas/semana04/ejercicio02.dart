import 'dart:io';

void main() {
  // Definición de los costos de las libretas
  const double costoMayorDe18 = 350.0;
  const double costoMenorOIgual18 = 200.0;

  // Solicitar la edad del usuario
  print("Ingrese la edad del hombre:");
  int? edad = int.tryParse(stdin.readLineSync()!);

  // Verificar si la edad es válida
  if (edad == null || edad < 18) {
    print("Edad inválida. Por favor, ingrese un valor validod.");
    return;
  }

  // Solicitar el nivel del sistema de beneficio
  print("Ingrese el nivel del sistema de beneficio (1, 2, 3 o cualquier otro número):");
  int? nivel = int.tryParse(stdin.readLineSync()!);

  // Verificar si el nivel es válido
  if (nivel == null || nivel < 0) {
    print("Nivel inválido. Por favor, ingrese un valor positivo.");
    return;
  }

  double costoOriginal;
  double descuento;

  // Determinar el costo y el descuento basado en la edad
  if (edad > 18) {
    costoOriginal = costoMayorDe18;
    switch (nivel) {
      case 1:
        descuento = 0.40; // 40%
        break;
      case 2:
        descuento = 0.30; // 30%
        break;
      case 3:
        descuento = 0.15; // 15%
        break;
      default:
        descuento = 0.0;  // No hay descuento
    }
  } else {
    costoOriginal = costoMenorOIgual18;
    switch (nivel) {
      case 1:
        descuento = 0.60; // 60%
        break;
      case 2:
        descuento = 0.40; // 40%
        break;
      case 3:
        descuento = 0.20; // 20%
        break;
      default:
        descuento = 0.0;  // No hay descuento
    }
  }

  // Calcular el valor final a pagar
  double montoDescuento = costoOriginal * descuento;
  double valorFinal = costoOriginal - montoDescuento;

  // Mostrar los resultados
  print("Costo original: S/. ${costoOriginal.toStringAsFixed(2)}");
  print("Descuento: S/. ${montoDescuento.toStringAsFixed(2)}");
  print("Valor final a pagar: S/. ${valorFinal.toStringAsFixed(2)}");
}
