import 'dart:io';

void main() {
  print('--- Venta de Chocolates con Descuentos y Obsequios ---');

  List<String> tiposChocolates = ['PRIMOR', 'DULZURA', 'TENTACION', 'EXPLOSION'];
  List<double> preciosChocolates = [8.5, 10.0, 7.0, 12.5];

  stdout.write('Ingrese el tipo de chocolate (Primor, Dulzura, Tentación, Explosión): ');
  String? tipoInput = stdin.readLineSync();
  String tipo = tipoInput != null ? tipoInput.toUpperCase() : '';

  int indiceTipo = tiposChocolates.indexOf(tipo);
  if (indiceTipo == -1) {
    print('Tipo de chocolate inválido.');
    return;
  }

  stdout.write('Ingrese la cantidad de chocolates adquiridos: ');
  String? cantidadInput = stdin.readLineSync();
  int cantidad = int.tryParse(cantidadInput ?? '') ?? -1;

  if (cantidad <= 0) {
    print('Cantidad de chocolates inválida.');
    return;
  }

  double precioUnitario = preciosChocolates[indiceTipo];
  double importeCompra = precioUnitario * cantidad;

  double descuentoPorcentaje = getDescuentoPorcentaje(cantidad);
  double descuento = importeCompra * (descuentoPorcentaje / 100);
  double importePagar = importeCompra - descuento;

  // Calcular obsequios
  int caramelosPorChocolate = importePagar >= 250 ? 3 : 2;
  int totalCaramelos = caramelosPorChocolate * cantidad;

  // Mostrar resultados
  print('\n--- Detalles de la Compra ---');
  print('Tipo de Chocolate: $tipo');
  print('Cantidad de Chocolates: $cantidad');
  print('Precio Unitario: S/. ${precioUnitario.toStringAsFixed(2)}');
  print('Importe de la Compra: S/. ${importeCompra.toStringAsFixed(2)}');
  if (descuentoPorcentaje > 0) {
    print('Descuento Aplicado: ${descuentoPorcentaje}%');
    print('Monto del Descuento: S/. ${descuento.toStringAsFixed(2)}');
  } else {
    print('No se aplicó ningún descuento.');
  }
  print('Importe a Pagar: S/. ${importePagar.toStringAsFixed(2)}');
  print('Caramelos de Obsequio: $totalCaramelos');
}

double getDescuentoPorcentaje(int cantidad) {
  List<double> descuentos = [4.0, 6.5, 9.0, 11.5];

  if (cantidad < 5) {
    return descuentos[0];
  } else if (cantidad < 10) {
    return descuentos[1];
  } else if (cantidad < 15) {
    return descuentos[2];
  } else {
    return descuentos[3];
  }
}
