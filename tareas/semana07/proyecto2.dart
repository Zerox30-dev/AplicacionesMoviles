import 'dart:io';

void main() {
  print('--- Evaluación de Empleados y Cálculo de Bonificación ---');

  stdout.write('Ingrese los minutos de tardanza del empleado: ');
  String? tardanzaInput = stdin.readLineSync();
  int minutosTardanza = int.tryParse(tardanzaInput ?? '') ?? -1;

  if (minutosTardanza < 0) {
    print('Minutos de tardanza inválidos.');
    return;
  }

  stdout.write('Ingrese el número de observaciones efectuadas al empleado: ');
  String? observacionesInput = stdin.readLineSync();
  int observaciones = int.tryParse(observacionesInput ?? '') ?? -1;

  if (observaciones < 0) {
    print('Número de observaciones inválido.');
    return;
  }

  List<int> puntajesPuntualidad = [10, 8, 6, 4, 0];
  List<int> rangosPuntualidad = [0, 2, 5, 9]; // Rango para puntajes de puntualidad

  int puntajePuntualidad = getPuntaje(rangosPuntualidad, puntajesPuntualidad, minutosTardanza);

  List<int> puntajesRendimiento = [10, 8, 5, 1, 0];
  List<int> rangosRendimiento = [0, 1, 2, 3]; // Rango para puntajes de rendimiento

  int puntajeRendimiento = getPuntaje(rangosRendimiento, puntajesRendimiento, observaciones);

  int puntajeTotal = puntajePuntualidad + puntajeRendimiento;

  List<double> bonificacionesPorPunto = [2.5, 5.0, 7.5, 10.0, 12.5];
  List<int> rangosBonificacion = [0, 11, 14, 17, 20]; // Rango para bonificaciones

  double bonificacionPorPunto = getBonificacion(rangosBonificacion, bonificacionesPorPunto, puntajeTotal);
  double bonificacionTotal = puntajeTotal * bonificacionPorPunto;

  print('\n--- Resultado de la Evaluación ---');
  print('Puntaje por puntualidad: $puntajePuntualidad');
  print('Puntaje por rendimiento: $puntajeRendimiento');
  print('Puntaje total: $puntajeTotal');
  print('Bonificación por punto: S/. ${bonificacionPorPunto.toStringAsFixed(2)}');
  print('Bonificación total: S/. ${bonificacionTotal.toStringAsFixed(2)}');
}

int getPuntaje(List<int> rangos, List<int> puntajes, int valor) {
  for (int i = 0; i < rangos.length; i++) {
    if (valor <= rangos[i]) {
      return puntajes[i];
    }
  }
  return puntajes.last; // Retornar el último puntaje si no coincide con ninguno
}

double getBonificacion(List<int> rangos, List<double> bonificaciones, int puntajeTotal) {
  for (int i = 0; i < rangos.length; i++) {
    if (puntajeTotal <= rangos[i]) {
      return bonificaciones[i];
    }
  }
  return 0.0; // Retornar 0 si no se encuentra un rango válido
}
