import 'package:flutter/material.dart';

class ProductDetailsModel extends ChangeNotifier{
  int counter=1;
  String iconName="heart_add.svg";

  increesCounter(){
    counter++;
    notifyListeners();
  }

  decreesCounter(){
    counter > 1? counter--: counter == 0? counter++: print("can not decrees : count is ${counter}");
    notifyListeners();
  }

  changeIconName(String iconName){
    this.iconName=iconName;
    notifyListeners();
  }

}