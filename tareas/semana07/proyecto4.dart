import 'dart:io';

void main() {
  print('--- Venta de Productos con Regalos ---');

  List<String> tiposProductos = ['P1', 'P2', 'P3'];
  List<double> preciosProductos = [15.0, 17.5, 20.0];

  stdout.write('Ingrese el tipo de producto (P1, P2, P3): ');
  String? tipoInput = stdin.readLineSync();
  String tipo = tipoInput != null ? tipoInput.toUpperCase() : '';

  int indiceTipo = tiposProductos.indexOf(tipo);
  if (indiceTipo == -1) {
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

  double precioUnitario = preciosProductos[indiceTipo];
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
  } else if (cantidad <= 50) {
    return 'Un cuaderno';
  } else {
    return 'Una agenda';
  }
}
