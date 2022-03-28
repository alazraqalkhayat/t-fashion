import 'package:flutter/material.dart';
import 'package:t_fashion/Others/Constants.dart';
import 'package:t_fashion/Widgets/buttons/BasicButtonsContainer.dart';
import 'package:t_fashion/Widgets/buttons/BasicIconButtons.dart';
import 'package:t_fashion/Widgets/screen/BasicScreenStyle.dart';
import 'package:t_fashion/Widgets/texts/OverFlowText.dart';
import 'package:t_fashion/SavedLocations/widgets/SavedLocationWidget.dart';
import 'package:t_fashion/Widgets/texts/SubTitleText.dart';

class SavedLocationRoute extends StatefulWidget {
  @override
  _SavedLocationRouteState createState() => _SavedLocationRouteState();
}

class _SavedLocationRouteState extends State<SavedLocationRoute> {
  late double mediaHeight, mediaWidth;

  @override
  Widget build(BuildContext context) {
    checkOrientation(context);

    return SafeArea(
      child: Scaffold(
        body: BasicScreenStyle(
          paddingTop: 20,
          rightSideIconButton: BasicIconButtons(
            icon: Icons.arrow_forward_ios,
            iconColor: Colors.white,
            iconSize: 30,
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          middleWidget: SubTitleText(
            subTitle: "العناوين المحفوظه",
            fontSize: 25,
            color: Colors.white,
          ),
          leftSideIconButton: BasicIconButtons(
            icon: Icons.arrow_back_ios,
            iconColor: kDarkOrange,
            iconSize: 30,
            onPressed: () {
            },
          ),
          child: Column(
            children: [
              Expanded(
                flex: 4,
                child: SizedBox(
                  child: ListView.builder(

                    itemCount: 10,
                    scrollDirection: Axis.vertical,
                    itemBuilder: (context, index) {
                      return SavedLocationWidget(
                        locationName: SubTitleText(
                          subTitle: "شارع الاصبحي",
                          fontSize: 20,
                          color: kMyGrey,
                        ),
                        locationDescription: OverFlowText(
                          title:
                              "حي المقالح حي المقالح حي المقالح حي المقالح حي المقالح حي المقالح ",
                          maxLine: 1,
                        ),
                        onTap: () {
                          print("tapped");
                        },
                        onPressedRemoveIcon: () {
                          print("removed");
                        },
                      );
                    },
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: BasicButtonsContainer(
                  title: "إضاقه عنوان",
                  backgroundColor: kDarkOrange,
                  textColor: Colors.white,
                  onTap: (){
                    Navigator.pushNamed(context, kAddLocationRoute);
                  },
                ),
              ),
            ],
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

//              BasicButtonsContainer(title: "إضافه عنوان", backgroundColor: kDarkOrange, textColor: Colors.white, onTap: (){},),
