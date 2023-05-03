import 'package:flutter/widgets.dart';

import '../../../config.dart';

class SuggestionWidgetClass {
  //table title
  TableRow tableWidget() => TableRow(
          decoration: const BoxDecoration(
            color: Color.fromRGBO(53, 193, 255, 0.07),
          ),
          children: [
            CommonWidgetClass().commonTitleText(fonts.id),
            CommonWidgetClass().commonTitleText(fonts.title),
            CommonWidgetClass().commonTitleText(fonts.suggestionList),
            CommonWidgetClass().commonTitleText(fonts.isActive),
            CommonWidgetClass().commonTitleText(fonts.actions)
          ]);

  //action layout
  Widget actionLayout({GestureTapCallback? onTap}) =>
      Column(crossAxisAlignment: CrossAxisAlignment.end, children: [
        Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          Icon(Icons.edit, color: appCtrl.appTheme.primary).inkWell(
              onTap:onTap),
        ])
      ]);
}
