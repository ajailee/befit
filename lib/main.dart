import 'package:befit/Provider/updateui.dart';
import 'package:befit/Screen.dart/DetailedChart.dart';
import 'package:befit/Screen.dart/chart.dart';
import 'package:befit/widget/ChartDrawer.dart';
import 'package:befit/widget/bottomDrawer.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import '/Theme/MyTheme.dart';
import 'package:befit/Screen.dart/newui.dart';
import 'package:befit/Screen.dart/results.dart';
import 'package:flutter/material.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp,DeviceOrientation.landscapeRight]);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => UpdateUI(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: '𝐵𝑒 𝐹𝒾𝓉',
        theme: MyTheme.lightTheme,
        home: Scaffold(
          drawer: BottomDrawer(),
          endDrawer: ChartDrawer(),
          body: NewUI(),
        ),

        //initialRoute: '/',
        routes: {
          NewUI.routeName: (ctx) => NewUI(),
          Results.roteName: (ctx) => Results(),
          MyChart.routeName: (ctx) => MyChart(),
          DetailedChart.routeName:(ctx)=>DetailedChart(),
        },
      ),
    );
  }
}
