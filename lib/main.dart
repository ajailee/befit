import 'package:befit/Screen.dart/Theme/MyTheme.dart';
import 'package:befit/Screen.dart/newui.dart';
import 'package:befit/Screen.dart/results.dart';
import 'package:flutter/material.dart';

import 'Screen.dart/MyHomePage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: '𝐵𝑒 𝐹𝒾𝓉',
      theme: MyTheme.lightTheme,
      home: Scaffold(
        endDrawer: Drawer(),
        drawer: Drawer(),
        body: NewUI(),
      ),
      //initialRoute: '/',
      routes: {
        NewUI.routeName: (ctx) => NewUI(),
        Results.roteName: (ctx) => Results(),
      },
    );
  }
}
