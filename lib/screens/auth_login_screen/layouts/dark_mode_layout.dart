import 'package:flutter_switch/flutter_switch.dart';

import '../../../../config.dart';

class DarkModeLayout extends StatelessWidget {
  const DarkModeLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  IntrinsicHeight(
        child:
        Row(crossAxisAlignment: CrossAxisAlignment.center, children: [

          Text(appCtrl.isTheme ? fonts.lightMode.tr : fonts.darkMode.tr,
              style: AppCss.outfitSemiBold14
                  .textColor(appCtrl.appTheme.blackColor)),
          const HSpace(Sizes.s10),
          FlutterSwitch(
            width: 50,
            height: 30,
            toggleSize: 20,
            value: appCtrl.isTheme,
            borderRadius: 30.0,
            activeToggleColor: appCtrl.appTheme.primary,
            inactiveToggleColor: appCtrl.appTheme.primary,
            activeColor: appCtrl.appTheme.primary.withOpacity(0.2),
            inactiveColor: appCtrl.appTheme.primary.withOpacity(0.2),
            activeIcon: Image.network(
              "https://upload.wikimedia.org/wikipedia/commons/7/7e/Dart-logo.png",
            ),
            inactiveIcon: Image.network(
              "https://upload.wikimedia.org/wikipedia/commons/7/7e/Dart-logo.png",
            ),
            onToggle:  (val) async{
              appCtrl.isTheme = val;
              appCtrl.update();
              ThemeService().switchTheme(appCtrl.isTheme);
              await appCtrl.storage
                  .write(session.isDarkMode, appCtrl.isTheme);
            },
          ),
      /*FlutterSwitch(
        width: 50,
        height: 30,
        valueFontSize: 25,
        toggleSize: 20,
        value: appCtrl.isTheme,
        borderRadius: 30.0,
        activeColor: appCtrl.appTheme.primaryLight,
        inactiveColor: appCtrl.appTheme.primary.withOpacity(0.1),
        activeToggleColor: appCtrl.appTheme.primary,
        activeIcon: Image.asset(imageAssets.Logo),
        onToggle: (val) async{
          appCtrl.isTheme = val;
          appCtrl.update();
          ThemeService().switchTheme(appCtrl.isTheme);
          await appCtrl.storage
              .write(session.isDarkMode, appCtrl.isTheme);
        },
      ),*/

        ]));
  }
}
/*.inkWell(onTap: ()async{
          appCtrl.isTheme = !appCtrl.isTheme;

          appCtrl.update();
          ThemeService().switchTheme(appCtrl.isTheme);
          await appCtrl.storage
              .write(session.isDarkMode, appCtrl.isTheme);
        })*/