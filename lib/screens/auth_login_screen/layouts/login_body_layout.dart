import 'package:flutter/cupertino.dart';
import '../../../../config.dart';
import 'login_class.dart';

class LoginBodyLayout extends StatelessWidget {
  const LoginBodyLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<LoginController>(builder: (loginCtrl) {
      return Form(
          key: loginCtrl.formKey,
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            const VSpace(Sizes.s20),
            LoginCommonClass().logoLayout(image: imageAssets.logo1),
            const VSpace(Sizes.s20),
            const VSpace(Sizes.s20),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                FittedBox(
                  child: Text("Welcome Back ! You have been missed",
                      style: AppCss.outfitMedium26
                          .textColor(appCtrl.isTheme ? appCtrl.appTheme.white: appCtrl.appTheme.secondary)),
                ),
                const VSpace(Sizes.s8),
                Text("Fill the below form",
                    textAlign: TextAlign.center,
                    style:
                        AppCss.outfitRegular18.textColor(appCtrl.appTheme.txt)),
              ],
            )
                .paddingOnly(left: Insets.i15)
                .border(left: 3, color: appCtrl.appTheme.primary),
            const VSpace(Sizes.s40),
            LoginCommonClass().titleLayout(title: fonts.email),
            const VSpace(Sizes.s10),
            CommonTextBox(
                filled: true,
                fillColor: appCtrl.appTheme.fillColor,
                controller: loginCtrl.txtName,
                validator: (val) => LoginValidator().checkNameValidation(val),
                hinText: fonts.enterYourEmail.tr,
                labelText: fonts.email.tr),
            const VSpace(Sizes.s22),
            LoginCommonClass().titleLayout(title: fonts.password),
                const VSpace(Sizes.s10),
            CommonTextBox(
                maxLines: 1,
                filled: true,
                fillColor: appCtrl.appTheme.fillColor,
                controller: loginCtrl.txtPassword,
                obscureText: loginCtrl.obscureText,
                validator: (val) =>
                    LoginValidator().checkPasswordValidation(val),
                suffixIcon: Icon(
                        loginCtrl.obscureText
                            ? CupertinoIcons.eye_slash_fill
                            : CupertinoIcons.eye,
                        color: appCtrl.isTheme ? appCtrl.appTheme.whiteColor: appCtrl.appTheme.blackColor,
                        size: Sizes.s20)
                    .inkWell(onTap: () {
                  loginCtrl.obscureText = !loginCtrl.obscureText;
                  loginCtrl.update();
                }),
                hinText: fonts.enterPassword.tr,
                labelText: fonts.password.tr),
            const VSpace(Sizes.s30),
            CommonButton(
                title: fonts.signIn.tr,
                margin: 0,
                onTap: () => loginCtrl.signIn(context),
                padding: 0,
                height: Sizes.s40,
                style: AppCss.outfitMedium14.textColor(appCtrl.appTheme.white)),
            const VSpace(Sizes.s40)
          ]));
    });
  }
}
