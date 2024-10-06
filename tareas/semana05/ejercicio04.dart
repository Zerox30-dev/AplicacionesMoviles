import 'dart:io';

void main() {
  // Solicitar un número entero al usuario
  print('Introduce un número entero:');
  int? numero = int.tryParse(stdin.readLineSync() ?? '');

  if (numero == null) {
    print('Por favor, introduce un número entero válido.');
    return;
  }

  // Variable para almacenar el número invertido
  int numeroInvertido = 0;
  int temp = numero.abs(); // Usar el valor absoluto para manejar números negativos

  // Bucle while para invertir el número
  while (temp > 0) {
    int digito = temp % 10; // Extraer el último dígito
    numeroInvertido = numeroInvertido * 10 + digito; // Añadir el dígito al número invertido
    temp ~/= 10; // Eliminar el último dígito del número original
  }

  // Añadir el signo negativo si el número original era negativo
  if (numero < 0) {
    numeroInvertido = -numeroInvertido;
  }

  print('El número invertido es: $numeroInvertido');
}
