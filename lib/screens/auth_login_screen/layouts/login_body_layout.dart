
import '../../../../config.dart';

class LoginBodyLayout extends StatelessWidget {
  const LoginBodyLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<LoginController>(builder: (loginCtrl) {
      return Form(
          key: loginCtrl.formKey,
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            LoginCommonClass().logoLayout(image: imageAssets.logo1),
            const VSpace(Sizes.s30),
            Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              FittedBox(
                  child: Text(fonts.welcomeBack.tr,
                      style: AppCss.outfitMedium24.textColor(appCtrl.isTheme
                          ? appCtrl.appTheme.white
                          : appCtrl.appTheme.secondary))),
              const VSpace(Sizes.s8),
              Text(fonts.fillTheBelowForm.tr,
                  textAlign: TextAlign.center,
                  style: AppCss.outfitRegular18.textColor(appCtrl.appTheme.txt))
            ])
                .paddingOnly(left: Insets.i12)
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
            const PasswordTextBox(),
            const VSpace(Sizes.s30),
            CommonButton(
                title: fonts.signIn.tr,
                margin: 0,
                onTap: () => loginCtrl.signIn(context),
                padding: 0,
                height: Sizes.s40,
                style: AppCss.outfitMedium14.textColor(appCtrl.appTheme.white)),
            const VSpace(Sizes.s25),
            Text(fonts.credentialsForLogin.tr.toUpperCase(),
                style: AppCss.outfitSemiBold16
                    .textColor(appCtrl.appTheme.primary)
                    .letterSpace(.5)),
            const VSpace(Sizes.s20),
            CommonWidgetClass().credentialCopy("admin@gmail.com"),
            const VSpace(Sizes.s5),
            CommonWidgetClass().credentialCopy("Admin1234"),
          ]));
    });
  }
}
