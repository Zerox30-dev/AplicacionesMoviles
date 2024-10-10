import 'dart:io';

class Empleado {
  String categoria;
  int horasTrabajadas;
  int numeroHijos;

  Empleado(this.categoria, this.horasTrabajadas, this.numeroHijos);

  double obtenerTarifaHoraria() {
    switch (categoria) {
      case 'A':
        return 45.0;
      case 'B':
        return 37.5;
      default:
        throw Exception("Categoría no válida");
    }
  }

  double calcularSueldoBasico() {
    return obtenerTarifaHoraria() * horasTrabajadas;
  }

  double calcularBonificacionPorHijos() {
    if (numeroHijos <= 3) {
      return numeroHijos * 40.5;
    } else {
      return (3 * 40.5) + ((numeroHijos - 3) * 35.0);
    }
  }

  double calcularSueldoBruto() {
    return calcularSueldoBasico() + calcularBonificacionPorHijos();
  }

  double calcularDescuento(double sueldoBruto) {
    if (sueldoBruto >= 3500) {
      return sueldoBruto * 0.135;
    } else {
      return sueldoBruto * 0.10;
    }
  }

  double calcularSueldoNeto() {
    double sueldoBruto = calcularSueldoBruto();
    double descuento = calcularDescuento(sueldoBruto);
    return sueldoBruto - descuento;
  }

  void imprimirDetalles() {
    double sueldoBasico = calcularSueldoBasico();
    double sueldoBruto = calcularSueldoBruto();
    double descuento = calcularDescuento(sueldoBruto);
    double sueldoNeto = calcularSueldoNeto();

    print("Detalles del Empleado:");
    print("----------------------");
    print("Sueldo Básico: S/. ${sueldoBasico.toStringAsFixed(2)}");
    print("Sueldo Bruto: S/. ${sueldoBruto.toStringAsFixed(2)}");
    print("Descuento: S/. ${descuento.toStringAsFixed(2)}");
    print("Sueldo Neto: S/. ${sueldoNeto.toStringAsFixed(2)}");
  }
}

void main() {
  print("Ingrese la categoría del empleado (A/B):");
  String? categoria = stdin.readLineSync()?.toUpperCase();

  print("Ingrese la cantidad de horas trabajadas:");
  String? inputHoras = stdin.readLineSync();

  print("Ingrese el número de hijos:");
  String? inputHijos = stdin.readLineSync();

  if (categoria == null || inputHoras == null || inputHijos == null ||
      categoria.isEmpty || inputHoras.isEmpty || inputHijos.isEmpty) {
    print("Entrada no válida. Saliendo.");
    return;
  }

  int horasTrabajadas = int.tryParse(inputHoras) ?? 0;
  int numeroHijos = int.tryParse(inputHijos) ?? 0;

  if (horasTrabajadas < 0 || numeroHijos < 0 || (categoria != 'A' && categoria != 'B')) {
    print("Los valores ingresados no pueden ser negativos o la categoría no es válida. Saliendo.");
    return;
  }

  Empleado empleado = Empleado(categoria, horasTrabajadas, numeroHijos);
  empleado.imprimirDetalles();
}
