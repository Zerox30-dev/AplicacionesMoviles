import 'dart:io';

void main() {
  // Solicitar el número de términos al usuario
  print('Introduce el número de términos de la secuencia de Fibonacci:');
  int? n = int.tryParse(stdin.readLineSync() ?? '');

  if (n == null || n <= 0) {
    print('Por favor, introduce un número entero positivo.');
    return;
  }

  // Variables para los dos primeros términos de Fibonacci
  int a = 0, b = 1;

  print('Secuencia de Fibonacci hasta $n términos:');

  for (int i = 0; i < n; i++) {
    if (i == 0) {
      print(a); // Primer término
    } else if (i == 1) {
      print(b); // Segundo término
    } else {
      int siguiente = a + b; // Siguiente término
      print(siguiente);
      a = b; // Actualizar a
      b = siguiente; // Actualizar b
    }
  }
}
