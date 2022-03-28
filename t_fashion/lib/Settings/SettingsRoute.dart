import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:t_fashion/Settings/models/SettingsModel.dart';
import 'package:t_fashion/Widgets/buttons/BasicIconButtons.dart';
import 'package:t_fashion/Widgets/screen/BasicScreenStyle.dart';
import 'package:t_fashion/Widgets/drawer/EndDrawerWidget.dart';
import 'package:t_fashion/Widgets/screen/ScreenStyle.dart';
import 'package:t_fashion/Others/Constants.dart';
import 'package:t_fashion/Widgets/texts/SubTitleText.dart';

class SettingsRoute extends StatefulWidget {
  @override
  _SettingsRouteState createState() => _SettingsRouteState();
}

class _SettingsRouteState extends State<SettingsRoute> {
  late double mediaWidth, mediaHeight;

  @override
  Widget build(BuildContext context) {
    checkOrientation(context);

    return SafeArea(
      child: Scaffold(
        key: kSettingsRouteScaffoldKey,
        endDrawer: EndDrawerWidget(currentRoute: "الإعدادات",),
        body: BasicScreenStyle(
          paddingTop: 20,
          rightSideIconButton: GestureDetector(
            child: SvgPicture.asset("${kIconsPath}menu.svg"),
            onTap: (){
              kSettingsRouteScaffoldKey.currentState!.openEndDrawer();
            },
          ),

          middleWidget: SubTitleText(
            subTitle: "الاعدادات",
            fontSize: 30,
            color: Colors.white,
          ),
          leftSideIconButton: BasicIconButtons(
            icon: Icons.filter_list_alt,
            iconColor: kDarkOrange,
            iconSize: 30,
            onPressed: () {
              setState(() {
                print("asdf");
              });
            },
          ),
          child: ChangeNotifierProvider(
            create: (context) => SettingsModel(),
            child: Padding(
              padding: EdgeInsets.only(right: mediaWidth/20,top: mediaHeight/20,left: mediaWidth/20),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    textDirection: TextDirection.rtl,
                    children: [
                      Text("الوضع المظلم"),
                      Consumer<SettingsModel>(
                          builder: (context,settingsModel,child)=>Switch(
                            inactiveThumbColor: Colors.white,
                            thumbColor: MaterialStateProperty.all(Colors.white),
                            activeTrackColor: kDarkOrange,
                            inactiveTrackColor: kMyGrey,
                            activeColor: kDarkOrange,
                            value: settingsModel.nightMode,
                            onChanged: (newValue) {
                              settingsModel.changeNightMode(newValue);
                            },
                          ),
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  checkOrientation(BuildContext context) {
    Orientation orientation = MediaQuery.of(context).orientation;

    if (orientation == Orientation.landscape) {
      mediaWidth = MediaQuery.of(context).size.height;
      mediaHeight = MediaQuery.of(context).size.height;
    } else {
      mediaWidth = MediaQuery.of(context).size.width;
      mediaHeight = MediaQuery.of(context).size.height;
    }
  }

}
