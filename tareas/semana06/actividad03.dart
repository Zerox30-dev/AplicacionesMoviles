import 'dart:io';

class Camisa {
  double precio;
  int cantidad;

  Camisa(this.precio, this.cantidad);

  double calcularImporteCompra() {
    return precio * cantidad;
  }

  double calcularPrimerDescuento(double importeCompra) {
    return importeCompra * 0.07;
  }

  double calcularSegundoDescuento(double importeCompra, double primerDescuento) {
    double restante = importeCompra - primerDescuento;
    return restante * 0.07;
  }

  double calcularDescuentoTotal(double primerDescuento, double segundoDescuento) {
    return primerDescuento + segundoDescuento;
  }

  double calcularImporteAPagar(double importeCompra, double descuentoTotal) {
    return importeCompra - descuentoTotal;
  }

  void imprimirDetalles() {
    double importeCompra = calcularImporteCompra();
    double primerDescuento = calcularPrimerDescuento(importeCompra);
    double segundoDescuento = calcularSegundoDescuento(importeCompra, primerDescuento);
    double descuentoTotal = calcularDescuentoTotal(primerDescuento, segundoDescuento);
    double importeAPagar = calcularImporteAPagar(importeCompra, descuentoTotal);

    print("Detalles de la compra:");
    print("----------------------");
    print("Importe de la compra: S/. ${importeCompra.toStringAsFixed(2)}");
    print("Importe del primer descuento: S/. ${primerDescuento.toStringAsFixed(2)}");
    print("Importe del segundo descuento: S/. ${segundoDescuento.toStringAsFixed(2)}");
    print("Importe del descuento total: S/. ${descuentoTotal.toStringAsFixed(2)}");
    print("Importe a pagar: S/. ${importeAPagar.toStringAsFixed(2)}");
  }
}

void main() {
  print("Ingrese el precio de la camisa:");
  String? inputPrecio = stdin.readLineSync();
  print("Ingrese la cantidad de camisas adquiridas:");
  String? inputCantidad = stdin.readLineSync();

  if (inputPrecio == null || inputCantidad == null || inputPrecio.isEmpty || inputCantidad.isEmpty) {
    print("Entrada no válida. Saliendo.");
    return;
  }

  double precio = double.tryParse(inputPrecio) ?? 0;
  int cantidad = int.tryParse(inputCantidad) ?? 0;

  if (precio < 0 || cantidad < 0) {
    print("El precio y la cantidad no pueden ser negativos. Saliendo.");
    return;
  }

  Camisa camisa = Camisa(precio, cantidad);
  camisa.imprimirDetalles();
}
