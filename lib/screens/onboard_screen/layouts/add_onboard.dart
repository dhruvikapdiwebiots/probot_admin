import 'package:probot_admin/screens/characters/layouts/image_layout.dart';
import 'package:probot_admin/screens/onboard_screen/layouts/onboard_image1.dart';
import 'package:probot_admin/screens/onboard_screen/layouts/onboard_image2.dart';
import 'package:probot_admin/screens/onboard_screen/layouts/onboard_image3.dart';

import '../../../config.dart';

class AddOnboard extends StatelessWidget {
  const AddOnboard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StatefulBuilder(
        builder: (BuildContext context, StateSetter setState) {
      return GetBuilder<OnboardController>(builder: (onboardCtrl) {
        return Stack(alignment: Alignment.topCenter, children: [
          AlertDialog(
              contentPadding: EdgeInsets.zero,
              content: Container(
                  decoration: BoxDecoration(
                      color: appCtrl.appTheme.whiteColor,
                      boxShadow: [
                        BoxShadow(
                            blurRadius: appCtrl.isTheme ? 1 : 0,
                            spreadRadius: appCtrl.isTheme ? 1 : 0,
                            color: appCtrl.appTheme.blackColor)
                      ]),
                  width: Sizes.s500,
                  child:
                      Stack(alignment: Alignment.topRight, children: <Widget>[
                    Column( crossAxisAlignment: CrossAxisAlignment.start,mainAxisSize: MainAxisSize.min, children: <Widget>[
                      Container(
                          height: Sizes.s50,
                          width: Sizes.s500,
                          decoration: BoxDecoration(
                              color: appCtrl.appTheme.whiteColor,
                              border: Border(
                                  bottom: BorderSide(
                                      color: appCtrl.appTheme.gray
                                          .withOpacity(0.3)))),
                          child: Center(
                              child: Text(fonts.onBoardScreen.tr,
                                  style: AppCss.outfitSemiBold16.textColor(
                                      appCtrl.appTheme.blackColor)))),
                     Column(
                       crossAxisAlignment: CrossAxisAlignment.start,
                       children: [
                         Text("${fonts.image.tr} 1",
                             style: AppCss.outfitMedium12
                                 .textColor(appCtrl.appTheme.blackColor)),
                         const VSpace(Sizes.s10),
                         OnboardImage1(image: "",),
                         const VSpace(Sizes.s15),
                         Text("${fonts.image.tr} 2",
                             style: AppCss.outfitMedium12
                                 .textColor(appCtrl.appTheme.blackColor)),
                         const VSpace(Sizes.s10),
                         OnboardImage2(image: "",),
                         const VSpace(Sizes.s20),
                         Text("${fonts.image.tr} 3",
                             style: AppCss.outfitMedium12
                                 .textColor(appCtrl.appTheme.blackColor)),
                         const VSpace(Sizes.s10),
                         OnboardImage3(image: "",),
                         const VSpace(Sizes.s15),
                         Text("Please Select Language for Onboard Title",
                             style: AppCss.outfitMedium12
                                 .textColor(appCtrl.appTheme.blackColor)),
                         const VSpace(Sizes.s10),
                         SizedBox(
                             width: Sizes.s120,

                             child: ButtonTheme(

                                 child: DropdownButton(

                                     value: onboardCtrl.langValue,

                                     borderRadius: const BorderRadius.all(
                                         Radius.circular(AppRadius.r8)),
                                     style: AppCss.outfitSemiBold16
                                         .textColor(appCtrl.appTheme.txt),
                                     icon: Icon(Icons.arrow_drop_down,color: appCtrl.appTheme.blackColor,),
                                     isDense: true,
                                     isExpanded: true,
                                     hint: Text(fonts.english.toString().tr),
                                     items: onboardCtrl.selectLanguageLists
                                         .asMap()
                                         .entries
                                         .map((e) {
                                       return DropdownMenuItem(
                                           value: e.value.title,
                                           child: Row(children: [

                                             Text(e.value.title!.toString().tr,style: AppCss.outfitRegular12.textColor(appCtrl.appTheme.blackColor),
                                                 overflow:
                                                 TextOverflow.ellipsis)
                                                 .width(Sizes.s55)
                                           ]),
                                           onTap: () => onboardCtrl
                                               .onLanguageSelectTap(e.value));
                                     }).toList(),
                                     onChanged: (val) async {
                                       onboardCtrl.langValue = val.toString();
                                       onboardCtrl.update();
                                     })
                                     .paddingOnly(
                                     bottom: Insets.i10))),
                         const VSpace(Sizes.s15),

                       ],
                     ).marginSymmetric(horizontal: Insets.i20,vertical: Insets.i15),
                      if (onboardCtrl.isUploadSize || onboardCtrl.isOnboardUploadFile2 || onboardCtrl.isOnboardUploadFile3)
                        Column(children: [
                          const VSpace(Sizes.s5),
                          Text(fonts.imageError.tr,
                              style: AppCss.outfitMedium12
                                  .textColor(appCtrl.appTheme.redColor))
                        ]),
                      const VSpace(Sizes.s25),
                      CommonButton(
                          icon: onboardCtrl.isLoading
                              ? CircularProgressIndicator(
                                      color: appCtrl.appTheme.white)
                                  .paddingSymmetric(vertical: Insets.i10)
                              : Container(),
                          title: onboardCtrl.id != ""
                              ? fonts.update.tr
                              : fonts.submit.tr,
                          onTap: () => {},
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

        ]);
      });
    });
  }
}
