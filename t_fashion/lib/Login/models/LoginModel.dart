import 'package:flutter/material.dart';

class LoginModel extends ChangeNotifier{

  String userName="",password="";
  bool rememberMe=false;

  changeUserName(String userName){
    this.userName=userName;
    notifyListeners();

  }

  changePassword(String password){
    this.password=password;
    notifyListeners();

  }

  changeRememberMe(bool rememberMe){
    this.rememberMe=rememberMe;
    notifyListeners();

  }

}