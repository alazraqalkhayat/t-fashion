import 'package:flutter/material.dart';

class SettingsModel extends ChangeNotifier{
  bool nightMode=false;

  changeNightMode(bool nightMode){
    this.nightMode=nightMode;
    notifyListeners();
  }
}