import 'package:befit/Model/GraphModel.dart';
import 'package:befit/Model/bmiData.dart';
import 'package:befit/Provider/updateui.dart';
import 'package:befit/Screen.dart/DetailedChart.dart';
import 'package:befit/Theme/MyTheme.dart';
import 'package:befit/widget/Chart.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class MyChart extends StatefulWidget {
  static String routeName = '/results';
  @override
  _MyChartState createState() => _MyChartState();
}

class _MyChartState extends State<MyChart> {
  List<Color> gradientColors = [
    const Color(0xff23b6e6),
    const Color(0xff02d39a),
  ];
  List<GraphData> salesData = [];
  bool showAvg = false;
  void update(String str) {
    List<BmiData> ui = Provider.of<UpdateUI>(context, listen: false).list;
    salesData.clear();
    ui.forEach((element) {
      salesData.add(new GraphData(
          element.date.toString().substring(0, 11),
          str.contains('Weight')
              ? double.parse(element.weight.toString())
              : str.contains('Height')
                  ? double.parse(element.height.toString())
                  : element.bmi));
    });

    salesData.sort((a, b) {
      var adate = a.year; //before -> var adate = a.expiry;
      var bdate = b.year; //before -> var bdate = b.expiry;
      return adate.compareTo(
          bdate); //to get the order other way just switch `adate & bdate`
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          GestureDetector(
            onTap: () {
              update('Weight');
              Navigator.pushNamed(context, DetailedChart.routeName,
                  arguments: {'Weight': salesData});
            },
            child: Container(
              child: Column(
                children: [
                  Icon(
                    Icons.monitor_weight,
                    size: 100,
                  ),
                ],
              ),
              margin: EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
                boxShadow: MyTheme.customShodowforCircle,
              ),
            ),
          ),
          Text(
            'Weight Chart',
            style: TextStyle(fontSize: 30),
          ),
          GestureDetector(
            onTap: () {
              update('Height');
              Navigator.pushNamed(context, DetailedChart.routeName,
                  arguments: {'Height': salesData});
            },
            child: Container(
              child: Icon(
                Icons.height,
                size: 100,
              ),
              margin: EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
                boxShadow: MyTheme.customShodowforCircle,
              ),
            ),
          ),
          Text(
            'Height Chart',
            style: TextStyle(fontSize: 30),
          ),
          GestureDetector(
            onTap: () {
              update('BMI');
              Navigator.pushNamed(context, DetailedChart.routeName,
                  arguments: {'BMI': salesData});
            },
            child: Container(
              child: Icon(
                Icons.fitness_center,
                size: 100,
              ),
              margin: EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
                boxShadow: MyTheme.customShodowforCircle,
              ),
            ),
          ),
          Text(
            'BMI Chart',
            style: TextStyle(fontSize: 30),
          ),
        ],
      ),
    ));
  }
}
