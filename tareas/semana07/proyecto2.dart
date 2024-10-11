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


  int puntajePuntualidad = getPuntajePuntualidad(minutosTardanza);


  int puntajeRendimiento = getPuntajeRendimiento(observaciones);


  int puntajeTotal = puntajePuntualidad + puntajeRendimiento;

  double bonificacionPorPunto = getBonificacionPorPunto(puntajeTotal);
  double bonificacionTotal = puntajeTotal * bonificacionPorPunto;

  print('\n--- Resultado de la Evaluación ---');
  print('Puntaje por puntualidad: $puntajePuntualidad');
  print('Puntaje por rendimiento: $puntajeRendimiento');
  print('Puntaje total: $puntajeTotal');
  print('Bonificación por punto: S/. ${bonificacionPorPunto.toStringAsFixed(2)}');
  print('Bonificación total: S/. ${bonificacionTotal.toStringAsFixed(2)}');
}

int getPuntajePuntualidad(int minutos) {
  if (minutos == 0) {
    return 10;
  } else if (minutos >= 1 && minutos <= 2) {
    return 8;
  } else if (minutos >= 3 && minutos <= 5) {
    return 6;
  } else if (minutos >= 6 && minutos <= 9) {
    return 4;
  } else {
    return 0;
  }
}

int getPuntajeRendimiento(int observaciones) {
  if (observaciones == 0) {
    return 10;
  } else if (observaciones == 1) {
    return 8;
  } else if (observaciones == 2) {
    return 5;
  } else if (observaciones == 3) {
    return 1;
  } else {
    return 0;
  }
}

double getBonificacionPorPunto(int puntajeTotal) {
  if (puntajeTotal < 11) {
    return 2.5;
  } else if (puntajeTotal >= 11 && puntajeTotal <= 13) {
    return 5.0;
  } else if (puntajeTotal >= 14 && puntajeTotal <= 16) {
    return 7.5;
  } else if (puntajeTotal >= 17 && puntajeTotal <= 19) {
    return 10.0;
  } else if (puntajeTotal == 20) {
    return 12.5;
  } else {
    return 0.0; 
  }
}
