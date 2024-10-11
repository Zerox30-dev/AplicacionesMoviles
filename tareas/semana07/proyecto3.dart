import 'dart:io';

void main() {
  print('--- Venta de Chocolates con Descuentos y Obsequios ---');


  Map<String, double> preciosChocolates = {
    'PRIMOR': 8.5,
    'DULZURA': 10.0,
    'TENTACION': 7.0,
    'EXPLOSION': 12.5
  };

  stdout.write('Ingrese el tipo de chocolate (Primor, Dulzura, Tentación, Explosión): ');
  String? tipoInput = stdin.readLineSync();
  String tipo = tipoInput != null ? tipoInput.toUpperCase() : '';

  if (!preciosChocolates.containsKey(tipo)) {
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


  double precioUnitario = preciosChocolates[tipo]!;
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
  if (cantidad < 5) {
    return 4.0;
  } else if (cantidad >= 5 && cantidad < 10) {
    return 6.5;
  } else if (cantidad >= 10 && cantidad < 15) {
    return 9.0;
  } else if (cantidad >= 15) {
    return 11.5;
  } else {
    return 0.0;
  }
}
