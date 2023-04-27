import '../../../config.dart';

class UsersCommonClass {
  //header decoration
  BoxDecoration headerDecoration() => BoxDecoration(
      color: appCtrl.appTheme.whiteColor,
      border: Border(
          bottom: BorderSide(color: appCtrl.appTheme.gray.withOpacity(0.3), width: 1)));

  //selected decoration
  BoxDecoration selectedDecoration() => BoxDecoration(
      border: Border(
          bottom: BorderSide(
              color: appCtrl.appTheme.greenColor.withOpacity(.3), width: 1)),
      color: appCtrl.appTheme.greenColor);

}
