import 'package:calculator/screens/home.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() => runApp(Calculator());

class Calculator extends StatelessWidget {
  const Calculator({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        textTheme: TextTheme(
          headline1: TextStyle(
              color: Colors.white, fontWeight: FontWeight.bold, fontSize: 18),
          headline2: TextStyle(
              color: Colors.green, fontWeight: FontWeight.bold, fontSize: 18),
          headline3: TextStyle(
              color: Colors.red, fontWeight: FontWeight.bold, fontSize: 18),
        ),
      ),
      debugShowCheckedModeBanner: false,
      home: CalculatorHome(),
    );
  }
}
