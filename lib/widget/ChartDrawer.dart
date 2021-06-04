import 'package:befit/Model/GraphModel.dart';
import 'package:befit/Model/bmiData.dart';
import 'package:befit/Provider/updateui.dart';
import 'package:befit/Screen.dart/DetailedChart.dart';
import 'package:befit/Theme/MyTheme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ChartDrawer extends StatefulWidget {


  @override
  _ChartDrawerState createState() => _ChartDrawerState();
}

class _ChartDrawerState extends State<ChartDrawer> {
  List<GraphData> salesData = [];
  void update(String str){
    List<BmiData> ui = Provider.of<UpdateUI>(context,listen: false).list;
    salesData.clear();
    ui.forEach((element) {
      salesData.add(
          new GraphData(element.date.toString().substring(0, 11), str.contains('Weight')?double.parse( element.weight.toString()) :str.contains('Height')?double.parse(element.height.toString()):element.bmi));
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
    return Drawer(
      child: Container(
        decoration: BoxDecoration(
          boxShadow: MyTheme.customShodowforCircle,
          gradient: LinearGradient(colors: [Colors.grey.shade500,Colors.white]),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [

           GestureDetector(
              onTap: () {
                update('Weight');
                Navigator.pushNamed(context, DetailedChart.routeName,arguments: {'Weight':salesData});
              },
              child: Container(
                child: Column(
                  children: [
                    Icon(Icons.monitor_weight,size: 100,),

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
          Text('Weight Chart',style: TextStyle(fontSize: 30),),

          GestureDetector(
            onTap: (){
              update('Height');
              Navigator.pushNamed(context, DetailedChart.routeName,arguments: {'Height':salesData});
            },
            child: Container(
              child: Icon(Icons.height,size: 100,),
              margin: EdgeInsets.all(10),

              decoration: BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
                boxShadow: MyTheme.customShodowforCircle,
              ),
            ),
          ),
            Text('Height Chart',style: TextStyle(fontSize: 30),),
            GestureDetector(
            onTap: (){
              update('BMI');
              Navigator.pushNamed(context, DetailedChart.routeName,arguments: {'BMI':salesData});
            },
            child: Container(
              child: Icon(Icons.fitness_center,size: 100,),
              margin: EdgeInsets.all(10),

              decoration: BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
                boxShadow: MyTheme.customShodowforCircle,
              ),
            ),
          ),
            Text('BMI Chart',style: TextStyle(fontSize: 30),),
        ],),
      )
    );
  }
}
