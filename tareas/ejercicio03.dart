import 'dart:io';

void main() {
  print("Enter the total Monto to be invested: ");

  String? input = stdin.readLineSync();

  double totalMonto = double.parse(input!);

  double alquilerMonto = totalMonto * 0.23;
  double publicidadMonto = totalMonto * 0.07;
  double transporteMonto = totalMonto * 0.26;
  double serviciosFerialesMonto = totalMonto * 0.12;
  double decoracionMonto = totalMonto * 0.21;
  double gastosVariosMonto = totalMonto * 0.11;

  print("Alquiler de espacio en la feria: \$${alquilerMonto.toStringAsFixed(2)}");
  print("Publicidad: \$${publicidadMonto.toStringAsFixed(2)}");
  print("Transporte: \$${transporteMonto.toStringAsFixed(2)}");
  print("Servicios feriales: \$${serviciosFerialesMonto.toStringAsFixed(2)}");
  print("Decoración: \$${decoracionMonto.toStringAsFixed(2)}");
  print("Gastos varios: \$${gastosVariosMonto.toStringAsFixed(2)}");
}