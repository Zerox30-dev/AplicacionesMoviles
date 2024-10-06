import 'dart:io';

void main() {
  // Solicitar el tamaño de la matriz al usuario
  print('Introduce el tamaño de la matriz (N):');
  int? n = int.tryParse(stdin.readLineSync() ?? '');

  if (n == null || n <= 0) {
    print('Por favor, introduce un número entero positivo.');
    return;
  }

  // Inicializar las matrices
  List<List<int>> matrizA = List.generate(n, (_) => List.filled(n, 0));
  List<List<int>> matrizB = List.generate(n, (_) => List.filled(n, 0));
  List<List<int>> suma = List.generate(n, (_) => List.filled(n, 0));

  // Leer la primera matriz
  print('Introduce los elementos de la matriz A:');
  for (int i = 0; i < n; i++) {
    for (int j = 0; j < n; j++) {
      print('Elemento A[$i][$j]:');
      matrizA[i][j] = int.parse(stdin.readLineSync()!);
    }
  }

  // Leer la segunda matriz
  print('Introduce los elementos de la matriz B:');
  for (int i = 0; i < n; i++) {
    for (int j = 0; j < n; j++) {
      print('Elemento B[$i][$j]:');
      matrizB[i][j] = int.parse(stdin.readLineSync()!);
    }
  }

  // Sumar las matrices
  for (int i = 0; i < n; i++) {
    for (int j = 0; j < n; j++) {
      suma[i][j] = matrizA[i][j] + matrizB[i][j];
    }
  }

  // Imprimir el resultado de la suma
  print('La suma de las matrices A y B es:');
  for (int i = 0; i < n; i++) {
    for (int j = 0; j < n; j++) {
      stdout.write('${suma[i][j]} ');
    }
    print('');
  }
}
