import 'dart:io';
import 'dart:math';

void main() {
  // Solicitar un número al usuario
  print('Introduce un número para verificar si es un número de Armstrong:');
  int? numero = int.tryParse(stdin.readLineSync() ?? '');

  if (numero == null || numero < 0) {
    print('Por favor, introduce un número entero positivo.');
    return;
  }

  // Convertir el número a cadena para contar los dígitos
  String numeroStr = numero.toString();
  int n = numeroStr.length; // Número de dígitos
  int suma = 0;

  // Usar un bucle for para separar y elevar cada dígito
  for (int i = 0; i < n; i++) {
    int digito = int.parse(numeroStr[i]); // Obtener el dígito
    suma += pow(digito, n).toInt(); // Elevar el dígito a la potencia n y sumar
  }

  // Verificar si el número es un número de Armstrong
  if (suma == numero) {
    print('$numero es un número de Armstrong.');
  } else {
    print('$numero no es un número de Armstrong.');
  }
}
