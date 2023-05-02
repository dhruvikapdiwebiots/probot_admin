import 'package:flutter/widgets.dart';

import '../../../config.dart';

class SubscriptionWidgetClass {
  //table title
  TableRow tableWidget() => TableRow(
      decoration: const BoxDecoration(
        color: Color.fromRGBO(53, 193, 255, 0.07),
      ),
      children: [
        CommonWidgetClass().commonTitleText(fonts.title),
        CommonWidgetClass().commonTitleText(fonts.price),
        CommonWidgetClass().commonTitleText(fonts.type),
        CommonWidgetClass().commonTitleText(fonts.isActive),
        CommonWidgetClass().commonTitleText(fonts.actions),
      ]);

  //action layout
  Widget actionLayout({GestureTapCallback? onTap}) =>
      Column(children: [
        Icon(Icons.edit,
            color: appCtrl.appTheme.primary)
            .inkWell(onTap:onTap)
      ]).marginSymmetric(vertical: Insets.i15);
}
