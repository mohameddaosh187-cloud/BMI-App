// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:math';

class UserBmiModel {
  String gender;
  int height;
  int weight;
  int age;
  UserBmiModel({
    required this.gender,
    required this.height,
    required this.weight,
    required this.age,
  });
  double get resulteBmi {
    double calculateBmi = (weight / pow(height / 100, 2)).roundToDouble();
    return calculateBmi;
    // print(calculateBmi);
  }

  String get stringView {
    if (resulteBmi < 18.50) {
      return 'Underweight';
    } else if (resulteBmi < 25) {
      return 'Normal';
    } else if (resulteBmi < 30) {
      return 'Overweight';
    } else {
      return 'Obese';
    }
  }
}
