// @dart=2.9

import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:t_fashion/features/users/presentation/pages/SingupRoute.dart';
import 'core/others/Constants.dart';
import 'features/AddLocation/presentation/pages/AddLocation.dart';
import 'features/Favorite/presentation/pages/FavoriteRoute.dart';
import 'features/Home/presentation/pages/HomeRoute.dart';
import 'features/Invoice/presentation/pages/InvoiceRoute.dart';
import 'features/Offers/presentation/pages/OffersRoute.dart';
import 'features/ProductDetails/presentation/pages/ProductDetails.dart';
import 'features/SavedLocations/presentation/pages/SavedLocationRoute.dart';
import 'features/Settings/presentation/pages/SettingsRoute.dart';
import 'features/Splash/BasicSplashRoute.dart';
import 'features/cart/presentation/pages/CartRoute.dart';
import 'features/users/presentation/pages/ConfirmPasseord.dart';
import 'features/users/presentation/pages/LoginRoute.dart';
import 'features/users/presentation/pages/ResstorePassword.dart';

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

