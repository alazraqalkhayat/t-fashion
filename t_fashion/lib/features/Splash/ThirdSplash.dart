import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:t_fashion/core/others/Constants.dart';
import 'package:t_fashion/core/widgets/buttons/BasicButtonsContainer.dart';

import 'widgets/SplashesWidget.dart';

class ThirdSplash extends StatelessWidget {

  late SharedPreferences preferences;

  @override
  Widget build(BuildContext context) {
    return SplashesWidget(
      firstTitle: "تمتع بخدمه افضل في شراء منتجاتك",
      imagePath: "thirdSplashImage.png",
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          BasicButtonsContainer(
              title: "إبدأ التسوق",
              backgroundColor: kDarkOrange,
              textColor: Colors.white,
              onTap: () {
                Navigator.pushReplacementNamed(context, kHomeRoute);
                saveDate();
              }),

          BasicButtonsContainer(
              title: "تسجيل الدخول",
              backgroundColor: Colors.white,
              textColor: kDarkOrange,
              onTap: () {
                Navigator.pushReplacementNamed(context, kLoginRoute);
                saveDate();
              }),


        ],
      )
    );
  }

  saveDate() async {
    preferences = await SharedPreferences.getInstance();
    preferences.setString("Splash", "showed");
  }

}
