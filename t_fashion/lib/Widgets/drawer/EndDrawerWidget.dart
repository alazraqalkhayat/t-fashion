import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:t_fashion/Widgets/buttons/BasicButtonsContainer.dart';
import 'package:t_fashion/Widgets/buttons/BasicIconButtons.dart';
import 'package:t_fashion/Widgets/drawer/EndDrawerListTile.dart';
import 'package:t_fashion/Others/Constants.dart';
import 'package:t_fashion/Widgets/texts/SubTitleText.dart';
import 'package:url_launcher/url_launcher.dart';

class EndDrawerWidget extends StatefulWidget {
  var currentRoute;

  EndDrawerWidget({required this.currentRoute});

  @override
  State<EndDrawerWidget> createState() => _EndDrawerWidgetState();
}

class _EndDrawerWidgetState extends State<EndDrawerWidget> {
  late String currentRoute, loginAndLogout = "", _orientation;
  String userName = "";

  late SharedPreferences preferences;
  late double mediaHeight, mediaWidth;
  int navigationDrawerHeaderFlex = 2;

  @override
  Widget build(BuildContext context) {
    getData();

    checkOrientation(context);

    return Drawer(
      child: Stack(
        children: [
          Row(
            children: [
              Expanded(
                flex: 1,
                child: Container(
                  color: Colors.white,
                ),
              ),
              Expanded(
                flex: 1,
                child: Container(
                  color: kDarkOrange,
                ),
              )
            ],
          ),
          Column(
            children: [
              Expanded(
                flex: _orientation == "portrait"
                    ? navigationDrawerHeaderFlex = 2
                    : navigationDrawerHeaderFlex = 4,
                child: Container(
                  decoration: BoxDecoration(
                    color: kDarkOrange,
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(70),
                    ),
                  ),
                  height: mediaHeight / 7,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: 10,
                      ),
                      Expanded(
                        flex: 2,
                        child: CircleAvatar(
                          radius: 80,
                          backgroundColor: Colors.blue,
                          backgroundImage:
                              AssetImage("${kImagesPath}image.jpg"),
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          textDirection: TextDirection.rtl,
                          children: [
                            SubTitleText(
                              subTitle: userName,
                              fontSize: 20,
                              color: Colors.white,
                            ),

                            SizedBox(width: 10,),
                            GestureDetector(
                              child: SvgPicture.asset("${kIconsPath}edit.svg"),
                              onTap: (){
                                print("edit pressed");
                              },
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
              Expanded(
                flex: 5,
                child: Container(
                  // margin: EdgeInsets.only(top: 170),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(70),
                    ),
                  ),
                  width: double.infinity,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ListView(
                      children: [
                        const SizedBox(
                          height: 20,
                        ),
                        EndDrawerListTile(
                          title: "الرئيسيه",
                          icon_name: "home.svg",
                          onTap: () {
                            if (widget.currentRoute != "الرئيسيه") {
                              Navigator.pushReplacementNamed(
                                  context, kHomeRoute);
                            }
                          },
                        ),
                        EndDrawerListTile(
                          title: "المفضله",
                          icon_name: "heart.svg",
                          onTap: () {
                            if (widget.currentRoute != "المفضله") {
                              Navigator.pushReplacementNamed(
                                  context, kFavoriteRoute);
                            }
                          },
                        ),
                        EndDrawerListTile(
                          title: "السله",
                          icon_name: "shopping_cart.svg",
                          onTap: () {
                            if (widget.currentRoute != "السله") {
                              Navigator.pushReplacementNamed(
                                  context, kCartRoute);
                            }
                          },
                        ),
                        EndDrawerListTile(
                          title: "الإعدادات",
                          icon_name: "setting.svg",
                          onTap: () {
                            if (widget.currentRoute != "الإعدادات") {
                              Navigator.pushReplacementNamed(
                                  context, kSettings);
                            }
                          },
                        ),
                        EndDrawerListTile(
                          title: "تواصل معنا",
                          icon_name: "mobile.svg",
                          onTap: () {
                            if (widget.currentRoute != "الرئيسيه") {
                              Navigator.pushReplacementNamed(
                                  context, kHomeRoute);
                            }
                          },
                        ),
                        EndDrawerListTile(
                          title: "عن التطبيق",
                          icon_name: "info_circle.svg",
                          onTap: () {
                            final snackBar = SnackBar(
                              padding: EdgeInsets.zero,
                              elevation: 20,
                              backgroundColor: Colors.white,
                              content: Container(
                                height: _orientation == "portrait"
                                    ? mediaHeight / 2.5
                                    : mediaHeight / 2.8,
                                padding: EdgeInsets.all(50),
                                decoration: BoxDecoration(
                                    color: Colors.transparent,
                                    borderRadius: BorderRadius.only(
                                      topRight: Radius.circular(20),
                                      topLeft: Radius.circular(20),
                                    ),
                                    border:
                                        Border.all(color: kMyGrey, width: 1)),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    SubTitleText(
                                      subTitle: "عن التطبيق",
                                      fontSize: 25,
                                      color: kDarkOrange,
                                    ),
                                    SubTitleText(
                                      subTitle:
                                          "تطبيق T-FAHSION هو احد التطبيقات الذي يقوم بــ والله العظيم صدق ولا مشتيت ..!",
                                      fontSize: 15,
                                      color: kMyGrey,
                                    ),
                                    BasicButtonsContainer(
                                      title: "شكراً",
                                      backgroundColor: kDarkOrange,
                                      textColor: Colors.white,
                                      onTap: () {
                                        ScaffoldMessenger.of(context)
                                            .hideCurrentSnackBar();
                                      },
                                    ),
                                  ],
                                ),
                              ),
                            );
                            ScaffoldMessenger.of(context)
                                .showSnackBar(snackBar);
                            Navigator.of(context).pop(true);
                          },
                        ),
                        EndDrawerListTile(
                          title: "تقييم التطبيق",
                          icon_name: "Star.svg",
                          onTap: () {
                            final snackBar = SnackBar(
                              duration: Duration(seconds: 5),
                              padding: EdgeInsets.zero,
                              elevation: 20,
                              backgroundColor: Colors.white,
                              content: Container(
                                height: _orientation == "portrait"
                                    ? mediaHeight / 2.5
                                    : mediaHeight / 2.8,
                                padding: EdgeInsets.all(50),
                                decoration: BoxDecoration(
                                    color: Colors.transparent,
                                    borderRadius: BorderRadius.only(
                                      topRight: Radius.circular(20),
                                      topLeft: Radius.circular(20),
                                    ),
                                    border:
                                        Border.all(color: kMyGrey, width: 1)),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    SubTitleText(
                                      subTitle: "قيم التطبيق",
                                      fontSize: 25,
                                      color: kDarkOrange,
                                    ),
                                    RatingBar.builder(
                                      initialRating: 5,
                                      minRating: 1,
                                      direction: Axis.horizontal,
                                      allowHalfRating: true,
                                      updateOnDrag: false,
                                      itemCount: 5,
                                      itemPadding:
                                          EdgeInsets.symmetric(horizontal: 4.0),
                                      itemBuilder: (context, _) => Icon(
                                        Icons.star,
                                        color: Colors.amber,
                                      ),
                                      onRatingUpdate: (double value) {},
                                    ),
                                    BasicButtonsContainer(
                                      title: "تقييم",
                                      backgroundColor: kDarkOrange,
                                      textColor: Colors.white,
                                      onTap: () {
                                        openPlayStore();
                                      },
                                    ),
                                  ],
                                ),
                              ),
                            );
                            ScaffoldMessenger.of(context)
                                .showSnackBar(snackBar);

                            Navigator.of(context).pop(true);
                          },
                        ),
                        EndDrawerListTile(
                          title: "مشاركه التطبيق",
                          icon_name: "share.svg",
                          onTap: () {
                            print("مشاركه التطبيق");
                          },
                        ),
                        EndDrawerListTile(
                          title: loginAndLogout,
                          icon_name: loginAndLogout == "تسجيل الخروج"
                              ? "Logout.svg"
                              : "Logout.svg",
                          onTap: () {
                            loginAndLogout == "تسجيل الخروج"
                                ? logout()
                                : login();
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }

  Future<void> getData() async {
    preferences = await SharedPreferences.getInstance();

    userName = preferences.getString("userNAme") ?? "";

    setState(() {
      if (userName != "") {
        loginAndLogout = "تسجيل الخروج";
      } else {
        loginAndLogout = "تسجيل الدخول";
        userName = "T-Fashion";
      }
    });
  }

  logout() async {
    preferences = await SharedPreferences.getInstance();
    preferences.setString("userNAme", "");
    Navigator.pop(context);
    Navigator.pushNamed(context, kHomeRoute);
  }

  login() {
    Navigator.pushNamed(context, kLoginRoute);
  }

  checkOrientation(BuildContext context) {
    setState(() {
      Orientation orientation = MediaQuery.of(context).orientation;
      if (orientation == Orientation.landscape) {
        mediaHeight = MediaQuery.of(context).size.width;
        mediaWidth = MediaQuery.of(context).size.height;
        _orientation = "landSpace";
      } else {
        _orientation = "portrait";
        mediaHeight = MediaQuery.of(context).size.height;
        mediaWidth = MediaQuery.of(context).size.width;
      }
    });
  }

  openPlayStore() async {
    const url =
        'https://play.google.com/store/apps/developer?id=<Developer_ID>';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}
