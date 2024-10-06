import 'dart:io';

void main() {
  // Solicitar el tamaño de la matriz al usuario
  print('Introduce el tamaño de la matriz (n):');
  int? n = int.tryParse(stdin.readLineSync() ?? '');

  if (n == null || n <= 0) {
    print('Por favor, introduce un número entero positivo.');
    return;
  }

  // Inicializar la matriz
  List<List<int>> matriz = List.generate(n, (_) => List.filled(n, 0));

  int valor = 1; // Valor a insertar en la matriz
  int inicioFila = 0;
  int finFila = n - 1;
  int inicioColumna = 0;
  int finColumna = n - 1;

  // Llenar la matriz en espiral
  while (inicioFila <= finFila && inicioColumna <= finColumna) {
    // Llenar la fila superior
    for (int i = inicioColumna; i <= finColumna; i++) {
      matriz[inicioFila][i] = valor++;
    }
    inicioFila++;

    // Llenar la columna derecha
    for (int i = inicioFila; i <= finFila; i++) {
      matriz[i][finColumna] = valor++;
    }
    finColumna--;

    // Llenar la fila inferior
    if (inicioFila <= finFila) {
      for (int i = finColumna; i >= inicioColumna; i--) {
        matriz[finFila][i] = valor++;
      }
      finFila--;
    }

    // Llenar la columna izquierda
    if (inicioColumna <= finColumna) {
      for (int i = finFila; i >= inicioFila; i--) {
        matriz[i][inicioColumna] = valor++;
      }
      inicioColumna++;
    }
  }

  // Imprimir la matriz
  print('Matriz en forma de espiral:');
  for (int i = 0; i < n; i++) {
    for (int j = 0; j < n; j++) {
      stdout.write('${matriz[i][j]} ');
    }
    print('');
  }
}
