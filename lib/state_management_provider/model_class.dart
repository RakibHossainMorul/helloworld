import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MyWidgetState with ChangeNotifier {
  final RegExp regExp = RegExp(r'[.,/@]');
  final TextEditingController _controller = TextEditingController();
  int counter = 0;
  List<String> _names = [];

  //adding controller data to list
  void addName(String name) {
    _names.add(name);
    notifyListeners();
  }

  //Increment counter value and set data in shared prefercence
  void incrementCounter() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    counter++;
    prefs.setInt('counter', counter);
    notifyListeners();
  }

  //Retrieving counter value from shared prefercence
  void loadCounter() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    counter = (prefs.getInt('counter') ?? 0);
    notifyListeners();
  }

  //remove counter value data from shared prefercence
  void removeCounterValue() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.remove('counter');
    counter = (prefs.getInt('counter') ?? 0);
    notifyListeners();
  }

  //Adding list data to local storage by shared preference
  void addListData() async {
    SharedPreferences prefs1 = await SharedPreferences.getInstance();
    prefs1.setStringList("items", _names);
    notifyListeners();
  }

  //Retrive data from local storage by shared preference
  void loadListData() async {
    SharedPreferences prefs2 = await SharedPreferences.getInstance();
    List<String>? items = prefs2.getStringList("items");
    if (items != null) {
      _names = items;
    }
    notifyListeners();
  }

  //remove List value data from shared prefercence
  void removeListValue() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.remove('items');
    _names = (prefs.getStringList('items') ?? []);
    notifyListeners();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
