

import '../../../config.dart';

class TopUpUserListDesktop extends StatelessWidget {
  final AsyncSnapshot<dynamic>? snapShot;

  const TopUpUserListDesktop({Key? key, this.snapShot}) : super(key: key);

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
                CommonWidgetClass().commonTitleText(fonts.memberName),
                CommonWidgetClass().commonTitleText(fonts.email),
                CommonWidgetClass().commonTitleText(fonts.price),
                CommonWidgetClass().commonTitleText(fonts.paymentMethod),
                CommonWidgetClass().commonTitleText(fonts.balance),
              ]),
          ...snapShot!.data!.docs.asMap().entries.map((e) {
            return TableRow(children: [
              CommonWidgetClass()
                  .commonValueText(e.value.data()["name"] ?? "-")
                  .marginSymmetric(vertical: Insets.i15),
              CommonWidgetClass()
                  .commonValueText(e.value.data()["email"] ?? "-")
                  .marginSymmetric(vertical: Insets.i15),
              CommonWidgetClass()
                  .commonValueText(e.value.data()["price"].toString())
                  .marginSymmetric(vertical: Insets.i15),
              CommonWidgetClass()
                  .commonValueText(e.value.data()["paymentMethod"] ?? "-")
                  .marginSymmetric(vertical: Insets.i15),
              CommonWidgetClass()
                  .commonValueText(e.value.data()["balance"].toString())
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
