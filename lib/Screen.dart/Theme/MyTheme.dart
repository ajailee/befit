import 'package:flutter/material.dart';

class MyTheme {
  static List<BoxShadow> customShodowforCircle = [
    BoxShadow(
      color: Colors.white.withOpacity(0.5),
      spreadRadius: -5,
      offset: Offset(-5, -5),
      blurRadius: 30,
    ),
    BoxShadow(
      color: Colors.blue[900]!.withOpacity(0.2),
      spreadRadius: 2,
      offset: Offset(7, 7),
      blurRadius: 20,
    )
  ];
  static ThemeData lightTheme = ThemeData(
      primaryColor: Color.fromRGBO(89, 200, 229, 1),
      accentColor: Color.fromRGBO(90, 205, 217, 1),
      scaffoldBackgroundColor: Color.fromRGBO(237, 237, 237, 1),
      iconTheme: IconThemeData(
        color: Colors.grey[700],
      ));

  static LinearGradient linearGradient = LinearGradient(colors: [
    Color.fromRGBO(89, 200, 229, 1),
    Color.fromRGBO(90, 205, 217, 1)
  ]);
  static List<BoxShadow> customShodowforButton = [
    BoxShadow(
      color: Colors.white,
      spreadRadius: 2,
      offset: Offset(-7, -7),
      blurRadius: 30,
    ),
    BoxShadow(
      color: Colors.black.withOpacity(0.2),
      spreadRadius: 2,
      offset: Offset(-5, -5),
      blurRadius: 20,
    )
  ];
}
