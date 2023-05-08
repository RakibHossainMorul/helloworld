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
}
