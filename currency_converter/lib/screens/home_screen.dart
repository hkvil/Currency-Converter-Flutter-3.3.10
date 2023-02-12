import 'package:currency_converter/models/dropdown_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../components/reusable_dropdown.dart';
import '../constants.dart';
import '../components/reusable_button.dart';
import '../components/input_output_field.dart';
import 'package:url_launcher/url_launcher.dart';


final inputController  = TextEditingController();
final outputController = TextEditingController();

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);

  final Uri _url = Uri.parse('https://www.facebook.com/profile.php?id=100008701365111');

  Future<void> _launchUrl() async {
    if (!await launchUrl(_url,mode: LaunchMode.externalApplication)) {
      throw Exception('Could not launch $_url');
    }
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Container(
            child: Column(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    TextButton
                      (onPressed:_launchUrl,
                      child: Text('Contact',style:kContactTextStyle)),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Currency\nConverter',style:kTitleTextStyle,),
                        ReusableDropdown(title: 'From',color: Colors.lightBlueAccent,providerSetter: Provider.of<DropDownProvider>(context,listen: false).setBase),
                        ReusableDropdown(title: 'To',color: Colors.redAccent,providerSetter: Provider.of<DropDownProvider>(context,listen: false).setAddress),
                        FieldIO(title: 'Amount',currency: Provider.of<DropDownProvider>(context).pickedBase.toUpperCase(),fieldController: inputController,color: Colors.lightBlueAccent,),
                        ConvertButton(),
                        FieldIO(title: 'Result',currency: Provider.of<DropDownProvider>(context).pickedAddress.toUpperCase(),fieldController: outputController,color: Colors.redAccent,)
                      ],
                    )
                  ],
                ),

              ],
            ),
          ),
        ),
      ),
    );
  }
}
