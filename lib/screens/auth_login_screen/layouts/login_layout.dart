
import '../../../../config.dart';

class LoginLayout extends StatelessWidget {
  const LoginLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LoginCommonClass().loginBody(
        child: Container(
            constraints: const BoxConstraints(maxWidth: 550, maxHeight: 600),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(AppRadius.r10),
                color: appCtrl.appTheme.whiteColor),
            child: const Padding(
                padding: EdgeInsets.symmetric(horizontal:Insets.i50,vertical: Insets.i20),
                child: SingleChildScrollView(child: LoginBodyLayout()))));
  }
}
