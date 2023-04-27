import 'package:intl/intl.dart';
import 'package:probot_admin/widgets/common_widget_class.dart';

import '../../../config.dart';

class UserSubscribeLListLayout extends StatelessWidget {
  final AsyncSnapshot<dynamic>? snapShot;

  const UserSubscribeLListLayout({Key? key, this.snapShot}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(AppRadius.r6),
      child: Table(
        columnWidths: const <int, TableColumnWidth>{
          0: IntrinsicColumnWidth(flex: 1),
          1: FlexColumnWidth(),
          2: FlexColumnWidth(),
          3: FlexColumnWidth(),
          4: FlexColumnWidth(),
          5: FlexColumnWidth(),
        },
        children: [
          TableRow(
              decoration: const BoxDecoration(
                color: Color.fromRGBO(53, 193, 255, 0.07),
              ),
              children: [
                CommonWidgetClass().commonTitleText(fonts.id),
                CommonWidgetClass().commonTitleText(fonts.memberName),
                CommonWidgetClass().commonTitleText(fonts.email),
                CommonWidgetClass().commonTitleText(fonts.expiryDate),
                CommonWidgetClass().commonTitleText(fonts.subscriptionType),
                CommonWidgetClass().commonTitleText(fonts.isTopUp),
              ]),
          ...snapShot!.data!.docs.asMap().entries.map((e) {
            return TableRow(children: [
              CommonWidgetClass().commonValueText(e.value.id).marginSymmetric(
                  vertical: Insets.i15, horizontal: Insets.i10),
              CommonWidgetClass()
                  .commonValueText(e.value.data()["name"] ?? "-")
                  .marginSymmetric(vertical: Insets.i15),
              CommonWidgetClass()
                  .commonValueText(e.value.data()["email"] ?? "-")
                  .marginSymmetric(vertical: Insets.i15),
              e.value.data()["expiryDate"] != null ?
                CommonWidgetClass()
                    .commonValueText(DateFormat("dd/MM/yyyy").format(
                        DateTime.parse(
                            e.value.data()["expiryDate"].toDate().toString())))
                    .marginSymmetric(vertical: Insets.i15) : CommonWidgetClass()
                  .commonValueText("")
                  .marginSymmetric(vertical: Insets.i15),
              CommonWidgetClass()
                  .commonValueText(e.value.data()["subscriptionType"] ?? "-")
                  .marginSymmetric(vertical: Insets.i15),
              CommonWidgetClass()
                  .commonValueText(e.value.data()["isSubscribe"] ?? "False")
                  .marginSymmetric(vertical: Insets.i15),
            ]);
          }).toList()
        ],
      ).decorated(
          border: Border.all(color: appCtrl.appTheme.primary),
          borderRadius: BorderRadius.circular(AppRadius.r6)),
    );
  }
}
