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
          6: FlexColumnWidth()
        }, children: [
          UserListWidgetClass().tableRow(),
          ...snapShot!.data!.docs.asMap().entries.map((e) {
            return TableRow(children: [
              CommonWidgetClass().commonValueText(e.value.id).marginSymmetric(
                  vertical: Insets.i10, horizontal: Insets.i10),
              CommonWidgetClass()
                  .commonValueText(e.value.data()["image"], isImage: true)
                  .marginSymmetric(vertical: Insets.i10),
              CommonWidgetClass()
                  .commonValueText(e.value.data()["name"] ?? "-")
                  .marginSymmetric(vertical: Insets.i10),
              CommonWidgetClass()
                  .commonValueText(e.value.data()["email"] ?? "-")
                  .marginSymmetric(vertical: Insets.i10),
              CommonWidgetClass()
                  .commonValueText(e.value.data()["phone"] ?? "-")
                  .marginSymmetric(vertical: Insets.i10),
              CommonSwitcher(
                  onToggle: (val) async {
                    bool isLoginTest =
                        appCtrl.storage.read(session.isLoginTest);
                    if (isLoginTest) {
                      accessDenied(fonts.modification.tr);
                    } else {
                      await FirebaseFirestore.instance
                          .collection(collectionName.users)
                          .doc(e.value.id)
                          .update({"isActive": val});
                    }
                  },
                  isActive: e.value.data()["isActive"] ?? true),
              CommonWidgetClass().actionLayout(onTap: () {
                bool isLoginTest = appCtrl.storage.read(session.isLoginTest);
                if (isLoginTest) {
                  accessDenied(fonts.modification.tr);
                } else {
                  accessDenied(fonts.deleteConfirmation.tr,
                      isModification: false,
                      onTap: () => appCtrl.deleteAccount(
                          e.value.id, e.value.data()["email"]));
                }
              })
            ]);
          }).toList()
        ]).decorated(
            border: Border.all(color: appCtrl.appTheme.primary),
            borderRadius: BorderRadius.circular(AppRadius.r6)));
  }
}
