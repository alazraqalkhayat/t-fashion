import 'package:flutter/material.dart';
import 'package:t_fashion/core/others/Constants.dart';
import 'package:t_fashion/core/widgets/TextFormFieldContainer.dart';
import 'package:t_fashion/core/widgets/buttons/BasicButtonsContainer.dart';
import 'package:t_fashion/core/widgets/screen/ScreenStyle.dart';
import 'package:t_fashion/core/widgets/texts/SubTitleText.dart';

class RestorePassword extends StatelessWidget {
  late double mediaWidth,mediaHeight;

  @override
  Widget build(BuildContext context) {
    checkOrientation(context);

    return ScreenStyle(

      title: "إستعاده كلمة المرور",
      child: Form(
        key: kRestorePasswordFormKey,
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          physics: AlwaysScrollableScrollPhysics(),
          padding: EdgeInsets.only(
            right: mediaWidth / 9,
            left: mediaWidth / 9,
            top: mediaHeight / 4,
          ),
          child: Padding(
            //
            padding: const EdgeInsets.all(8.0),
            child:Column(
                  children: [
                    SubTitleText(
                      subTitle:
                      "قم بإدخال بريدك الإلكتروني لإستعاده كلمه المرور الخاصه بك وإعاده تعيينها",
                      fontSize: 20,
                      color: kMyGrey,

                    ),

                     TextFormFieldContainer(
                            autofocus: true,
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

                     BasicButtonsContainer(
                            title: "إستعاده",
                            backgroundColor: kDarkOrange,
                            textColor: Colors.white,
                            onTap: () {
                              Navigator.pushNamed(context, kConfirmPassword);
                            }),
                  ],
                ),
              )
            ),
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


