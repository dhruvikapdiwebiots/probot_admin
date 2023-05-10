
import '../../../config.dart';

class UserListWidgetClass{

  //table row
  TableRow tableRow() =>TableRow(
      decoration: BoxDecoration(
        color: appCtrl.appTheme.tableTitleColor,
      ),
      children: [
        CommonWidgetClass().commonTitleText(fonts.id),
        CommonWidgetClass().commonTitleText(fonts.image),
        CommonWidgetClass().commonTitleText(fonts.memberName),
        CommonWidgetClass().commonTitleText(fonts.email),
        CommonWidgetClass().commonTitleText(fonts.phone),
        CommonWidgetClass().commonTitleText(fonts.isActive),
        CommonWidgetClass().commonTitleText(fonts.actions)
      ]);
}