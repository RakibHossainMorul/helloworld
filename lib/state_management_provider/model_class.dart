import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:provider/provider.dart';

/*
//not using this class
class CounterModel extends ChangeNotifier {
  int _counterValue = 0;

  int get counterValue => _counterValue;

  void incrementCounter() {
    _counterValue++;
    notifyListeners();
  }
}
*/

class NamesModel extends ChangeNotifier {
  List<String> _names = [];

  List<String> get names => _names;

  void addName(String name) async {
    _names.add(name);
    notifyListeners();
  }

//Adding list data to local storage by shared preference
  addDataToLocalStorage() async {
    SharedPreferences prefs1 = await SharedPreferences.getInstance();
    prefs1.setStringList("items", _names);
  }

  //Retrive data from local storage by shared preference
  loadData() async {
    SharedPreferences prefs2 = await SharedPreferences.getInstance();
    List<String>? items = prefs2.getStringList("items");
    if (items != null) {
      _names = items;
      notifyListeners();
    }
  }
}
