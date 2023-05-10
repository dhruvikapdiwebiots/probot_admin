import 'package:probot_admin/screens/subscription_list/layouts/subscription_mobile_layout.dart';

import '../../config.dart';

class SubscriptionList extends StatelessWidget {
  final usageCtrl = Get.put(SubscriptionListController());

  SubscriptionList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SubscriptionListController>(builder: (_) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisAlignment: MainAxisAlignment.end,
        mainAxisSize: MainAxisSize.min,
        children: [

          StreamBuilder(
              stream: FirebaseFirestore.instance
                  .collection(collectionName.plans)
                  .snapshots(),
              builder: (context, snapShot) {
                if (snapShot.hasData) {
                  return Responsive.isDesktop(context)
                      ? SubscriptionListTable(children: [
                          SubscriptionWidgetClass().tableWidget(),
                          ...snapShot.data!.docs.asMap().entries.map((e) {
                            return TableRow(children: [
                              CommonWidgetClass()
                                  .commonValueText(e.value.data()["title"])
                                  .marginSymmetric(vertical: Insets.i15),
                              CommonWidgetClass()
                                  .commonValueText(
                                      e.value.data()["price"].toString())
                                  .marginSymmetric(vertical: Insets.i15),
                              CommonWidgetClass()
                                  .commonValueText(e.value.data()["planType"])
                                  .marginSymmetric(vertical: Insets.i15),
                              CommonSwitcher(
                                  onToggle: (val) => usageCtrl
                                      .onActiveStatusChange(e.value.id, val),
                                  isActive: e.value.data()["isActive"] ?? true),
                              CommonWidgetClass().actionLayout(isUser: false,
                                  onTap: () => usageCtrl.addSubscriptionDialog(data: e.value.data()))
                            ]);
                          }).toList()
                        ])
                      : SubscriptionMobileLayout(snapShot: snapShot);
                } else {
                  return Container();
                }
              }),
        ],
      ).paddingAll(Insets.i25).boxExtension();
    });
  }
}
