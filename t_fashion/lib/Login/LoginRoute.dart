import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:t_fashion/Login/Models/LoginModel.dart';
import 'package:t_fashion/Others/MyFlashBar.dart';
import 'package:t_fashion/Widgets/buttons/BasicButtonsContainer.dart';
import 'package:t_fashion/Widgets/screen/ScreenStyle.dart';
import 'package:t_fashion/Widgets/texts/SubTitleText.dart';
import 'package:t_fashion/Widgets/texts/TapedText.dart';
import 'package:t_fashion/Widgets/TextFormFieldContainer.dart';
import 'package:t_fashion/Others/Constants.dart';
import 'package:t_fashion/restorePassword/ResstorePassword.dart';
import 'package:t_fashion/Signup/SingupRoute.dart';

class LoginRoute extends StatelessWidget {
  // FocusNode myFocusNode = new FocusNode();
  late double mediaWidth, mediaHeight;
  late SharedPreferences preferences;

  @override
  Widget build(BuildContext context) {
    checkOrientation(context);
    return ScreenStyle(
      title: "تسجيل الدخول",
      child: Form(
        key: kLoginFormKey,
        child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            physics: AlwaysScrollableScrollPhysics(),
            padding: EdgeInsets.only(
              right: mediaWidth / 9,
              left: mediaWidth / 9,
              top: mediaWidth / 10,
            ),
            child: ChangeNotifierProvider(
                create: (context) => LoginModel(),
                child: Consumer<LoginModel>(
                    builder: (context, loginModel, child) => Column(
                          children: [
                            SubTitleText(
                              subTitle:
                                  "للتمكن من شراء المنتجات الرجاء تسجيل الدخول ببيانات حقيقيه ",
                              fontSize: 20,
                              color: kMyGrey,
                            ),
                            TextFormFieldContainer(
                              autofocus: true,
                              enable: true,
                              obscureText: false,
                              maxLength: 8,
                              hint: "إسم المستحدم",
                              icon_name: "user_square.svg",
                              textInputType: TextInputType.text,
                              onChange: (newValue) {
                                loginModel.changeUserName(newValue);
                              },
                              validator: (validatorValue) {
                                String validator = "";
                                if (validatorValue!.toString().isEmpty) {
                                  validator = "يلوم تعبئه هذا الحقل";
                                }
                                return validator;
                              },
                            ),
                            TextFormFieldContainer(
                              autofocus: false,
                              obscureText: true,
                              enable: true,
                              hint: "كلمة المرور",
                              maxLength: 30,
                              icon_name: "key_square.svg",
                              textInputType: TextInputType.visiblePassword,
                              onChange: (newValue) {
                                loginModel.changePassword(newValue);
                              },
                              validator: (validatorValue) {
                                String validator = "";
                                if (validatorValue!.toString().isEmpty) {
                                  validator = "يلوم تعبئه هذا الحقل";
                                }
                                return validator;
                              },
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              textDirection: TextDirection.rtl,
                              children: [
                                Row(
                                  children: [
                                    SubTitleText(
                                      subTitle: "تذكرني",
                                      fontSize: 15,
                                      color: kMyGrey,
                                    ),
                                    Checkbox(
                                        checkColor: Colors.white,
                                        activeColor: Colors.red,
                                        value: loginModel.rememberMe,
                                        onChanged: (newValue) {
                                          loginModel.changeRememberMe(
                                              newValue as bool);
                                        }),
                                  ],
                                ),
                                TapedText(
                                  text: "نسيت كلمة المرور",
                                  color: kDarkOrange,
                                  onTap: () {
                                    Navigator.push(context,
                                        MaterialPageRoute(builder: (context) {
                                      return RestorePassword();
                                    }));
                                  },
                                ),
                              ],
                            ),
                            BasicButtonsContainer(
                                title: "دخول",
                                backgroundColor: kDarkOrange,
                                textColor: Colors.white,
                                onTap: () {
                                  // if (kLoginFormKey.currentState!.validate()) {
                                  //   showFlashBar("success", context);
                                  // }

                                  if (loginModel.userName.isEmpty ||
                                      loginModel.password.isEmpty) {
                                    MyFlashBar(
                                      context: context,
                                      title: "خطاء",
                                      message: "message",
                                      thenDo: () {
                                        print("done");
                                      },
                                    ).showFlashBar();
                                  } else{
                                    Navigator.pushReplacementNamed(context, kHomeRoute);
                                    saveDate(loginModel.userName);
                                  }
                                }),
                            const SizedBox(
                              height: 20,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                TapedText(
                                  text: "إنشاء حساب",
                                  color: kDarkOrange,
                                  onTap: () {
                                    Navigator.pushReplacement(context,
                                        MaterialPageRoute(builder: (context) {
                                      return SignupRoute();
                                    }));
                                  },
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                Text("لايوجد لديك حساب ؟"),
                              ],
                            )
                          ],
                        ),),),),
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

  saveDate(String userName) async {
    preferences = await SharedPreferences.getInstance();
    preferences.setString("userNAme", userName);
  }
}
