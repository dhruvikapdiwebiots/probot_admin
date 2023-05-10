

import '../../../config.dart';

class TopUpUserMobile extends StatelessWidget {
  final AsyncSnapshot<dynamic>? snapShot;

  const TopUpUserMobile({Key? key, this.snapShot}) : super(key: key);

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
                          CommonWidgetClass().commonValueText("${fonts.email.tr} - "),
                          CommonWidgetClass().commonValueText(
                              e.value.data()["email"] ?? "-"),
                        ]),
                        Row(children: [
                          CommonWidgetClass().commonValueText("${fonts.name.tr} - "),
                          CommonWidgetClass().commonValueText(
                              e.value.data()["name"] ?? "Not Defined")
                        ]).marginSymmetric(vertical: Insets.i5),
                        Row(children: [
                          CommonWidgetClass().commonValueText("${fonts.price.tr} - "),
                          CommonWidgetClass().commonValueText(
                              e.value.data()["price"].toString())
                        ])
                      ]),
                  Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        CommonWidgetClass()
                            .commonValueText(
                                e.value.data()["paymentMethod"]),

                        const VSpace(Sizes.s5),
                        CommonWidgetClass()
                            .commonValueText(
                            e.value.data()["balance"].toString()),
                      ])
                ]).paddingAll(Insets.i10),
          ).marginOnly(bottom: Insets.i15);
        }).toList()
      ]);
    });
  }


}
