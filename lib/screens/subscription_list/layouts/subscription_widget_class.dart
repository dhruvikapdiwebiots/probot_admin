
import '../../../config.dart';

class SubscriptionWidgetClass {
  //table title
  TableRow tableWidget() => TableRow(
      decoration:  BoxDecoration(
        color: appCtrl.appTheme.tableTitleColor,
      ),
      children: [
        CommonWidgetClass().commonTitleText(fonts.title),
        CommonWidgetClass().commonTitleText(fonts.price),
        CommonWidgetClass().commonTitleText(fonts.type),
        CommonWidgetClass().commonTitleText(fonts.isActive),
        CommonWidgetClass().commonTitleText(fonts.actions),
      ]);

}
