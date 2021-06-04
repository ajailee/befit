import 'dart:convert';

import 'package:befit/Model/bmiData.dart';
import 'package:befit/Provider/updateui.dart';
import 'package:shared_preferences/shared_preferences.dart';

class BMI {
  static Future<void> saveBmi(BmiData data) async {
    final prefs = await SharedPreferences.getInstance();
    List<BmiData> list = await getBmi(data.name);
    list.add(data);
    print(list);
    List<String> bmiEncoded =
        list.map((bmi) => jsonEncode(bmi.toJson())).toList();

    await prefs.setStringList(data.name, bmiEncoded);
    UpdateUI().savedUpdate();
  }

  static Future<List<BmiData>> getBmi(String name) async {
    List<BmiData> list = [];
    List<String> stringlist = [];
    //return list;
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    if (sharedPreferences.getStringList(name) != null) {
      stringlist = sharedPreferences.getStringList(name)!;

      list = stringlist
          .map((person) => BmiData.fromJson(json.decode(person)))
          .toList();
      print(list);
      return list;
    } else {
      return [];
    }
  }

  static Future<void> deleteBmi() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    await sharedPreferences.clear();
  }
}
