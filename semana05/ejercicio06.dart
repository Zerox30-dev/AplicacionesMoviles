void main() {
  print('Números perfectos entre 1 y 10,000:');

  // Iterar desde 1 hasta 10,000
  for (int numero = 1; numero <= 10000; numero++) {
    int sumaDivisores = 0;

    // Encontrar los divisores propios del número
    for (int divisor = 1; divisor < numero; divisor++) {
      if (numero % divisor == 0) {
        sumaDivisores += divisor; // Sumar el divisor
      }
    }

    // Verificar si el número es perfecto
    if (sumaDivisores == numero) {
      print(numero); // Imprimir el número perfecto
    }
  }
}
