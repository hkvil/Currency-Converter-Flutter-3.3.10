import 'package:currency_converter/models/converter_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';



class FieldIO extends StatelessWidget {
  FieldIO({required this.title,required this.currency,required this.fieldController,required this.color});

  final Color color;
  final String title;
  final String currency;
  final TextEditingController fieldController;
  double? amount;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 5,bottom: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(title),
              Text(currency),
            ],
          ),Container(
            decoration: BoxDecoration(
                color: color,
                borderRadius: BorderRadius.circular(20)
            ),
            child: Padding(
              padding: EdgeInsets.all(8.0),
              child: TextField(
                onChanged: (newValue){
                  if (title=='Amount'){
                    amount = double.parse(newValue);
                    Provider.of<Converter>(context,listen: false).amountSetter(amount!);
                  }
                },
                controller: fieldController,
                keyboardType: TextInputType.number,
                enabled: title=='Amount' ? true : false,
                decoration: InputDecoration(
                    hintText: '${title} here...',
                    border: InputBorder.none
                ),
              ),
            ),
          )

        ],
      ),
    );
  }
}
