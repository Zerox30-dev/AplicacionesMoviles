import 'dart:io';

void main() {
  // Solicitar el importe total vendido y el número de hijos
  print('Ingrese el importe total vendido:');
  double importeVendido = double.parse(stdin.readLineSync()!);
  
  print('Ingrese el número de hijos:');
  int numHijos = int.parse(stdin.readLineSync()!);

  // Calcular los sueldos
  Map<String, double> sueldo = calcularSueldo(importeVendido, numHijos);

  // Mostrar resultados
  print('Sueldo básico: S/. ${sueldo['sueldo_basico']!.toStringAsFixed(2)}');
  print('Comisión: S/. ${sueldo['comision']!.toStringAsFixed(2)}');
  print('Bonificación: S/. ${sueldo['bonificacion']!.toStringAsFixed(2)}');
  print('Sueldo bruto: S/. ${sueldo['sueldo_bruto']!.toStringAsFixed(2)}');
  print('Descuento: S/. ${sueldo['descuento']!.toStringAsFixed(2)}');
  print('Sueldo neto: S/. ${sueldo['sueldo_neto']!.toStringAsFixed(2)}');
}

Map<String, double> calcularSueldo(double importeVendido, int numHijos) {
  // Sueldo básico
  double sueldoBasico = 600;

  // Cálculo de la comisión
  double comision = (importeVendido > 15000) ? importeVendido * 0.07 : importeVendido * 0.05;

  // Cálculo de la bonificación
  double bonificacion = (numHijos < 5) ? numHijos * 25 : numHijos * 22;

  // Sueldo bruto
  double sueldoBruto = sueldoBasico + comision + bonificacion;

  // Cálculo del descuento
  double descuento = (sueldoBruto > 3500) ? sueldoBruto * 0.15 : sueldoBruto * 0.11;

  // Sueldo neto
  double sueldoNeto = sueldoBruto - descuento;

  return {
    'sueldo_basico': sueldoBasico,
    'comision': comision,
    'bonificacion': bonificacion,
    'sueldo_bruto': sueldoBruto,
    'descuento': descuento,
    'sueldo_neto': sueldoNeto,
  };
}
