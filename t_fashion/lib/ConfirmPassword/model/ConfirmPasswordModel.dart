import 'package:flutter/material.dart';

class ConfirmPasswordModel extends ChangeNotifier{

  String _password="",_confirmPasswrod="";

  changePassword(String password){
    this._password=password;
    notifyListeners();
  }
  changeConfirmPassword(String confirmPasswrod){
    this._confirmPasswrod=confirmPasswrod;
    notifyListeners();
  }
}