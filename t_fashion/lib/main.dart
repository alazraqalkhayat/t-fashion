// @dart=2.9

import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:t_fashion/AddLocation/AddLocation.dart';
import 'package:t_fashion/Cart/CartRoute.dart';
import 'package:t_fashion/confirmPassword/ConfirmPasseord.dart';
import 'package:t_fashion/Favorite/FavoriteRoute.dart';
import 'package:t_fashion/Invoice/InvoiceRoute.dart';
import 'package:t_fashion/Login/LoginRoute.dart';
import 'package:t_fashion/Offers/OffersRoute.dart';
import 'package:t_fashion/ProductDetails/ProductDetails.dart';
import 'package:t_fashion/restorePassword/ResstorePassword.dart';
import 'package:t_fashion/Settings/SettingsRoute.dart';
import 'package:t_fashion/Signup/SingupRoute.dart';
import 'package:t_fashion/Splash/BasicSplashRoute.dart';
import 'package:t_fashion/Invoice/InvoiceRoute.dart';

import 'Others/Constants.dart';
import 'Home/HomeRoute.dart';
import 'SavedLocations/SavedLocationRoute.dart';

void main() {
 return runApp(
   DevicePreview(builder: (context){
     return MyApp();
   })

 );
}

class MyApp extends StatelessWidget {

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      builder: DevicePreview.appBuilder,
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: kSplashRoute,

      routes:{
        kHomeRoute:(context)=>HomeRoute(),
        kLoginRoute:(context)=>LoginRoute(),
        kSignupRoute:(context)=>SignupRoute(),
        kRestorePassword:(context)=>RestorePassword(),
        kConfirmPassword:(context)=>ConfirmPassword(),
        kSettings:(context)=>SettingsRoute(),
        kFavoriteRoute:(context)=>FavoriteRoute(),
        kCartRoute:(context)=>CartRoute(),
        kOffersRoute:(context)=>OffersRoute(),
        kSplashRoute:(context)=>BasicSplashRoute(),
        kProductDetailsRoute:(context)=>ProductDetails(),
        kSavedLocationRoute:(context)=>SavedLocationRoute(),
        kInvoiceRoute:(context)=>InvoiceRoute(),
        kAddLocationRoute:(context)=>AddLocation(),

      },
    );
  }
}

