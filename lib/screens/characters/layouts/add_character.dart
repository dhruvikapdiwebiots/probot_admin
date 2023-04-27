import 'package:probot_admin/screens/characters/layouts/image_layout.dart';

import '../../../config.dart';

class AddCharacter extends StatelessWidget {
  const AddCharacter({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StatefulBuilder(
        builder: (BuildContext context, StateSetter setState) {
          return GetBuilder<CharactersController>(builder: (charcterCtrl) {
            return Stack(alignment: Alignment.topCenter, children: [
              AlertDialog(
                  contentPadding: EdgeInsets.zero,
                  content: Container(
                      decoration: BoxDecoration(
                          color: appCtrl.appTheme.whiteColor,
                          boxShadow: [
                            BoxShadow(
                                blurRadius: appCtrl.isTheme ?  1 :0,
                                spreadRadius: appCtrl.isTheme ?  1 :0,
                                color: appCtrl.appTheme.blackColor
                            )
                          ]),
                      width: Sizes.s500,
                      child:
                      Stack(alignment: Alignment.topRight, children: <Widget>[
                        Column(mainAxisSize: MainAxisSize.min, children: <Widget>[
                          Container(
                              height: Sizes.s50,
                              width: Sizes.s500,
                              decoration: BoxDecoration(
                                  color: appCtrl.appTheme.whiteColor,
                                  border: Border(
                                      bottom:
                                      BorderSide(color: appCtrl.appTheme.gray.withOpacity(0.3)))),
                              child: Center(
                                  child: Text(fonts.addCharacters.tr,
                                      style: AppCss.outfitSemiBold16
                                          .textColor(appCtrl.appTheme.blackColor)))),
                          Padding(
                              padding: const EdgeInsets.all(20.0),
                              child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    CommonTextBox(
                                        hinText: fonts.title.tr,
                                        controller: charcterCtrl.txtTitle),
                                    const VSpace(Sizes.s15),
                                    CommonTextBox(
                                        hinText: fonts.initialMessage.tr,
                                        controller: charcterCtrl.txtMessage),
                                    const VSpace(Sizes.s15),
                                  ])),
                          const ImageLayout(),
                          const VSpace(Sizes.s10),
                          if (charcterCtrl.isUploadSize)
                            Column(children: [
                              const VSpace(Sizes.s5),
                              Text(fonts.imageError.tr,
                                  style: AppCss.outfitMedium12
                                      .textColor(appCtrl.appTheme.redColor))
                            ]),
                          const VSpace(Sizes.s25),
                          CommonButton(
                              icon: charcterCtrl.isLoading
                                  ? CircularProgressIndicator(
                                  color: appCtrl.appTheme.white)
                                  .paddingSymmetric(vertical: Insets.i10)
                                  : Container(),
                              title: charcterCtrl.characterId != "" ? fonts.update.tr: fonts.submit.tr,
                              onTap: () => charcterCtrl.uploadFile(),
                              style: AppCss.outfitRegular14
                                  .textColor(appCtrl.appTheme.white)),
                          const VSpace(Sizes.s15)
                        ]),
                        Positioned(
                            right: 15.0,
                            top: 15.0,
                            child: InkResponse(
                                onTap: () => Navigator.of(context).pop(),
                                child: CircleAvatar(
                                    radius: 12,
                                    backgroundColor: appCtrl.appTheme.primary,
                                    child: Icon(Icons.close,
                                        size: 18, color: appCtrl.appTheme.white))))
                      ]))),
              CustomSnackBar(isAlert: charcterCtrl.isAlert)
            ]);
          });
        });
  }
}
