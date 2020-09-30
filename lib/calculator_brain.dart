import 'dart:math';

class Calculator_brain {
  Calculator_brain({this.height, this.weight});
  final int height, weight;
  double _bmi;
  String calcBmi() {
    _bmi = weight / pow(height / 100, 2);
    return _bmi.toStringAsFixed(1);
  }

  String getResult() {
    if (_bmi > 25) {
      return 'OverWeight';
    } else if (_bmi > 18.5) {
      return 'Normal';
    } else {
      return 'UnderWeight';
    }
  }

  String getInterpretation() {
    if (_bmi > 25) {
      return 'You have to do more workout';
    } else if (_bmi > 18.5) {
      return 'Greate maintain the height and weight';
    } else {
      return 'Eat Healthy food to increase weight';
    }
  }
}
