import 'dart:io';

class Vendedor {
  static const double sueldoBasico = 350.75;
  static const double porcentajeComision = 0.05;
  static const double porcentajeDescuento = 0.15;

  double importeVendido;

  Vendedor(this.importeVendido);

  double calcularComision() {
    return importeVendido * porcentajeComision;
  }

  double calcularSueldoBruto() {
    return sueldoBasico + calcularComision();
  }

  double calcularDescuento() {
    return calcularSueldoBruto() * porcentajeDescuento;
  }

  double calcularSueldoNeto() {
    return calcularSueldoBruto() - calcularDescuento();
  }

  void imprimirBoleta() {
    print("Boleta de Pago del Vendedor");
    print("-----------------------------");
    print("Sueldo Básico: S/. ${sueldoBasico.toStringAsFixed(2)}");
    print("Comisión: S/. ${calcularComision().toStringAsFixed(2)}");
    print("Sueldo Bruto: S/. ${calcularSueldoBruto().toStringAsFixed(2)}");
    print("Descuento: S/. ${calcularDescuento().toStringAsFixed(2)}");
    print("Sueldo Neto: S/. ${calcularSueldoNeto().toStringAsFixed(2)}");
  }
}

void main() {
  print("Ingrese el importe total vendido en el mes:");
  String? input = stdin.readLineSync();

  if (input == null || input.isEmpty) {
    print("Entrada no válida. Saliendo.");
    return;
  }

  double importeVendido = double.tryParse(input) ?? 0;

  if (importeVendido < 0) {
    print("El importe vendido no puede ser negativo. Saliendo.");
    return;
  }

  Vendedor vendedor = Vendedor(importeVendido);
  vendedor.imprimirBoleta();
}
