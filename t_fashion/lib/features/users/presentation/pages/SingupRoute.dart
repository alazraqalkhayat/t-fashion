import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:t_fashion/core/others/Constants.dart';
import 'package:t_fashion/core/widgets/TextFormFieldContainer.dart';
import 'package:t_fashion/core/widgets/buttons/BasicButtonsContainer.dart';
import 'package:t_fashion/core/widgets/screen/ScreenStyle.dart';
import 'package:t_fashion/core/widgets/texts/TapedText.dart';

import 'LoginRoute.dart';

class SignupRoute extends StatelessWidget {
  late double mediaWidth, mediaHeight;

  @override
  Widget build(BuildContext context) {
    checkOrientation(context);

    return ScreenStyle(
      title: "أنشاء حساب",
      child: Form(
        key: kSingUpFormKey,
        child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            physics: AlwaysScrollableScrollPhysics(),
            padding: EdgeInsets.only(
              right: mediaWidth / 9,
              left: mediaWidth / 9,
              top: mediaHeight / 17,
            ),
            child:  Column(
                    children: [
                      TextFormFieldContainer(
                        autofocus: true,
                        obscureText: false,
                        enable: true,
                        maxLength: 8,
                        hint: "أسم المستخدم",
                        icon_name: "user_square.svg",
                        textInputType: TextInputType.text,
                        onChange: (newValue) {
                        },
                        validator: (validatorValue) {
                          return "";
                        },
                      ),
                      TextFormFieldContainer(
                        autofocus: false,
                        obscureText: false,
                        enable: true,

                        maxLength: 50,
                        hint: "الإيميل",
                        icon_name: "direct.svg",
                        textInputType: TextInputType.text,
                        onChange: (newValue) {
                        },
                        validator: (validatorValue) {
                          return "";
                        },
                      ),
                      TextFormFieldContainer(
                        autofocus: false,
                        obscureText: true,
                        enable: true,

                        maxLength: 30,
                        hint: "كلمة المرور",
                        icon_name: "key_square.svg",
                        textInputType: TextInputType.text,
                        onChange: (newValue) {
                        },
                        validator: (validatorValue) {
                          return "";
                        },
                      ),
                      TextFormFieldContainer(
                        autofocus: false,
                        obscureText: true,
                        enable: true,

                        maxLength: 30,
                        hint: "تأكيد كلمة المرور",
                        icon_name: "key_square.svg",
                        textInputType: TextInputType.text,
                        onChange: (newValue) {

                        },
                        validator: (validatorValue) {
                          return "";
                        },
                      ),
                      TextFormFieldContainer(
                        autofocus: false,
                        obscureText: false,
                        enable: true,
                        hint: "رقم الهاتف",
                        maxLength: 12,
                        icon_name: "call.svg",
                        textInputType: TextInputType.text,
                        onChange: (newValue) {
                        },
                        validator: (validatorValue) {
                          return "";
                        },
                      ),
                      BasicButtonsContainer(
                          title: "إشتراك",
                          backgroundColor: kDarkOrange,
                          textColor: Colors.white,
                          onTap: () {

                          }),

                      const SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          TapedText(
                            text: "تسجيل الدخول",
                            color: kDarkOrange,
                            onTap: () {
                              Navigator.pushReplacement(context,
                                  MaterialPageRoute(builder: (context) {
                                return LoginRoute();
                              }));
                            },
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          const Text("هل لديك حساب بالفعل ؟"),
                        ],
                      )
                    ],
                  ),
                ))
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
