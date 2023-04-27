
import '../../../config.dart';

class UserListLayout extends StatelessWidget {
  final AsyncSnapshot<dynamic>? snapShot;

  const UserListLayout({Key? key, this.snapShot}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
        borderRadius: BorderRadius.circular(AppRadius.r6),
        child: Table(columnWidths: const <int, TableColumnWidth>{
          0: IntrinsicColumnWidth(flex: 1),
          1: FlexColumnWidth(),
          2: FlexColumnWidth(),
          3: FlexColumnWidth(),
          4: FlexColumnWidth(),
          5: FlexColumnWidth(),
          6: FlexColumnWidth(),
        }, children: [
          TableRow(
              decoration: const BoxDecoration(
                color: Color.fromRGBO(53, 193, 255, 0.07),
              ),
              children: [
                CommonWidgetClass().commonTitleText(fonts.id),
                CommonWidgetClass().commonTitleText(fonts.image),
                CommonWidgetClass().commonTitleText(fonts.memberName),
                CommonWidgetClass().commonTitleText(fonts.email),
                CommonWidgetClass().commonTitleText(fonts.phone),
                CommonWidgetClass().commonTitleText(fonts.isActive),
                CommonWidgetClass().commonTitleText(fonts.actions)
              ]),
          ...snapShot!.data!.docs.asMap().entries.map((e) {
            return TableRow(children: [
              CommonWidgetClass().commonValueText(e.value.id).marginSymmetric(
                  vertical: Insets.i15, horizontal: Insets.i10),
              CommonWidgetClass()
                  .commonValueText(e.value.data()["image"], isImage: true)
                  .marginSymmetric(vertical: Insets.i15),
              CommonWidgetClass()
                  .commonValueText(e.value.data()["name"] ?? "-")
                  .marginSymmetric(vertical: Insets.i15),
              CommonWidgetClass()
                  .commonValueText(e.value.data()["email"] ?? "-")
                  .marginSymmetric(vertical: Insets.i15),
              CommonWidgetClass()
                  .commonValueText(e.value.data()["phone"] ?? "-")
                  .marginSymmetric(vertical: Insets.i15),
              CommonSwitcher(
                  onToggle: (val) async {
                    await FirebaseFirestore.instance
                        .collection(collectionName.users)
                        .doc(e.value.id)
                        .update({"isActive": val});
                  },
                  isActive: e.value.data()["isActive"] ?? true),
              SubscriptionWidgetClass().actionLayout(
                  onTap: () => accessDenied(
                          fonts.deleteConfirmation.tr,
                          onTap: () => appCtrl.deleteAccount(e.value.id,e.value.data()["email"])))
            ]);
          }).toList()
        ]).decorated(
            border: Border.all(color: appCtrl.appTheme.primary),
            borderRadius: BorderRadius.circular(AppRadius.r6)));
  }


}
