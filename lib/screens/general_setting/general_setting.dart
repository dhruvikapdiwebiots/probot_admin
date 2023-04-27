import 'dart:developer';

import 'package:probot_admin/config.dart';
import 'package:probot_admin/models/firebase_config.dart';

import 'layouts/usage_control_mobile.dart';

class GeneralSetting extends StatelessWidget {
  final settingCtrl = Get.put(GeneralSettingController());

  GeneralSetting({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<GeneralSettingController>(builder: (_) {
      if (settingCtrl.usageCtrl != null) {
        log("ISMOVIE :${Responsive.isMobile(context) || Responsive.isTablet(context)}");
        return StreamBuilder(
            stream: FirebaseFirestore.instance
                .collection(collectionName.config)
                .snapshots(),
            builder: (context, snapShot) {
              if (snapShot.hasData) {
                FirebaseConfigModel configModel =
                    FirebaseConfigModel.fromJson(snapShot.data!.docs[0].data());
                return Stack(alignment: Alignment.center, children: [
                  Form(
                      key: settingCtrl.formKey,
                      child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                            SizedBox(
                                child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                  Responsive.isMobile(context) ||
                                          Responsive.isTablet(context)
                                      // Mobile view
                                      ?  UsageControlMobile(configModel: configModel,)
                                      // Desktop view
                                      :  UsageControlDesktop(configModel: configModel),
                                ])),
                            const VSpace(Sizes.s20),
                            if (Responsive.isDesktop(context))
                              Stack(
                                children: [
                                  SizedBox(
                                    child: Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Expanded(
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.end,
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: [
                                              DesktopTextFieldCommon(
                                                  obscureText: true,
                                                  validator: (number) =>
                                                      Validation()
                                                          .statusValidation(
                                                              number),
                                                  title: fonts.chatGPTKey,
                                                  controller: settingCtrl
                                                      .txtChatGPTKey),
                                              const VSpace(Sizes.s30),
                                              DesktopTextFieldCommon(
                                                  validator: (number) =>
                                                      Validation()
                                                          .statusValidation(
                                                              number),
                                                  title: fonts.bannerAddId,
                                                  controller: settingCtrl
                                                      .txtBannerAddId),
                                              const VSpace(Sizes.s30),
                                              DesktopTextFieldCommon(
                                                  validator: (number) =>
                                                      Validation()
                                                          .statusValidation(
                                                              number),
                                                  title: fonts
                                                      .interstitialAdIdAndroid,
                                                  controller: settingCtrl
                                                      .txtInterstitialAdIdAndroid),
                                              const VSpace(Sizes.s30),
                                              DesktopTextFieldCommon(
                                                  validator: (number) =>
                                                      Validation()
                                                          .statusValidation(
                                                              number),
                                                  title: fonts.rewardAndroidId,
                                                  controller: settingCtrl
                                                      .txtRewardAndroidId),
                                              const VSpace(Sizes.s30),
                                              DesktopTextFieldCommon(
                                                  obscureText: true,
                                                  validator: (number) =>
                                                      Validation()
                                                          .statusValidation(
                                                              number),
                                                  title: fonts.razorPayKey,
                                                  controller: settingCtrl
                                                      .txtRazorPayKey),
                                              const VSpace(Sizes.s30),
                                              DesktopTextFieldCommon(
                                                  obscureText: true,
                                                  validator: (number) =>
                                                      Validation()
                                                          .statusValidation(
                                                              number),
                                                  title: fonts.payPalClientId,
                                                  controller: settingCtrl
                                                      .txtPayPalClientId),
                                              const VSpace(Sizes.s30),
                                              DesktopTextFieldCommon(
                                                  obscureText: true,
                                                  validator: (number) =>
                                                      Validation()
                                                          .statusValidation(
                                                              number),
                                                  title: fonts.stripeKey,
                                                  controller:
                                                      settingCtrl.txtStripeKey),
                                              const VSpace(Sizes.s30),
                                            ],
                                          ).marginOnly(top: Insets.i15),
                                        ),
                                        const HSpace(Sizes.s30),
                                        Expanded(
                                            child: Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                              DesktopTextFieldCommon(
                                                  validator: (number) =>
                                                      Validation()
                                                          .statusValidation(
                                                              number),
                                                  title: fonts.balance,
                                                  controller:
                                                      settingCtrl.txtBalance),
                                              const VSpace(Sizes.s30),
                                              DesktopTextFieldCommon(
                                                  validator: (number) =>
                                                      Validation()
                                                          .statusValidation(
                                                              number),
                                                  title: fonts.bannerIOSId,
                                                  controller: settingCtrl
                                                      .txtBannerIOSId),
                                              const VSpace(Sizes.s30),
                                              DesktopTextFieldCommon(
                                                  validator: (number) =>
                                                      Validation()
                                                          .statusValidation(
                                                              number),
                                                  title:
                                                      fonts.interstitialAdIdIOS,
                                                  controller: settingCtrl
                                                      .txtInterstitialAdIdIOS),
                                              const VSpace(Sizes.s30),
                                              DesktopTextFieldCommon(
                                                  validator: (number) =>
                                                      Validation()
                                                          .broadCastValidation(
                                                              number),
                                                  title: fonts.rewardIOSId,
                                                  controller: settingCtrl
                                                      .txtRewardIOSId),
                                              const VSpace(Sizes.s30),
                                              DesktopTextFieldCommon(
                                                  obscureText: true,
                                                  validator: (number) =>
                                                      Validation()
                                                          .broadCastValidation(
                                                              number),
                                                  title: fonts.razorPaySecret,
                                                  controller: settingCtrl
                                                      .txtRazorSecret),
                                              const VSpace(Sizes.s30),
                                              DesktopTextFieldCommon(
                                                  obscureText: true,
                                                  validator: (number) =>
                                                      Validation()
                                                          .broadCastValidation(
                                                              number),
                                                  title: fonts.payPalSecret,
                                                  controller: settingCtrl
                                                      .txtPayPalSecret),
                                              const VSpace(Sizes.s30),
                                              DesktopTextFieldCommon(
                                                  obscureText: true,
                                                  validator: (number) =>
                                                      Validation()
                                                          .broadCastValidation(
                                                              number),
                                                  title: fonts.stripePublishKey,
                                                  controller: settingCtrl
                                                      .txtStripePublishKey),
                                            ]).marginOnly(top: Insets.i15)),
                                      ],
                                    ).paddingAll(Insets.i30),
                                  ).boxExtension1().marginOnly(top: Insets.i15),
                                  CommonButton(
                                    title: fonts.credentials.tr.toUpperCase(),
                                    style: AppCss.outfitMedium12
                                        .textColor(appCtrl.appTheme.white),
                                    width: Sizes.s250,
                                    margin: Insets.i15,
                                  ),
                                ],
                              ),
                            // Update button & Note
                            ButtonLayout(onTap: () => settingCtrl.updateData())
                          ])
                          .paddingSymmetric(
                              horizontal: Responsive.isDesktop(context)
                                  ? Insets.i100
                                  : Insets.i30,
                              vertical: Insets.i25)
                          .boxExtension()),
                  if (settingCtrl.isLoading)
                    Center(
                        child: CircularProgressIndicator(
                            color: appCtrl.appTheme.primary))
                ]);
              } else {
                return Container();
              }
            });
      } else {
        return Center(
            child: CircularProgressIndicator(color: appCtrl.appTheme.primary));
      }
    });
  }
}
