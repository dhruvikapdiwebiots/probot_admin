import 'package:probot_admin/screens/characters/layouts/character_mobile_layout.dart';

import '../../config.dart';

class CharacterLayout extends StatelessWidget {
  final charactersCtrl = Get.put(CharactersController());

  CharacterLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CharactersController>(builder: (_) {
      return Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          mainAxisAlignment: MainAxisAlignment.end,
          mainAxisSize: MainAxisSize.min,
          children: [
            CommonButton(
              title: fonts.addCharacters.tr,
              width: Sizes.s200,
              onTap: () => charactersCtrl.addCharacterDialog(),
              style:
                  AppCss.outfitRegular14.textColor(appCtrl.appTheme.whiteColor),
            ).alignment(Alignment.centerRight),
            const VSpace(Sizes.s20),
            StreamBuilder(
                stream: FirebaseFirestore.instance
                    .collection(collectionName.characters)
                    .snapshots(),
                builder: (context, snapShot) {
                  if (snapShot.hasData) {
                    return Responsive.isDesktop(context) ?CharacterListTable(children: [
                      CharacterWidgetClass().tableWidget(),
                      ...snapShot.data!.docs.asMap().entries.map((e) {
                        return TableRow(children: [
                          CommonWidgetClass()
                              .commonValueText(e.value.id)
                              .marginSymmetric(
                                  vertical: Insets.i12, horizontal: Insets.i10),
                          CommonWidgetClass()
                              .commonValueText(e.value.data()["title"])
                              .marginSymmetric(vertical: Insets.i12),
                          CommonWidgetClass()
                              .commonValueText(e.value.data()["image"],
                                  isImage: true)
                              .marginSymmetric(vertical: Insets.i12),
                          CommonWidgetClass()
                              .commonValueText(e.value.data()["message"])
                              .marginSymmetric(vertical: Insets.i12),
                          CommonSwitcher(
                              isActive: e.value.data()["isActive"] ?? true,
                              onToggle: (val) => charactersCtrl.isActiveChange(
                                  e.value.id, val)),
                          CharacterWidgetClass()
                              .actionLayout(
                                  onTap: () => charactersCtrl
                                      .addCharacterDialog(data: e.value.data()),
                                  deleteTap: () => accessDenied(
                                      fonts.deleteCharacterConfirmation.tr,
                                      onTap: () => charactersCtrl
                                          .deleteData(e.value.id)))
                              .marginSymmetric(vertical: Insets.i12)
                        ]);
                      }).toList()
                    ]) : CharacterMobileLayout(snapShot: snapShot,);
                  } else {
                    return Container();
                  }
                })
          ]).paddingAll(Insets.i25).boxExtension();
    });
  }
}
