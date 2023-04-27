import 'package:probot_admin/models/firebase_config.dart';

import '../../../config.dart';

class UsageControlDesktop extends StatelessWidget {
  final FirebaseConfigModel? configModel;

  const UsageControlDesktop({Key? key, this.configModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<GeneralSettingController>(builder: (usageCtrl) {
      return Stack(
        children: [
          Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                IntrinsicHeight(
                    child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                      Expanded(
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              DesktopSwitchCommon(
                                  title: fonts.isStripeEnable,
                                  value: configModel!.isStripe,
                                  onChanged: (val) =>
                                      usageCtrl.commonSwitcherValueChange(
                                          "isStripe", val)),
                              DesktopSwitchCommon(
                                  title: fonts.isPayPalEnable,
                                  value: configModel!.isPaypal,
                                  onChanged: (val) =>
                                      usageCtrl.commonSwitcherValueChange(
                                          "isPayPal", val)),
                              DesktopSwitchCommon(
                                  title: fonts.isInAppEnable,
                                  value: configModel!.isInApp,
                                  onChanged: (val) =>
                                      usageCtrl.commonSwitcherValueChange(
                                          "isInApp", val)),
                              DesktopSwitchCommon(
                                  title: fonts.isRazorPayEnable,
                                  value: configModel!.isRazorPay,
                                  onChanged: (val) =>
                                      usageCtrl.commonSwitcherValueChange(
                                          "isRazorPay", val)),
                              DesktopSwitchCommon(
                                  title: fonts.isTextCompletionEnable,
                                  value: configModel!.isTextCompletionShow,
                                  onChanged: (val) =>
                                      usageCtrl.commonSwitcherValueChange(
                                          "isTextCompletionShow", val)),
                              DesktopSwitchCommon(
                                  title: fonts.isImageGeneratorEnable,
                                  value: configModel!.isImageGeneratorShow,
                                  onChanged: (val) =>
                                      usageCtrl.commonSwitcherValueChange(
                                          "isImageGeneratorShow", val)),
                              DesktopSwitchCommon(
                                  isDivider: true,
                                  title: fonts.isRTL,
                                  value: configModel!.isRTL,
                                  onChanged: (val) => usageCtrl
                                      .commonSwitcherValueChange("isRTL", val)),
                            ]),
                      ),
                      VerticalDivider(
                              width: 1,
                              color: appCtrl.appTheme.primary.withOpacity(0.1))
                          .paddingSymmetric(horizontal: Insets.i30),
                      Expanded(
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              DesktopSwitchCommon(
                                  title: fonts.isAddEnable,
                                  value: configModel!.isAddShow,
                                  onChanged: (val) =>
                                      usageCtrl.commonSwitcherValueChange(
                                          "isAddShow", val)),
                              DesktopSwitchCommon(
                                  title: fonts.isChatHistoryEnable,
                                  value: configModel!.isChatHistory,
                                  onChanged: (val) =>
                                      usageCtrl.commonSwitcherValueChange(
                                          "isChatHistory", val)),
                              DesktopSwitchCommon(
                                  title: fonts.isChatEnable,
                                  value: configModel!.isChatShow,
                                  onChanged: (val) =>
                                      usageCtrl.commonSwitcherValueChange(
                                          "isChatShow", val)),
                              DesktopSwitchCommon(
                                  title: fonts.isGoogleAdmobEnable,
                                  value: configModel!.isGoogleAdmobEnable,
                                  onChanged: (val) =>
                                      usageCtrl.commonSwitcherValueChange(
                                          "isGoogleAdmobEnable", val)),
                              DesktopSwitchCommon(
                                  title: fonts.isTheme,
                                  value: configModel!.isTheme,
                                  onChanged: (val) =>
                                      usageCtrl.commonSwitcherValueChange(
                                          "isTheme", val)),
                              DesktopSwitchCommon(
                                  isDivider: true,
                                  title: fonts.isGuestLoginEnable,
                                  value: configModel!.isGuestLoginEnable,
                                  onChanged: (val) =>
                                      usageCtrl.commonSwitcherValueChange(
                                          "isGuestLoginEnable", val)),
                            ]),
                      ),
                    ]).marginOnly(top: Insets.i15))
              ])
              .paddingAll(Insets.i30)
              .boxExtension1()
              .marginOnly(top: Insets.i15),
          CommonButton(
            title: fonts.accessData.tr.toUpperCase(),
            onTap: () => usageCtrl.updateData(),
            style: AppCss.outfitMedium12.textColor(appCtrl.appTheme.white),
            width: Sizes.s250,
            margin: Insets.i15,
          ),
        ],
      );
    });
  }
}