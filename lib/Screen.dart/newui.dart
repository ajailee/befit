import 'package:befit/Screen.dart/Theme/MyTheme.dart';
import 'package:befit/Screen.dart/results.dart';
import 'package:flutter/material.dart';
import 'package:height_slider/height_slider.dart';

class NewUI extends StatefulWidget {
  static String routeName = 'homePage';
  @override
  _NewUIState createState() => _NewUIState();
}

class _NewUIState extends State<NewUI> {
  int height = 170;
  TextEditingController _ageController = new TextEditingController(text: '20');
  TextEditingController _weightController =
      new TextEditingController(text: '40');
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        child: Column(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * .060,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () => Scaffold.of(context).openDrawer(),
                  child: Container(
                    child: Icon(Icons.menu),
                    margin: EdgeInsets.all(10),
                    height: 50,
                    width: 50,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                      boxShadow: MyTheme.customShodowforCircle,
                    ),
                  ),
                ),
                Text(
                  'Be Fit',
                  style: TextStyle(fontSize: 35, color: Colors.grey[600]),
                ),
                GestureDetector(
                  onTap: () => Scaffold.of(context).openEndDrawer(),
                  child: Container(
                    child: Icon(Icons.person),
                    margin: EdgeInsets.all(10),
                    height: 50,
                    width: 50,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                      boxShadow: MyTheme.customShodowforCircle,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * .015,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  height: MediaQuery.of(context).size.height * .091,
                  width: MediaQuery.of(context).size.width * .4,
                  child: Center(child: Text('Male')),
                  decoration: BoxDecoration(
                    gradient: MyTheme.linearGradient,
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: MyTheme.customShodowforButton,
                  ),
                ),
                Container(
                  height: MediaQuery.of(context).size.height * .091,
                  width: MediaQuery.of(context).size.width * .4,
                  child: Center(child: Text('Female')),
                  decoration: BoxDecoration(
                    gradient: MyTheme.linearGradient,
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: MyTheme.customShodowforButton,
                  ),
                )
              ],
            ),
            Row(
              children: [
                Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: MyTheme.customShodowforCircle),
                  margin: EdgeInsets.all(30),
                  height: MediaQuery.of(context).size.height * 0.61,
                  // color: Colors.red,
                  child: HeightSlider(
                    maxHeight: 200,
                    minHeight: 100,
                    height: height,
                    onChange: (val) => setState(() => height = val),
                    unit: 'cm', // optional
                  ),
                  width: MediaQuery.of(context).size.width * 0.4,
                ),
                Column(
                  children: [
                    Container(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text('Weight'),
                          TextField(
                            textAlign: TextAlign.center,
                            textInputAction: TextInputAction.done,
                            controller: _weightController,
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                                alignLabelWithHint: true,
                                fillColor: Colors.white,
                                filled: true,
                                border: InputBorder.none),
                            onSubmitted: (value) {
                              _weightController.text = value;
                            },
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              GestureDetector(
                                onTap: () {
                                  _weightController.text =
                                      (int.parse(_weightController.text) + 1)
                                          .toString();
                                },
                                child: Container(
                                  child: Icon(Icons.add),
                                  margin: EdgeInsets.all(10),
                                  height: 50,
                                  width: 50,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    shape: BoxShape.circle,
                                    boxShadow: MyTheme.customShodowforCircle,
                                  ),
                                ),
                              ),
                              GestureDetector(
                                onTap: () {
                                  _weightController.text =
                                      (int.parse(_weightController.text) - 1)
                                          .toString();
                                },
                                child: Container(
                                  child: Icon(Icons.remove),
                                  margin: EdgeInsets.all(10),
                                  height: 50,
                                  width: 50,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    shape: BoxShape.circle,
                                    boxShadow: MyTheme.customShodowforCircle,
                                  ),
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20),
                          boxShadow: MyTheme.customShodowforCircle),
                      height: MediaQuery.of(context).size.height * 0.3,
                      width: MediaQuery.of(context).size.width * 0.4,
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 10),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text('Age'),
                          TextField(
                            textAlign: TextAlign.center,
                            textInputAction: TextInputAction.done,
                            controller: _ageController,
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                                alignLabelWithHint: true,
                                fillColor: Colors.white,
                                filled: true,
                                border: InputBorder.none),
                            onSubmitted: (value) {
                              _weightController.text = value;
                            },
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              GestureDetector(
                                onTap: () {
                                  _ageController.text =
                                      (int.parse(_ageController.text) + 1)
                                          .toString();
                                },
                                child: Container(
                                  child: Icon(Icons.add),
                                  margin: EdgeInsets.all(10),
                                  height: 50,
                                  width: 50,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    shape: BoxShape.circle,
                                    boxShadow: MyTheme.customShodowforCircle,
                                  ),
                                ),
                              ),
                              GestureDetector(
                                onTap: () {
                                  _ageController.text =
                                      (int.parse(_ageController.text) - 1)
                                          .toString();
                                },
                                child: Container(
                                  child: Icon(Icons.remove),
                                  margin: EdgeInsets.all(10),
                                  height: 50,
                                  width: 50,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    shape: BoxShape.circle,
                                    boxShadow: MyTheme.customShodowforCircle,
                                  ),
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20),
                          boxShadow: MyTheme.customShodowforCircle),
                      height: MediaQuery.of(context).size.height * 0.3,
                      width: MediaQuery.of(context).size.width * 0.4,
                    ),
                  ],
                )
              ],
            ),
            GestureDetector(
              onTap: () {
                double weight = double.parse(_weightController.text);
                double bmi = (weight / height / height * 10000);
                String _str = '';

                if (bmi < 18.5) {
                  _str = 'you are considered to be underweight.';
                } else if (bmi >= 18.5 && bmi <= 24.9) {
                  _str =
                      'you are considered to be within a healthy weight range';
                } else if (bmi >= 25.0 && bmi <= 29.9) {
                  _str = 'you are considered to be overweight';
                } else {
                  _str = ' you are considered to be obese.';
                }

                String stringbmi = bmi.toStringAsFixed(2);

                Navigator.pushNamed(context, Results.roteName,
                    arguments: double.parse(stringbmi));
              },
              child: Container(
                margin: EdgeInsets.only(bottom: 10),
                height: MediaQuery.of(context).size.height * .06,
                width: MediaQuery.of(context).size.width * .8,
                child: Center(child: Text("Let's Begin")),
                decoration: BoxDecoration(
                  gradient: MyTheme.linearGradient,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: MyTheme.customShodowforButton,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
