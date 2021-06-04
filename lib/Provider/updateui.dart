import 'dart:convert';

import 'package:befit/Model/bmiData.dart';
import 'package:befit/Provider/Bmi.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UpdateUI extends ChangeNotifier {
  String _name = 'Unknown';
  List<BmiData> _list = [];
  get name {
    return _name;
  }

  get list {
    loadlist();
    return [..._list].toList();
  }

  loadlist() async {
    await getBmi(_name);
  }

  void updateuiName(String name) {
    _name = name;
    loadlist();
    notifyListeners();
  }

  Future<void> getBmi(String name) async {
    List<String> stringlist = [];
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    if (sharedPreferences.getStringList(name) != null) {
      stringlist = sharedPreferences.getStringList(name)!;
      _list = stringlist
          .map((person) => BmiData.fromJson(json.decode(person)))
          .toList();
      notifyListeners();
    } else {
      _list = [];
      notifyListeners();
    }
  }

  Future<void> deleteBmi() async {
    _name = 'Unknown';
    await BMI.deleteBmi();
    notifyListeners();
  }

  savedUpdate() {
    notifyListeners();
  }
}
