import '../../../config.dart';

class AllTextBoxDesktop extends StatelessWidget {
  const AllTextBoxDesktop({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<GeneralSettingController>(
      builder: (settingCtrl) {
        return Stack(
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
                            title:
                            fonts.rewardAndroidId,
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
                            controller: settingCtrl
                                .txtStripeKey),
                        const VSpace(Sizes.s30),
                        DesktopTextFieldCommon(

                            validator: (number) =>
                                Validation()
                                    .statusValidation(
                                    number),
                            title: fonts.facebookAndroidId,
                            controller: settingCtrl
                                .txtFacebookAndroidId),
                        const VSpace(Sizes.s30),
                        DesktopTextFieldCommon(

                            validator: (number) =>
                                Validation()
                                    .statusValidation(
                                    number),
                            title: fonts.facebookRewardId,
                            controller: settingCtrl
                                .txtFacebookRewardId),
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
                                title: fonts
                                    .interstitialAdIdIOS,
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
                                title:
                                fonts.stripePublishKey,
                                controller: settingCtrl
                                    .txtStripePublishKey),
                            const VSpace(Sizes.s30),
                            DesktopTextFieldCommon(

                                validator: (number) =>
                                    Validation()
                                        .broadCastValidation(
                                        number),
                                title:
                                fonts.facebookInterstitialAdId,
                                controller: settingCtrl
                                    .txtFacebookInterstitialId),
                          ]).marginOnly(top: Insets.i15)),
                ],
              ).paddingAll(Insets.i30),
            )
                .boxExtension1()
                .marginOnly(top: Insets.i15),
            CommonButton(
              title: fonts.credentials.tr.toUpperCase(),
              style: AppCss.outfitMedium12
                  .textColor(appCtrl.appTheme.white),
              width: Sizes.s250,
              margin: Insets.i15,
            ),
          ],
        );
      }
    );
  }
}
