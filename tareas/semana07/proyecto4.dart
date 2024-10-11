import 'dart:io';

void main() {
  print('--- Venta de Productos con Regalos ---');

  Map<String, double> preciosProductos = {
    'P1': 15.0,
    'P2': 17.5,
    'P3': 20.0
  };


  stdout.write('Ingrese el tipo de producto (P1, P2, P3): ');
  String? tipoInput = stdin.readLineSync();
  String tipo = tipoInput != null ? tipoInput.toUpperCase() : '';

  if (!preciosProductos.containsKey(tipo)) {
    print('Tipo de producto inválido.');
    return;
  }


  stdout.write('Ingrese la cantidad de unidades adquiridas: ');
  String? cantidadInput = stdin.readLineSync();
  int cantidad = int.tryParse(cantidadInput ?? '') ?? -1;

  if (cantidad <= 0) {
    print('Cantidad de unidades inválida.');
    return;
  }


  double precioUnitario = preciosProductos[tipo]!;
  double importePagar = precioUnitario * cantidad;


  String regalo = getRegalo(cantidad);

  
  print('\n--- Detalles de la Compra ---');
  print('Tipo de Producto: $tipo');
  print('Cantidad de Unidades: $cantidad');
  print('Precio Unitario: S/. ${precioUnitario.toStringAsFixed(2)}');
  print('Importe a Pagar: S/. ${importePagar.toStringAsFixed(2)}');
  print('Regalo: $regalo');
}

String getRegalo(int cantidad) {
  if (cantidad < 26) {
    return 'Un lapicero';
  } else if (cantidad >= 26 && cantidad <= 50) {
    return 'Un cuaderno';
  } else {
    return 'Una agenda';
  }
}
