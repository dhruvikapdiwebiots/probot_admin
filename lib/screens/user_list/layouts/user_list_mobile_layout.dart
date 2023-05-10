import '../../../config.dart';

class UserListMobileLayout extends StatelessWidget {
  final dynamic data;
  final String? id;
  const UserListMobileLayout({Key? key,this.data,this.id}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(children: [
              data!["image"] != null
                  ? ClipRRect(
                  borderRadius: BorderRadius.circular(AppRadius.r50),
                  child: Image.network(
                    data!["image"],
                    height: Sizes.s50,
                    width: Sizes.s50,
                    fit: BoxFit.fill,
                  ))
                  : ClipRRect(
                  borderRadius: BorderRadius.circular(AppRadius.r50),
                  child: Image.asset(imageAssets.addUser,
                      height: Sizes.s50,
                      width: Sizes.s50,
                      fit: BoxFit.fill)),
              const HSpace(Sizes.s10),
              Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(children: [
                      CommonWidgetClass().commonValueText("Email - "),
                      CommonWidgetClass().commonValueText(
                          data!["email"] ?? "-"),
                    ]),
                    Row(children: [
                      CommonWidgetClass().commonValueText("Name - "),
                      CommonWidgetClass().commonValueText(
                          data!["name"] ?? "Not Defined")
                    ]).marginSymmetric(vertical: Insets.i5),
                    Row(children: [
                      CommonWidgetClass().commonValueText("Phone - "),
                      CommonWidgetClass().commonValueText(
                          data!["phone"] ?? "Not Defined")
                    ])
                  ])
            ]),
            Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Icon(Icons.delete, color: appCtrl.appTheme.primary)
                      .inkWell(
                      onTap: () => accessDenied(
                          isModification: false,
                          fonts.deleteConfirmation, onTap: () {
                        bool isLoginTest = appCtrl.storage
                            .read(session.isLoginTest);
                        if (isLoginTest) {
                          accessDenied(fonts.modification.tr);
                        } else {
                          appCtrl.deleteAccount(id!,
                              data!["email"]);
                        }
                      })),
                  CommonSwitcher(
                      isActive: data!["isActive"] ?? true,
                      onToggle: (val) async {
                        bool isLoginTest =
                        appCtrl.storage.read(session.isLoginTest);
                        if (isLoginTest) {
                          accessDenied(fonts.modification.tr);
                        } else {
                          await FirebaseFirestore.instance
                              .collection(collectionName.users)
                              .doc(id!)
                              .update({"isActive": val});
                        }
                      })
                ])
          ]).paddingAll(Insets.i10),
    );
  }
}
