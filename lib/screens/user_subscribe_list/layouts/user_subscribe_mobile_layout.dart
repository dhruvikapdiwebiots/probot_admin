
import 'package:intl/intl.dart';

import '../../../config.dart';

class UserSubscribeMobileLayout extends StatelessWidget {
  final AsyncSnapshot<dynamic>? snapShot;

  const UserSubscribeMobileLayout({Key? key, this.snapShot}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<UserSubscribeController>(builder: (userCtrl) {
      return Column(children: [
        ...snapShot!.data!.docs.asMap().entries.map((e) {
          return Card(
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(children: [
                          CommonWidgetClass().commonValueText("Email - "),
                          CommonWidgetClass().commonValueText(
                              e.value.data()["email"] ?? "-"),
                        ]),
                        Row(children: [
                          CommonWidgetClass().commonValueText("Name - "),
                          CommonWidgetClass().commonValueText(
                              e.value.data()["name"] ?? "Not Defined")
                        ]).marginSymmetric(vertical: Insets.i5),
                        Row(children: [
                          CommonWidgetClass().commonValueText("Subscription Type - "),
                          CommonWidgetClass().commonValueText(
                              e.value.data()["subscriptionType"] ?? "Not Defined")
                        ])
                      ]),
                  Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        CommonWidgetClass()
                            .commonValueText(DateFormat("dd/MM/yyyy").format(
                            DateTime.parse(
                                e.value.data()["expiryDate"].toDate().toString()))),
                        const VSpace(Sizes.s5),
                        CommonWidgetClass()
                            .commonValueText("Is Top-Up - ${e.value.data()["isSubscribe"] ?? "False"}")
                      ])
                ]).paddingAll(Insets.i10),
          ).marginOnly(bottom: Insets.i15);
        }).toList()
      ]);
    });
  }


}
