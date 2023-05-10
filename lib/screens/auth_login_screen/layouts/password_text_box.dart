import 'package:flutter/cupertino.dart';

import '../../../config.dart';

class PasswordTextBox extends StatelessWidget {
  const PasswordTextBox({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<LoginController>(
      builder: (loginCtrl) {
        return CommonTextBox(
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
                color: appCtrl.isTheme
                    ? appCtrl.appTheme.whiteColor
                    : appCtrl.appTheme.blackColor,
                size: Sizes.s20)
                .inkWell(onTap: () {
              loginCtrl.obscureText = !loginCtrl.obscureText;
              loginCtrl.update();
            }),
            hinText: fonts.enterPassword.tr,
            labelText: fonts.password.tr);
      }
    );
  }
}
