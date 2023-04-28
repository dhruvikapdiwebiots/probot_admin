import 'dart:developer';

import 'package:probot_admin/screens/onboard_screen/layouts/english_text_box.dart';
import 'package:probot_admin/screens/onboard_screen/layouts/onboard_image1.dart';
import 'package:probot_admin/screens/onboard_screen/layouts/onboard_image2.dart';
import 'package:probot_admin/screens/onboard_screen/layouts/onboard_image3.dart';
import '../../config.dart';

class OnboardScreen extends StatelessWidget {
  final onboardCtrl = Get.put(OnboardController());

  OnboardScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<OnboardController>(builder: (_) {
      return Form(
        key: onboardCtrl.formKey,
        child: Stack(
          children: [
            Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.end,
                mainAxisSize: MainAxisSize.min,
                children: [
                  SizedBox(
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text("${fonts.image.tr} 1",
                                        style: AppCss.outfitMedium18
                                            .textColor(appCtrl.appTheme.dark)
                                            .textHeight(1.5)),
                                    const VSpace(Sizes.s15),
                                    OnboardImage1(
                                      image: "",
                                    ),
                                  ],
                                ),
                                const VSpace(Sizes.s30),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text("${fonts.image.tr} 3",
                                        style: AppCss.outfitMedium18
                                            .textColor(appCtrl.appTheme.dark)
                                            .textHeight(1.5)),
                                    const VSpace(Sizes.s15),
                                    OnboardImage3(
                                      image: "",
                                    ),
                                  ],
                                )
                              ]).marginOnly(top: Insets.i15),
                        ),
                        const HSpace(Sizes.s30),
                        Expanded(
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text("${fonts.image.tr} 2",
                                        style: AppCss.outfitMedium18
                                            .textColor(appCtrl.appTheme.dark)
                                            .textHeight(1.5)),
                                    const VSpace(Sizes.s15),
                                   const OnboardImage2(
                                      image: "",
                                    ),
                                  ],
                                )
                              ]).marginOnly(top: Insets.i15),
                        ),
                      ],
                    ).paddingAll(Insets.i30),
                  ).boxExtension1().marginOnly(top: Insets.i15),
                  const VSpace(Sizes.s20),
                  Row(
                    children: [
                      ...onboardCtrl.selectLanguageLists.asMap().entries.map((e) {
                        return Text(
                          e.value.title.toString().tr,
                          style: AppCss.outfitRegular14.textColor(
                              onboardCtrl.selectIndex == e.key
                                  ? appCtrl.appTheme.white
                                  : appCtrl.appTheme.blackColor),
                        )
                            .paddingSymmetric(
                                horizontal: Insets.i15, vertical: Insets.i10)
                            .decorated(
                                color: onboardCtrl.selectIndex == e.key
                                    ? appCtrl.appTheme.primary
                                    : appCtrl.appTheme.white,
                                borderRadius: BorderRadius.circular(AppRadius.r5))
                            .inkWell(onTap: () {
                          onboardCtrl.selectIndex = e.key;
                          onboardCtrl.update();

                        });
                      }).toList()
                    ],
                  ),
                  const VSpace(Sizes.s20),
                  EnglishTextBox(
                      txtTitle: onboardCtrl.selectIndex == 0
                          ? onboardCtrl.txtEngTitle
                          : onboardCtrl.selectIndex == 1
                              ? onboardCtrl.txtHiTitle
                              : onboardCtrl.selectIndex == 2
                                  ? onboardCtrl.txtFrTitle
                                  : onboardCtrl.selectIndex == 3
                                      ? onboardCtrl.txtITTitle
                                      : onboardCtrl.selectIndex == 4
                                          ? onboardCtrl.txtGrTitle
                                          : onboardCtrl.txtJpTitle,
                      txtDesc: onboardCtrl.selectIndex == 0
                          ? onboardCtrl.txtEngDesc
                          : onboardCtrl.selectIndex == 1
                              ? onboardCtrl.txtHiDesc
                              : onboardCtrl.selectIndex == 2
                                  ? onboardCtrl.txtFrDesc
                                  : onboardCtrl.selectIndex == 3
                                      ? onboardCtrl.txtITDesc
                                      : onboardCtrl.selectIndex == 4
                                          ? onboardCtrl.txtGrDesc
                                          : onboardCtrl.txtJpDesc),
                  const VSpace(Sizes.s30),
                  CommonButton(title: fonts.submit.tr,onTap: ()=> onboardCtrl.addData(),style: AppCss.outfitRegular14.textColor(appCtrl.appTheme.white),)
                ]).paddingAll(Insets.i25).boxExtension(),
            GetBuilder<AppController>(builder: (context) {
              return CustomSnackBar(
                  isAlert: appCtrl.isAlert,text: "Please add all 3 images",);
            })
          ],
        ),
      );
    });
  }
}
