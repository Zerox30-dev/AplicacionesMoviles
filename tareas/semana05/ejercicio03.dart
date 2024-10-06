import 'dart:io';

void main() {
  // Solicitar un número al usuario
  print('Introduce un número para calcular su factorial :');
  int? numero = int.tryParse(stdin.readLineSync() ?? '');

  if (numero == null || numero < 0) {
    print('Por favor, introduce un número entero no negativo.');
    return;
  }

  // Calcular el factorial usando BigInt
  BigInt factorial = BigInt.one; // Inicializa el factorial en 1

  for (int i = 2; i <= numero; i++) {
    factorial *= BigInt.from(i);
  }

  print('El factorial de $numero es: $factorial');
}
