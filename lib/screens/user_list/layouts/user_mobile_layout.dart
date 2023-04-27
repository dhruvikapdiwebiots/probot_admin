import '../../../config.dart';

class UserMobileLayout extends StatelessWidget {
  final AsyncSnapshot<dynamic>? snapShot;

  const UserMobileLayout({Key? key, this.snapShot}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<UserController>(builder: (userCtrl) {
      return Column(children: [
        ...snapShot!.data!.docs.asMap().entries.map((e) {
          return Card(
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(children: [
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
                            CommonWidgetClass().commonValueText("Phone - "),
                            CommonWidgetClass().commonValueText(
                                e.value.data()["phone"] ?? "Not Defined")
                          ])
                        ])
                  ]),
                  Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Icon(Icons.delete, color: appCtrl.appTheme.primary)
                            .inkWell(
                                onTap: () => accessDenied(
                                    fonts.deleteConfirmation,
                                    onTap: () => appCtrl.deleteAccount(
                                        e.value.id, e.value.data()["email"]))),
                        CommonSwitcher(
                            isActive: e.value.data()["isActive"] ?? true,
                            onToggle: (val) async {
                              await FirebaseFirestore.instance
                                  .collection(collectionName.users)
                                  .doc(e.value.id)
                                  .update({"isActive": val});
                            })
                      ])
                ]).paddingAll(Insets.i10),
          ).marginOnly(bottom: Insets.i15);
        }).toList()
      ]);
    });
  }
}
