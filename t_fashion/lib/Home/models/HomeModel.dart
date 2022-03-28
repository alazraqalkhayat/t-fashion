import 'package:flutter/material.dart';

class HomeModel extends ChangeNotifier{
  String search="";

  changeSearch(String search){
    this.search=search;
    notifyListeners();
  }
}