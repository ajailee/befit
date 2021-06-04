import 'package:befit/Provider/updateui.dart';
import 'package:befit/Provider/Bmi.dart';
import 'package:befit/Theme/MyTheme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class BottomDrawer extends StatefulWidget {
  static String chosenValue = 'Unknown';
  @override
  _BottomDrawerState createState() => _BottomDrawerState();
}

class _BottomDrawerState extends State<BottomDrawer> {
  List<String> _list = [];
  bool _deleting = false;
  TextEditingController _nameController = new TextEditingController();
  @override
  void initState() {
    fetchUser();
    super.initState();
  }

  @override
  void dispose() {
    _nameController.clear();
    super.dispose();
  }

  Future<void> fetchUser() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    _list = sharedPreferences.getStringList('UserData') ?? ['Unknown'];
    setState(() {});
  }

  Future<void> addUser(String name) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    _list.add(name);
    sharedPreferences.setStringList('UserData', _list);
  }

  _showDialog() async {
    await showDialog<String>(
      context: context,
      builder: (BuildContext context) {
        return new AlertDialog(
          contentPadding: const EdgeInsets.all(16.0),
          content: new Row(
            children: <Widget>[
              new Expanded(
                child: new TextField(
                  controller: _nameController,
                  autofocus: true,
                  decoration: new InputDecoration(
                      labelText: 'Full Name', hintText: 'eg. Ajay Lee'),
                ),
              )
            ],
          ),
          actions: <Widget>[
            new TextButton(
                child: const Text('CANCEL'),
                onPressed: () {
                  Navigator.pop(context);
                }),
            new TextButton(
                child: const Text('OPEN'),
                onPressed: () {
                  if (_nameController.text.isEmpty) {
                    _nameController.text = DateTime.now().toIso8601String();
                  } else {
                    addUser(_nameController.text);
                    Navigator.pop(context);
                    setState(() {});
                  }
                })
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    UpdateUI ui = Provider.of<UpdateUI>(context);
    return _deleting
        ? CircularProgressIndicator()
        : Drawer(
            child: Container(
              decoration: BoxDecoration(
                boxShadow: MyTheme.customShodowforCircle,
                gradient: LinearGradient(
                    colors: [Colors.grey.shade400, Colors.white]),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.person,
                    size: 200,
                  ),
                  Divider(),
                  Text('Select The User', style: TextStyle(fontSize: 20)),
                  DropdownButton<String>(
                    focusColor: Colors.white,
                    value: BottomDrawer.chosenValue,
                    //elevation: 5,
                    style: TextStyle(color: Colors.white),
                    iconEnabledColor: Colors.black,
                    items: _list.map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(
                          value,
                          style: TextStyle(color: Colors.black),
                        ),
                      );
                    }).toList(),
                    hint: Text(
                      "Please Add The User",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 14,
                          fontWeight: FontWeight.w500),
                    ),
                    onChanged: (value) {
                      setState(() {
                        BottomDrawer.chosenValue = value as String;
                        ui.updateuiName(value);
                      });
                    },
                  ),
                  Divider(),
                  ListTile(
                    onTap: () {
                      _showDialog();
                    },
                    title: Center(
                        child:
                            Text('Add User', style: TextStyle(fontSize: 20))),
                    subtitle: Text("Create New User If You Don't Exist"),
                  ),
                  Divider(),
                  ListTile(
                    onTap: () async {
                      await ui.deleteBmi();
                      BottomDrawer.chosenValue = 'Unknown';
                      ui.updateuiName('Unknown');
                      Navigator.of(context).pop();
                    },
                    subtitle:
                        Text('Delete the data that is stored in the device'),
                    title: Center(
                        child: Text(
                      'Clear Data',
                      style: TextStyle(fontSize: 20),
                    )),
                  ),
                  Divider(),
                ],
              ),
            ),
          );
  }
}
