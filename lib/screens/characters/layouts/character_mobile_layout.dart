import '../../../../config.dart';

class CharacterMobileLayout extends StatelessWidget {
  final AsyncSnapshot<dynamic>? snapShot;

  const CharacterMobileLayout({Key? key, this.snapShot}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CharactersController>(builder: (charactersCtrl) {
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
                            CommonWidgetClass().commonValueText("Title - "),
                            CommonWidgetClass().commonValueText(
                                e.value.data()["title"] ?? "-"),
                          ]),
                          Row(children: [
                            CommonWidgetClass().commonValueText("Message - "),
                            CommonWidgetClass().commonValueText(
                                e.value.data()["message"] ?? "Not Defined")
                          ]).marginSymmetric(vertical: Insets.i5)
                        ])
                  ]),
                  Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Icon(Icons.delete, color: appCtrl.appTheme.primary)
                            .inkWell(
                                onTap: () => accessDenied(
                                    fonts.deleteCharacterConfirmation,
                                    isModification: false,
                                    onTap: () =>
                                        charactersCtrl.deleteData(e.value.id))),
                        CommonSwitcher(
                            isActive: e.value.data()["isActive"] ?? true,
                            onToggle: (val) =>
                                charactersCtrl.isActiveChange(e.value.id, val))
                      ])
                ]).paddingAll(Insets.i10),
          ).marginOnly(bottom: Insets.i15);
        }).toList()
      ]);
    });
  }
}
