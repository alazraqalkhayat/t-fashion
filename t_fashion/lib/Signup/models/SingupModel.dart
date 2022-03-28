import 'package:flutter/material.dart';

class SignupModel extends ChangeNotifier{

  String _userName="",_email="",_password="",_confirmPassword="",_phoneNumber="";

  changeUserName(String userName){
    this._userName=userName;
    notifyListeners();
  }

  changeEmail(String email){
    this._email=email;
    notifyListeners();
  }

  changePassword(String password){
    this._password=password;
    notifyListeners();
  }

  changeConfirmPassword(String confirmPassword){
    this._confirmPassword=confirmPassword;
    notifyListeners();
  }

  changePhoneNumber(String phoneNumber){
    this._phoneNumber=phoneNumber;
    notifyListeners();
  }
}