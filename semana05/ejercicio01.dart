import 'dart:io';

bool esPrimo(int numero) {
  if (numero < 2) return false;
  for (int i = 2; i <= numero ~/ 2; i++) {
    if (numero % i == 0) return false;
  }
  return true;
}

void main() {
  // Solicitar dos números al usuario
  print('Introduce el primer número:');
  int? numero1 = int.tryParse(stdin.readLineSync() ?? '');
  
  print('Introduce el segundo número:');
  int? numero2 = int.tryParse(stdin.readLineSync() ?? '');

  if (numero1 == null || numero2 == null) {
    print('Por favor, introduce números válidos.');
    return;
  }

  // Asegurarse de que el primer número sea menor que el segundo
  int inicio = numero1 < numero2 ? numero1 : numero2;
  int fin = numero1 > numero2 ? numero1 : numero2;

  int sumatoria = 0;

  // Calcular la sumatoria de números primos en el rango
  for (int i = inicio; i <= fin; i++) {
    if (esPrimo(i)) {
      sumatoria += i;
    }
  }

  print('La sumatoria de números primos entre $inicio y $fin es: $sumatoria');
}
