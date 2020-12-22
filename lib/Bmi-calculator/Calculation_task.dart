import 'dart:math';
import 'package:flutter/cupertino.dart';
import 'input_page.dart';

class CalculationBrain{
  CalculationBrain({this.height,this.weight});

  final int height;
  final int weight;
   double _bmi=0;

  String CalculatorBMI()
  {
    _bmi=weight/pow(height/100,2);
    return _bmi.toStringAsFixed(1);
  }

  String getInterpretation()
  {
    _bmi=weight/pow(height/100,2);

    if(_bmi>=25)
      {
        return 'You have a higher than normal body weight.Try to exercise more.';
      }

    else if(_bmi>=18.5)
    {
      return 'You have a normal body weight.Good job.';
    }
    else
      {
        return 'You have a lower than normal body weight.You can eat a bit more';
      }
  }

  String getresult()
  {
    if(_bmi>=25)
    {
      return 'OverWeight';
    }

    else if(_bmi>=18.5)
    {
      return 'Normal';
    }
    else
    {
      return 'UnderWeight';
    }
  }

}