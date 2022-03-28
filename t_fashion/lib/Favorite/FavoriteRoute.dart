import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:t_fashion/Widgets/buttons/BasicIconButtons.dart';
import 'package:t_fashion/Widgets/screen/BasicScreenStyle.dart';
import 'package:t_fashion/Widgets/drawer/EndDrawerWidget.dart';
import 'package:t_fashion/Widgets/FavoriteAndOffersProductsItems.dart';
import 'package:t_fashion/Others/Constants.dart';
import 'package:t_fashion/Widgets/texts/SubTitleText.dart';

class FavoriteRoute extends StatefulWidget {
  @override
  _FavoriteRouteState createState() => _FavoriteRouteState();
}

class _FavoriteRouteState extends State<FavoriteRoute> {
  List<String> categories = [
    "رجالي",
    "نسائي",
    "اطفال",
    "اثاث",
    "ادوات منزليه",
    "عمر",
    "الكترونيات",
    "اقمشه",
    "اثاث",
    "ادوات منزليه",
    "عمر",
    "الكترونيات",
    "اقمشه"
  ];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        key: kFavoriteRouteScaffoldKey,
        endDrawer: EndDrawerWidget(
          currentRoute: "المفضله",
        ),
        body: BasicScreenStyle(
          paddingTop: 20,
          rightSideIconButton: GestureDetector(
            child: SvgPicture.asset("${kIconsPath}menu.svg"),
            onTap: (){
             kFavoriteRouteScaffoldKey.currentState!.openEndDrawer();
            },
          ),
          middleWidget: SubTitleText(
            subTitle: "المفضله",
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
          child: Column(
            children: [
              Expanded(
                child: DefaultTabController(
                  length: categories.length,
                  child: Scaffold(
                    backgroundColor: Colors.white,
                    appBar: PreferredSize(
                      preferredSize:
                          Size.fromHeight(MediaQuery.of(context).size.height),
                      child: Container(
                        height: 50.0,
                        child: TabBar(
                          labelColor: kDarkOrange,
                          indicatorColor: kDarkOrange,
                          unselectedLabelColor: Colors.black,
                          isScrollable: true,
                          tabs: List<Widget>.generate(categories.length,
                              (int index) {
                            return Tab(text: categories[index]);
                          }),
                        ),
                      ),
                    ),
                    body: TabBarView(
                      children:
                          List<Widget>.generate(categories.length, (int index) {
                        return FavoriteAndOffersProductsItems(
                          title: categories[index],
                          subTitle: categories[index],
                          price: "35\$",
                          onTap: () {
                            Navigator.pushNamed(context, kProductDetailsRoute);
                          },
                        );
                      }),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
