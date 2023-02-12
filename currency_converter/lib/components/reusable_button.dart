import 'package:currency_converter/components/input_output_field.dart';
import 'package:currency_converter/models/converter_provider.dart';
import 'package:currency_converter/models/dropdown_provider.dart';
import 'package:currency_converter/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:currency_converter/services/network_helper.dart';
import 'package:provider/provider.dart';

NetworkHelper networkHelper = NetworkHelper();

class ConvertButton extends StatelessWidget {
  const ConvertButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 70,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.green,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20)
          )
        ),
          onPressed:()async{
            await networkHelper.getLatestConvertRate(Provider.of<DropDownProvider>(context,listen: false).pickedBase,Provider.of<DropDownProvider>(context,listen: false).pickedAddress);
            Provider.of<Converter>(context,listen: false).rateSetter(networkHelper.rate);
            outputController.text = Provider.of<Converter>(context,listen: false).convert(Provider.of<Converter>(context,listen: false).amountInProvider,Provider.of<Converter>(context,listen: false).rateInProvider);//TODO Result here
          },
          child: Text('Convert',style: TextStyle(
            fontSize: 20
          ),)),
    );
  }
}
