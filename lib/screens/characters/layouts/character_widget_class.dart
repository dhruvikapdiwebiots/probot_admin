

import '../../../config.dart';

class CharacterWidgetClass {
  //table title
  TableRow tableWidget() => TableRow(
          decoration:  BoxDecoration(
            color: appCtrl.appTheme.tableTitleColor,
          ),
          children: [
            CommonWidgetClass().commonTitleText(fonts.id),
            CommonWidgetClass().commonTitleText(fonts.title),
            CommonWidgetClass().commonTitleText(fonts.image),
            CommonWidgetClass().commonTitleText(fonts.message),
            CommonWidgetClass().commonTitleText(fonts.isActive),
            CommonWidgetClass().commonTitleText(fonts.actions)
          ]);

  //action layout
  Widget actionLayout({GestureTapCallback? onTap,deleteTap}) =>
      Column(crossAxisAlignment: CrossAxisAlignment.end, children: [
        Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          Icon(Icons.edit, color: appCtrl.appTheme.primary).inkWell(
              onTap:onTap),
          Icon(Icons.delete, color: appCtrl.appTheme.primary).inkWell(
              onTap: deleteTap)
        ])
      ]);
}
