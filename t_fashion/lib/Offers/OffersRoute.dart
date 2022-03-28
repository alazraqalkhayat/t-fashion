import 'package:flutter/material.dart';
import 'package:t_fashion/Widgets/buttons/BasicIconButtons.dart';
import 'package:t_fashion/Widgets/screen/BasicScreenStyle.dart';
import 'package:t_fashion/Widgets/FavoriteAndOffersProductsItems.dart';
import 'package:t_fashion/Others/Constants.dart';
import 'package:t_fashion/Widgets/texts/SubTitleText.dart';

class OffersRoute extends StatefulWidget {
  @override
  _OffersRouteState createState() => _OffersRouteState();
}

class _OffersRouteState extends State<OffersRoute> {
  List<String> categories = [
    "رجالي",
    "نسائي",
    "اطفال",
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
        body: BasicScreenStyle(
          paddingTop: 40,
          rightSideIconButton: BasicIconButtons(
            icon: Icons.arrow_forward_ios,
            iconColor: Colors.white,
            iconSize: 30,
            onPressed: () {
              setState(() {
                Navigator.pop(context);
              });
            },
          ),

          middleWidget: SubTitleText(
            subTitle: "العروض",
            fontSize: 30,
            color: Colors.white,
          ),
          leftSideIconButton: BasicIconButtons(
            icon: Icons.filter_list_alt,
            iconColor: kDarkOrange,
            iconSize: 30,
            onPressed: () {
              setState(() {
                print("filter pressed ");
              });
            },
          ),
          child: Container(
            margin: EdgeInsets.only(top: 10),
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
                          onTap: (){

                          },
                        );
                      }),
                    ),
                  ),
                ))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
