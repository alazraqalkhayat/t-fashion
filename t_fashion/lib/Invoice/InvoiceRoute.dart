import 'package:flutter/material.dart';
import 'package:t_fashion/Others/Constants.dart';
import 'package:t_fashion/Invoice/widgets/InvoiceDetails.dart';
import 'package:t_fashion/Widgets/buttons/BasicButtonsContainer.dart';
import 'package:t_fashion/Widgets/texts/OverFlowText.dart';
import 'package:t_fashion/Widgets/texts/SubTitleText.dart';

class InvoiceRoute extends StatelessWidget{
  late double mediaHeight, mediaWidth;

  @override
  Widget build(BuildContext context) {
    checkOrientation(context);

    return SafeArea(
        child: Scaffold(
          body: Stack(
            children: [
              Container(
                height: mediaHeight / 6,
                width: double.infinity,
                color: kDarkOrange,
                child: Center(
                  child: SubTitleText(
                    subTitle: "T-FASHION",
                    color: Colors.white,
                    fontSize: 30,
                  ),
                ),
              ),
              SingleChildScrollView(
                child: Container(
                  margin: EdgeInsets.only(top: mediaHeight / 7),
                  padding: EdgeInsets.only(
                    top: mediaHeight / 15,
                    right: mediaWidth / 20,
                    bottom: mediaHeight / 30,
                    left: mediaWidth / 20,
                  ),
                  width: double.infinity,
                  height: mediaHeight,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(20),
                      topLeft: Radius.circular(20),
                    ),
                  ),
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        Row(
                          textDirection: TextDirection.rtl,
                          children: [
                            Expanded(
                              flex: 2,
                              child: SubTitleText(
                                subTitle: "المنتج",
                                fontSize: 12,
                                color: Colors.black,
                              ),
                            ),
                            Expanded(
                              child: SubTitleText(
                                subTitle: "السعر",
                                fontSize: 12,
                                color: Colors.black,
                              ),
                            ),
                            Expanded(
                              child: SubTitleText(
                                subTitle: "الكميه",
                                fontSize: 12,
                                color: Colors.black,
                              ),
                            ),
                            Expanded(
                              child: SubTitleText(
                                subTitle: "المجموع",
                                fontSize: 12,
                                color: Colors.black,
                              ),
                            ),
                          ],
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 10),
                          height: 3,
                          width: double.infinity,
                          color: kDarkOrange,
                        ),
                        SizedBox(
                          height: mediaHeight / 2,
                          child: ListView.builder(
                            itemCount: 50,
                            scrollDirection: Axis.vertical,
                            itemBuilder: (context, index) {
                              return Row(
                                textDirection: TextDirection.rtl,
                                children: [
                                  Expanded(
                                      flex: 2,
                                      child: OverFlowText(
                                        title:
                                        "جاكيت يدفي جاكيت يدفي جاكيت يدفي جاكيت يدفي جاكيت يدفي جاكيت يدفي جاكيت يدفي ",
                                        maxLine: 1,
                                      )),
                                  Expanded(
                                    child: SubTitleText(
                                      subTitle: "50\$",
                                      fontSize: 12,
                                      color: kDarkOrange,
                                    ),
                                  ),
                                  Expanded(
                                    child: SubTitleText(
                                      subTitle: "2",
                                      fontSize: 12,
                                      color: kMyGrey,
                                    ),
                                  ),
                                  Expanded(
                                    child: SubTitleText(
                                      subTitle: "50\$",
                                      fontSize: 12,
                                      color: kDarkOrange,
                                    ),
                                  ),
                                ],
                              );
                            },
                          ),
                        ),

                        Container(
                          margin: EdgeInsets.only(top: 10, bottom: 10),
                          height: 3,
                          width: mediaWidth,
                          color: kDarkOrange,
                        ),
                        SingleChildScrollView(
                          child: Container(
                            padding: EdgeInsets.only(
                                top: mediaHeight / 20,
                                right: mediaWidth / 20,
                                bottom: mediaHeight / 20,
                                left: mediaWidth / 20),
                            child: Column(
                              textDirection: TextDirection.rtl,
                              children: [
                                InvoiceDetails(
                                  rightSideText: "مجموع القطع",
                                  rightSideColor: kMyGrey,
                                  leftSideText: "15",
                                  leftSideColor: kMyGrey,
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                InvoiceDetails(
                                  rightSideText: "سعر التوصيل",
                                  rightSideColor: kMyGrey,
                                  leftSideText: "20\$",
                                  leftSideColor: kDarkOrange,
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                InvoiceDetails(
                                  rightSideText: "المجموع",
                                  rightSideColor: kMyGrey,
                                  leftSideText: "20\$",
                                  leftSideColor: kDarkOrange,
                                ),
                                BasicButtonsContainer(
                                  title: "إنهاء",
                                  backgroundColor: kDarkOrange,
                                  textColor: Colors.white,
                                  onTap: () {

                                  },
                                ),
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ));
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
