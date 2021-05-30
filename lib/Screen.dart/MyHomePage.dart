import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  TextEditingController _heightController = new TextEditingController();
  TextEditingController _weightController = new TextEditingController();
  bool _isMale = true;
  String stringbmi = '';
  String bmistatus = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          '𝐵𝑒 𝐹𝒾𝓉',
          style: TextStyle(fontSize: 40),
        ),
      ),
      body: Column(
        children: [
          SizedBox(
            height: 30,
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextButton.icon(
                    label: _isMale ? Text("Male") : Text("Female"),
                    onPressed: () {
                      setState(() {
                        _isMale = !_isMale;
                      });
                    },
                    icon: Icon(
                      _isMale ? Icons.male : Icons.female,
                      size: MediaQuery.of(context).size.height * .08,
                    ),
                    style: TextButton.styleFrom()),
              ],
            ),
          ),
          SizedBox(
            height: 40,
          ),
          Padding(
            padding: EdgeInsets.all(10),
            child: TextField(
              textInputAction: TextInputAction.next,
              controller: _heightController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                hintText: "Enter your Height in cm eg:170",
                labelText: "Height",
                fillColor: Colors.grey[200],
                filled: true,
                border: OutlineInputBorder(
                  borderSide: BorderSide(style: BorderStyle.solid),
                  gapPadding: 10,
                ),
              ),
            ),
          ),
          SizedBox(
            height: 40,
          ),
          //Slider(value: 100, onChanged: (value) {}),
          Padding(
            padding: EdgeInsets.all(10),
            child: TextField(
              textInputAction: TextInputAction.done,
              controller: _weightController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                hintText: "Enter your Weight in Kg eg:60",
                labelText: "Weight",
                fillColor: Colors.grey[200],
                filled: true,
                border: OutlineInputBorder(
                  borderSide: BorderSide(style: BorderStyle.solid),
                  gapPadding: 10,
                ),
              ),
              onSubmitted: (value) {
                double height = double.parse(_heightController.text);
                double weight = double.parse(_weightController.text);
                claculate(height, weight);
              },
            ),
          ),
          Center(child: Text('Your BMI')),
          Text(stringbmi),
          Text('Status'),
          Text(bmistatus),
          // TextField(InputDecoration(labelText: "Height"),),
        ],
      ),
    );
  }

  void claculate(double height, double weight) {
    double bmi = (weight / height / height * 10000);
    String _str = '';

    if (bmi < 18.5) {
      _str = 'you are considered to be underweight.';
    } else if (bmi >= 18.5 && bmi <= 24.9) {
      _str = 'you are considered to be within a healthy weight range';
    } else if (bmi >= 25.0 && bmi <= 29.9) {
      _str = 'you are considered to be overweight';
    } else {
      _str = ' you are considered to be obese.';
    }

    setState(() {
      stringbmi = bmi.toStringAsFixed(2);
      bmistatus = _str;
    });
    _heightController.clear();
    _weightController.clear();
  }
}
