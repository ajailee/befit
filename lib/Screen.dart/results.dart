import 'package:befit/Model/bmiData.dart';
import 'package:befit/Provider/Bmi.dart';
import 'package:befit/Screen.dart/chart.dart';
import 'package:befit/Theme/MyTheme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:liquid_progress_indicator_ns/liquid_progress_indicator.dart';

class Results extends StatefulWidget {
  static String roteName = '/resultsPage';

  @override
  _ResultsState createState() => _ResultsState();
}

class _ResultsState extends State<Results> {
  bool _saved = false;

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    String _str;
    BmiData bmi = ModalRoute.of(context)!.settings.arguments as BmiData;
    print(bmi);
    if (bmi.bmi < 18.5) {
      _str = 'you are considered to be underweight.';
    } else if (bmi.bmi >= 18.5 && bmi.bmi <= 24.9) {
      _str = 'you are considered to be within a healthy weight range';
    } else if (bmi.bmi >= 25.0 && bmi.bmi <= 29.9) {
      _str = 'you are considered to be overweight';
    } else {
      _str = ' you are considered to be obese.';
    }
    var locbmi = bmi.bmi / 100;
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.blue),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Spacer(),
          Text(_str,style: TextStyle(fontSize: 20),),
          Spacer(),
          Center(
            child: Container(
              height: 300,
              width: 300,
              child: LiquidCircularProgressIndicator(
                value: locbmi, // Defaults to 0.5.
                // Defaults to the current Theme's accentColor.
                backgroundColor: Colors
                    .white, // Defaults to the current Theme's backgroundColor.
                borderColor: Color.fromRGBO(90, 205, 217, 1),
                borderWidth: 5.0,
                direction: Axis
                    .vertical, // The direction the liquid moves (Axis.vertical = bottom to top, Axis.horizontal = left to right). Defaults to Axis.vertical.
                center: Text((bmi.bmi).toString()),
              ),
            ),
          ),
          Spacer(),
          GestureDetector(
            onTap: () {
              if(_saved){
                Navigator.pushNamed(context, MyChart.routeName);
              }else{
                BmiData data = new BmiData(
                    name: bmi.name,
                    height: bmi.height,
                    weight: bmi.weight,
                    bmi: bmi.bmi,
                    date: bmi.date);
                BMI.saveBmi(data);
                setState(() {
                  _saved=true;
                });

              }

            },
            child: Container(
              margin: EdgeInsets.only(bottom: 10),
              height: MediaQuery.of(context).size.height * .06,
              width: MediaQuery.of(context).size.width * .8,
              child: Center(child:_saved?Text("Go To Chart"): Text("Save The Result")),
              decoration: BoxDecoration(
                gradient: MyTheme.linearGradient,
                borderRadius: BorderRadius.circular(10),
                boxShadow: MyTheme.customShodowforButton,
              ),
            ),
          ),
          Spacer(),
        ],
      ),
    );
  }
}
