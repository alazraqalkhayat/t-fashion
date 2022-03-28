import 'package:flutter/material.dart';

class RestorePasswordModel extends ChangeNotifier{
  String _email="";

  changeEmail(String email){
    this._email=email;
    notifyListeners();
  }
}