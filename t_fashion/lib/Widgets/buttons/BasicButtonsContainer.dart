import 'package:flutter/material.dart';
import 'package:t_fashion/Others/Constants.dart';

class BasicButtonsContainer extends StatelessWidget {
  late String title;
  late Function onTap;
  late Color backgroundColor;
  late Color textColor;
  late double mediaHeight, mediaWidth;


  BasicButtonsContainer({required this.title, required this.backgroundColor,required this.textColor,required this.onTap});

  @override
  Widget build(BuildContext context) {
    checkOrientation(context);

    return Container(

      height: mediaHeight / 15,
      width: mediaWidth/ 1.9,
      margin: EdgeInsets.only(top: mediaHeight/ 20),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.all(
          Radius.circular(50),
        ),
      ),
      child: FlatButton(

        onPressed: () {
          onTap();
        },
        child: Text(
          title,
           style: TextStyle(
            color: textColor,
            fontSize: 20,
            fontWeight: FontWeight.bold,
            fontFamily: "El Messiri"
          ),
        ),
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
