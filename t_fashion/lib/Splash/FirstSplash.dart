import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:t_fashion/Splash/widgets/SplashesWidget.dart';
import 'package:t_fashion/Others/Constants.dart';
import 'package:t_fashion/Widgets/texts/SubTitleText.dart';

class FirstSplash extends StatelessWidget {
  late double mediaHeight, mediaWidth;

  @override
  Widget build(BuildContext context) {

    checkOrientation(context);
    return SplashesWidget(
      firstTitle: "تمتع بخدمه افضل في شراء منتجاتك",
      imagePath: "firstSplashImage.png",
      child: Column(

        children: [
          SubTitleText(
            subTitle:
                "تمتع بخدمه افضل في شراء منتجاتك تمتع بخدمه افضل في شراء منتجاتك تمتع بخدمه افضل في شراء منتجاتك تمتع بخدمه افضل في شراء منتجاتك ",
            fontSize: 15,
            color: kMyGrey,
          ),


          Container(
            margin: EdgeInsets.only(top: mediaHeight/10),
            child: Image(
              image: AssetImage("${kImagesPath}first_splash_icon.png"),
            ),
          ),
        ],
      ),
    );
  }

  checkOrientation(BuildContext context) {
    Orientation orientation = MediaQuery.of(context).orientation;
    if (orientation == Orientation.landscape) {
      mediaHeight = MediaQuery.of(context).size.width;
      mediaWidth = MediaQuery.of(context).size.height;
    } else {
      mediaHeight = MediaQuery.of(context).size.height;
      mediaWidth = MediaQuery.of(context).size.width;
    }
  }

}
