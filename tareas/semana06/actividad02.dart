import 'dart:io';

class Empresa {
  static const double porcentajeAlquiler = 0.23;
  static const double porcentajePublicidad = 0.07;
  static const double porcentajeTransporte = 0.26;
  static const double porcentajeServiciosFeriales = 0.12;
  static const double porcentajeDecoracion = 0.21;
  static const double porcentajeGastosVarios = 0.11;

  double montoTotal;

  Empresa(this.montoTotal);

  double calcularAlquiler() {
    return montoTotal * porcentajeAlquiler;
  }

  double calcularPublicidad() {
    return montoTotal * porcentajePublicidad;
  }

  double calcularTransporte() {
    return montoTotal * porcentajeTransporte;
  }

  double calcularServiciosFeriales() {
    return montoTotal * porcentajeServiciosFeriales;
  }

  double calcularDecoracion() {
    return montoTotal * porcentajeDecoracion;
  }

  double calcularGastosVarios() {
    return montoTotal * porcentajeGastosVarios;
  }

  void imprimirGastos() {
    print("Distribución de Gastos:");
    print("-----------------------");
    print("Alquiler de espacio en la feria: S/. ${calcularAlquiler().toStringAsFixed(2)}");
    print("Publicidad: S/. ${calcularPublicidad().toStringAsFixed(2)}");
    print("Transporte: S/. ${calcularTransporte().toStringAsFixed(2)}");
    print("Servicios feriales: S/. ${calcularServiciosFeriales().toStringAsFixed(2)}");
    print("Decoración: S/. ${calcularDecoracion().toStringAsFixed(2)}");
    print("Gastos varios: S/. ${calcularGastosVarios().toStringAsFixed(2)}");
  }
}

void main() {
  print("Ingrese el monto total a invertir en la feria:");
  String? input = stdin.readLineSync();

  if (input == null || input.isEmpty) {
    print("Entrada no válida. Saliendo.");
    return;
  }

  double montoTotal = double.tryParse(input) ?? 0;

  if (montoTotal < 0) {
    print("El monto total no puede ser negativo. Saliendo.");
    return;
  }

  Empresa empresa = Empresa(montoTotal);
  empresa.imprimirGastos();
}
