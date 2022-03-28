import 'package:flutter/cupertino.dart';

class AddLocationModel extends ChangeNotifier{

  String _location="",_locationName="";

  changeLocation(String location){
    this._location=location;
    notifyListeners();
  }

  changeLocationName(String locationName){
    this._locationName=locationName;
    notifyListeners();
  }



}