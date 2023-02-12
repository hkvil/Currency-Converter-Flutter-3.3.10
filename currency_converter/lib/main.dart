import 'package:currency_converter/models/dropdown_provider.dart';
import 'package:flutter/material.dart';
import 'screens/home_screen.dart';
import 'package:provider/provider.dart';
import 'package:currency_converter/models/converter_provider.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (_)=>Converter()),
      ChangeNotifierProvider(create: (_)=>DropDownProvider())
    ],
    child: MaterialApp(
      home: HomeScreen(),
    ),
  ));
}

