import 'package:intl/intl.dart';
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
        },
        children: [
          TableRow(
              decoration: BoxDecoration(
                color: appCtrl.appTheme.tableTitleColor,
              ),
              children: [
                CommonWidgetClass().commonTitleText(fonts.id),
                CommonWidgetClass().commonTitleText(fonts.memberName),
                CommonWidgetClass().commonTitleText(fonts.email),
                CommonWidgetClass().commonTitleText(fonts.expiryDate),
                CommonWidgetClass().commonTitleText(fonts.subscriptionType),
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
            ]);
          }).toList()
        ],
      ).decorated(
          border: Border.all(color: appCtrl.appTheme.primary),
          borderRadius: BorderRadius.circular(AppRadius.r6)),
    );
  }
}
