// ignore_for_file: unused_field

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CalculatorHome extends StatefulWidget {
  @override
  _CalculatorHomeState createState() => _CalculatorHomeState();
}

class _CalculatorHomeState extends State<CalculatorHome> {
  late int firstNum;
  late int SecondNum;
  String textToDisplay = "";
  late String result;
  late String operatorsFrom;

  void btnClicked(String btnVal) {
    if (btnVal == "AC") {
      result = "0";
      textToDisplay = "";
      firstNum = 0;
      SecondNum = 0;
    } else if (btnVal == "+" ||
        btnVal == "-" ||
        btnVal == "X" ||
        btnVal == "/" ||
        btnVal == "%") {
      firstNum = int.parse(textToDisplay);
      result = "";
      operatorsFrom = btnVal;
    } else if (btnVal == "=") {
      SecondNum = int.parse(textToDisplay);
      if (operatorsFrom == "+") {
        result = (firstNum + SecondNum).toString();
      }
      if (operatorsFrom == "-") {
        result = (firstNum - SecondNum).toString();
      }
      if (operatorsFrom == "X") {
        result = (firstNum * SecondNum).toString();
      }
      if (operatorsFrom == "/") {
        result = (firstNum / SecondNum).toString();
      }
      if (operatorsFrom == "%") {
        result = (firstNum * SecondNum / 100).toString();
      }
    } else {
      result = int.parse(textToDisplay + btnVal).toString();
    }
    setState(() {
      textToDisplay = result;
    });
  }

  Widget calBtn(String btnVal, final btnstyle) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 5, horizontal: 5),
      color: Colors.transparent,
      height: MediaQuery.of(context).size.height * 0.08,
      width: MediaQuery.of(context).size.width * 0.18,
      child: TextButton(
        style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(
                Color.fromRGBO(34, 37, 45, 0).withOpacity(0.3)),
            shape: MaterialStateProperty.all(RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10)))),
        onPressed: () {
          btnClicked(btnVal);
        },
        child: Text(
          "${btnVal}",
          style: btnstyle,
          textAlign: TextAlign.center,
        ),
      ),
    );
  }

  Widget calBtnlarge(String btnVal, final btnstyle) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 5, horizontal: 5),
      color: Colors.transparent,
      height: MediaQuery.of(context).size.height * 0.08,
      width: MediaQuery.of(context).size.width * 0.4,
      child: TextButton(
        style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(
                Color.fromRGBO(34, 37, 45, 0).withOpacity(0.3)),
            shape: MaterialStateProperty.all(RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10)))),
        onPressed: () {
          btnClicked(btnVal);
        },
        child: Text(
          "${btnVal}",
          style: btnstyle,
          textAlign: TextAlign.center,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color.fromRGBO(34, 37, 45, 0).withOpacity(0.3),
        body: Container(
          child: Column(
            children: [
              Expanded(
                flex: 3,
                child: Container(
                  alignment: Alignment.bottomRight,
                  margin: EdgeInsets.only(top: 50, right: 20),
                  height: 150,
                  child: Text(
                    textToDisplay,
                    textAlign: TextAlign.start,
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 27,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.08,
              ),
              Expanded(
                flex: 6,
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Color.fromRGBO(41, 45, 54, 90).withOpacity(0.3),
                  ),
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  alignment: Alignment.center,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          calBtnlarge(
                              "AC", Theme.of(context).textTheme.headline2),
                          calBtn("%", Theme.of(context).textTheme.headline2),
                          calBtn("/", Theme.of(context).textTheme.headline2),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          calBtn("7", Theme.of(context).textTheme.headline1),
                          calBtn("8", Theme.of(context).textTheme.headline1),
                          calBtn("9", Theme.of(context).textTheme.headline1),
                          calBtn("X", Theme.of(context).textTheme.headline3),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          calBtn("4", Theme.of(context).textTheme.headline1),
                          calBtn("5", Theme.of(context).textTheme.headline1),
                          calBtn("6", Theme.of(context).textTheme.headline1),
                          calBtn("-", Theme.of(context).textTheme.headline3),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          calBtn("1", Theme.of(context).textTheme.headline1),
                          calBtn("2", Theme.of(context).textTheme.headline1),
                          calBtn("3", Theme.of(context).textTheme.headline1),
                          calBtn("+", Theme.of(context).textTheme.headline3),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          calBtnlarge(
                              "0", Theme.of(context).textTheme.headline1),
                          calBtn(".", Theme.of(context).textTheme.headline1),
                          calBtn("=", Theme.of(context).textTheme.headline3),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
