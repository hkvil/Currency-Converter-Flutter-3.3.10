import 'package:flutter/foundation.dart';

class Converter with ChangeNotifier{
  double amountInProvider = 0;
  double rateInProvider   = 0;

  String convert(double amount,double rate){
    var result = amount*rate;
    return result.toStringAsFixed(0);
  }
  void amountSetter(double amount){
    this.amountInProvider = amount;
    notifyListeners();
  }
  void rateSetter(double rate){
    this.rateInProvider = rate;
    notifyListeners();
  }
  double getAmount(){
    return amountInProvider;
  }
  double getRate(){
    return rateInProvider;
  }
}