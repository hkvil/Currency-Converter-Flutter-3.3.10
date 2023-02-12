import 'dart:math';

import 'package:currency_converter/models/dropdown_provider.dart';
import 'package:flutter/material.dart';
import 'package:currency_converter/services/currency_list.dart';
import 'package:provider/provider.dart';


class ReusableDropdown extends StatelessWidget {
  ReusableDropdown({required this.title,required this.color,required this.providerSetter});

  final Color color;
  final String title;
  String? pickedFromMenu;
  List<String> list = CurrencyList.list.keys.toList();
  final providerSetter;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title,style: TextStyle(
          fontSize: 20
        ),),
        SizedBox(height: 20,),
        DecoratedBox(
        decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(10),
        ),
        child: DropdownButton<String>(
          value: title=='From'?Provider.of<DropDownProvider>(context).pickedBase:Provider.of<DropDownProvider>(context).pickedAddress,
            icon: Icon(Icons.arrow_drop_down,color: Colors.white,size: 40,),
            underline: Container(),
            isExpanded: true,
            items: list.map<DropdownMenuItem<String>>(
                    (String value) => DropdownMenuItem<String>(
                  value: value,
                  child: Text(CurrencyList.list[value]!),
                )).toList(),
            onChanged: (pickedValue){
              pickedFromMenu = pickedValue;
              providerSetter(pickedFromMenu);
            }),
      ),]
    );
  }
}
