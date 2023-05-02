import 'dart:developer';

import 'package:probot_admin/models/firebase_config.dart';

import '../../../config.dart';

class AdShowHide extends StatelessWidget {
  final FirebaseConfigModel? configModel;

  const AdShowHide({Key? key, this.configModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<GeneralSettingController>(builder: (settingCtrl) {
      settingCtrl.isGoogleAd == "google"
          ? configModel!.isFacebookAdEnable = false
          : configModel!.isFacebookAdEnable = true;
      return Stack(
        children: [
          SizedBox(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      DesktopSwitchCommon(
                          title: fonts.isAddEnable,
                          value: configModel!.isAddShow,
                          onChanged: (val) => settingCtrl
                              .commonSwitcherValueChange("isAddShow", val)),
                      const VSpace(Sizes.s30),
                      if (configModel!.isAddShow!)
                        Row(
                          children: [
                            Expanded(
                              child: ListTile(
                                title: Text(fonts.googleAdmobEnable.tr),
                                leading: Radio(
                                  value: "google",
                                  groupValue: settingCtrl.isGoogleAd,
                                  onChanged: (value) {
                                    settingCtrl.isGoogleAd = value!;
                                    log("settingCtrl.isGoogleAd  : ${settingCtrl.isGoogleAd}");
                                    if (settingCtrl.isGoogleAd == "google") {
                                      configModel!.isGoogleAdmobEnable = true;
                                      configModel!.isFacebookAdEnable = false;
                                    } else {
                                      configModel!.isGoogleAdmobEnable = false;
                                      configModel!.isFacebookAdEnable = true;
                                    }
                                    settingCtrl.update();
                                    settingCtrl.commonSwitcherValueChange(
                                        "isGoogleAdmobEnable",
                                        configModel!.isGoogleAdmobEnable);
                                  },
                                ),
                              ),
                            ),
                            Expanded(
                              child: ListTile(
                                  title: Text(fonts.facebookAdmobEnable.tr),
                                  leading: Radio(
                                      value: "facebook",
                                      groupValue: settingCtrl.isGoogleAd,
                                      onChanged: (value) {
                                        settingCtrl.isGoogleAd = value!;
                                        log("settingCtrl.isGoogleAd  : ${settingCtrl.isGoogleAd}");
                                        if (settingCtrl.isGoogleAd ==
                                            "facebook") {
                                          configModel!.isGoogleAdmobEnable =
                                              false;
                                          configModel!.isFacebookAdEnable =
                                              true;
                                        } else {
                                          configModel!.isGoogleAdmobEnable =
                                              true;
                                          configModel!.isFacebookAdEnable =
                                              false;
                                        }
                                        settingCtrl.update();
                                        settingCtrl.commonSwitcherValueChange(
                                            "isGoogleAdmobEnable",
                                            configModel!.isGoogleAdmobEnable);
                                      })),
                            )
                          ],
                        )
                    ],
                  ).marginOnly(top: Insets.i15),
                ),
              ],
            ).paddingAll(Insets.i30),
          ).boxExtension1().marginOnly(top: Insets.i15),
          CommonButton(
            title: fonts.adShowHide.tr.toUpperCase(),
            style: AppCss.outfitMedium12.textColor(appCtrl.appTheme.white),
            width: Sizes.s250,
            margin: Insets.i15,
          ),
        ],
      );
    });
  }
}
