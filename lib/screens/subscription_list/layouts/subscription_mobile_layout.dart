
import 'package:intl/intl.dart';

import '../../../config.dart';

class SubscriptionMobileLayout extends StatelessWidget {
  final AsyncSnapshot<dynamic>? snapShot;

  const SubscriptionMobileLayout({Key? key, this.snapShot}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SubscriptionListController>(builder: (userCtrl) {
      return Column(children: [
        ...snapShot!.data!.docs.asMap().entries.map((e) {
          return Card(
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      e.value.data()["image"] != null
                          ? ClipRRect(
                          borderRadius: BorderRadius.circular(AppRadius.r50),
                          child: Image.network(e.value.data()["image"],
                              height: Sizes.s50))
                          : ClipRRect(
                          borderRadius: BorderRadius.circular(AppRadius.r50),
                          child: Image.asset(imageAssets.addUser,
                              height: Sizes.s50)),
                      const HSpace(Sizes.s10),
                      Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [

                            Row(children: [
                              CommonWidgetClass().commonValueText("Title - "),
                              CommonWidgetClass().commonValueText(
                                  e.value.data()["title"] ?? "-"),
                            ]),
                            Row(children: [
                              CommonWidgetClass().commonValueText("Price - "),
                              CommonWidgetClass().commonValueText(
                                  e.value.data()["price"].toString())
                            ]).marginSymmetric(vertical: Insets.i5),
                            Row(children: [
                              CommonWidgetClass().commonValueText("Plan Type - "),
                              CommonWidgetClass().commonValueText(
                                  e.value.data()["planType"] ?? "Not Defined")
                            ])
                          ]),
                    ],
                  ),
                  Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Icon(Icons.delete, color: appCtrl.appTheme.primary)
                            .inkWell(
                            onTap: () => accessDenied(
                                fonts.deleteSubscriptionConfirmation,
                                onTap: () =>
                                    userCtrl.onDeleteData(e.value.id))),
                        CommonSwitcher(
                            isActive: e.value.data()["isActive"] ?? true,
                            onToggle: (val) =>
                                userCtrl.onActiveStatusChange(e.value.id, val))
                      ])
                ]).paddingAll(Insets.i10),
          ).marginOnly(bottom: Insets.i15);
        }).toList()
      ]);
    });
  }


}
