import 'package:flutter/foundation.dart';
import 'package:currency_converter/services/currency_list.dart';

class DropDownProvider extends ChangeNotifier{

  String pickedBase ='usd';
  String pickedAddress='idr';

  void setBase(String cur){
    pickedBase = cur;
    notifyListeners();
  }
  void setAddress(String adr){
    pickedAddress=adr;
    notifyListeners();
  }
  String getPickedBase(){
    return pickedBase;
  }
  String getPickedAddress(){
    return pickedAddress;
  }



}