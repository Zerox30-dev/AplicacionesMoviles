import 'dart:io';

void main() {
  // Solicitar la base al usuario
  print('Introduce la base:');
  int? base = int.tryParse(stdin.readLineSync() ?? '');

  if (base == null) {
    print('Por favor, introduce un número entero válido.');
    return;
  }

  // Solicitar el exponente al usuario
  print('Introduce el exponente (número entero no negativo):');
  int? exponente = int.tryParse(stdin.readLineSync() ?? '');

  if (exponente == null || exponente < 0) {
    print('Por favor, introduce un número entero no negativo.');
    return;
  }

  // Calcular la potencia usando multiplicación repetida
  int resultado = 1; // Inicializar resultado en 1

  for (int i = 0; i < exponente; i++) {
    resultado *= base; // Multiplicar repetidamente
  }

  // Imprimir el resultado
  print('$base elevado a la potencia de $exponente es: $resultado');
}
