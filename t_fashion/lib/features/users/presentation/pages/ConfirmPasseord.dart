import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:t_fashion/core/others/Constants.dart';
import 'package:t_fashion/core/widgets/TextFormFieldContainer.dart';
import 'package:t_fashion/core/widgets/buttons/BasicButtonsContainer.dart';
import 'package:t_fashion/core/widgets/screen/ScreenStyle.dart';
import 'package:t_fashion/core/widgets/texts/SubTitleText.dart';

class ConfirmPassword extends StatelessWidget {
  late double mediaWidth,mediaHeight;

  @override
  Widget build(BuildContext context) {
    checkOrientation(context);
    return ScreenStyle(

      title: "تعيين كلمة المرور",
      child: Form(
        key: kConfirmFormKey,
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          physics: AlwaysScrollableScrollPhysics(),
          padding: EdgeInsets.only(
            right: mediaWidth / 9,
            left: mediaWidth / 9,
            top: mediaHeight / 6,
          ),
          child: Column(
                children: [
                  SubTitleText(
                    subTitle:"قم بإدخال كلمة المرور الجديده",
                    fontSize: 20,
                    color: kMyGrey,
                  ),

                  TextFormFieldContainer(
                          autofocus: true,
                          obscureText: true,
                          enable: true,
                          hint: "كلمة المرور",
                          maxLength: 30,
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
                          enable: true,
                          hint: "تأكيد كلمة المرور",
                          obscureText: true,
                          maxLength: 30,
                          icon_name: "key_square.svg",
                          textInputType: TextInputType.text,
                          onChange: (newValue) {
                          },
                          validator: (validatorValue) {
                            return "";
                          },
                        ),

                    BasicButtonsContainer(
                            title: "حفظ",
                            backgroundColor: kDarkOrange,
                            textColor: Colors.white,
                            onTap: () {
                              print("saved");
                            }),



                ],
              ),
            )
          ),
        );



  }
  checkOrientation(BuildContext context){
    Orientation orientation=MediaQuery.of(context).orientation;

    if(orientation==Orientation.landscape){
      mediaWidth=MediaQuery.of(context).size.height;
      mediaHeight=MediaQuery.of(context).size.height;
    }else{
      mediaWidth=MediaQuery.of(context).size.width;
      mediaHeight=MediaQuery.of(context).size.height;
    }
  }

}
