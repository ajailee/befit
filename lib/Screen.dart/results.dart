import 'package:flutter/material.dart';
import 'package:liquid_progress_indicator_ns/liquid_progress_indicator.dart';

class Results extends StatelessWidget {
  static String roteName = '/resultsPage';

  @override
  Widget build(BuildContext context) {
    String _str;
    double bmi = ModalRoute.of(context)!.settings.arguments as double;
    print(bmi);
    if (bmi < 18.5) {
      _str = 'you are considered to be underweight.';
    } else if (bmi >= 18.5 && bmi <= 24.9) {
      _str = 'you are considered to be within a healthy weight range';
    } else if (bmi >= 25.0 && bmi <= 29.9) {
      _str = 'you are considered to be overweight';
    } else {
      _str = ' you are considered to be obese.';
    }
    bmi = bmi / 100;
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
          Text(_str),
          Spacer(),
          Center(
            child: Container(
              height: 300,
              width: 300,
              child: LiquidCircularProgressIndicator(
                value: bmi, // Defaults to 0.5.
                valueColor: AlwaysStoppedAnimation(Colors
                    .blue), // Defaults to the current Theme's accentColor.
                backgroundColor: Colors
                    .white, // Defaults to the current Theme's backgroundColor.
                borderColor: Colors.blue,
                borderWidth: 5.0,
                direction: Axis
                    .vertical, // The direction the liquid moves (Axis.vertical = bottom to top, Axis.horizontal = left to right). Defaults to Axis.vertical.
                center: Text((bmi * 100).toString()),
              ),
            ),
          ),
          Spacer(),
        ],
      ),
    );
  }
}
