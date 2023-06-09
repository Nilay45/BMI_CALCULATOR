import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';

class DataProvider with ChangeNotifier{

  int _Weight = 57;
  int _Age = 20;
  bool _Gender = true;
  int _Height = 173;
  double _BMI = 0;

  static const _kminSliderHight = 120.0;
  static const _kmaxSliderHight = 200.0;

  get Height => _Height;
  get Gender => _Gender;
  get Weight => _Weight;
  get Age => _Age;
  get kminSliderHight => _kminSliderHight;
  get kmaxSliderHight => _kmaxSliderHight;

  void setHeight(int value){
    _Height = value;
    notifyListeners();
  }

  void setGender(bool value){
    _Gender = value;
    notifyListeners();
  }

  void setWeight(int value){
    _Weight = value;
    notifyListeners();
  }

  void setAge(int value){
    _Age = value;
    notifyListeners();
  }

  String calculateBMI(){
    _BMI = (_Weight /pow((_Height/100), 2));
    return _BMI.toInt().toString();
  }

  String intro() {
    if(_BMI >= 30.0) {
      return 'Obesity';
    } else if (_BMI <= 29.9 && _BMI >= 25){
      return 'OverWeight';
    } else if (_BMI>=18.5 && _BMI <= 24.9) {
      return 'Healthy Weight';
    } else {
      return 'Underweight';
    }
  }

  String msg() {
    if (_BMI >= 30) {
      return "A BMI of over 30 indicates that you are overweight and should finds ways to lower your weight, through diet and exercise. You are at increased risk for a variety of illnesses at your present weight. You should lose weight by changing your diet and exercising more";
    }
    else if (_BMI <= 29.9 && _BMI >= 25) {
      return 'A BMI of 25 – 30 indicates that you are slightly overweight. You are advised to lose some weight for health reasons.You should lose weight by changing your diet and exercising more.';
    }
    else if (_BMI >= 18.5 && _BMI <= 24.9) {
      return 'A BMI of 18 - 25 indicates that you are in the healthy weight range. By maintaining this BMI you can lower the risk of developing serious health problems.';
    }
    else {
      return 'A BMI of under 18 indicates that you have insufficient weight, you should take proper diet to add some weight and consult a doctor or dietitian for advice.';
    }
  }
}