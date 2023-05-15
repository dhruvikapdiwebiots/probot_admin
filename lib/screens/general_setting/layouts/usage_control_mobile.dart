import 'package:probot_admin/models/firebase_config.dart';

import '../../../config.dart';

class UsageControlMobile extends StatelessWidget {
  final FirebaseConfigModel? configModel;

  const UsageControlMobile({Key? key, this.configModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<GeneralSettingController>(builder: (usageCtrl) {
      return Column(children: [
        MobileSwitchCommon(
            title: fonts.isStripeEnable,
            value: configModel!.isStripe,
            onChanged: (val) =>
                usageCtrl.commonSwitcherValueChange("isStripe", val)),
        MobileSwitchCommon(
            title: fonts.isPayPalEnable,
            value: configModel!.isPaypal,
            onChanged: (val) =>
                usageCtrl.commonSwitcherValueChange("isPayPal", val)),
        MobileSwitchCommon(
            title: fonts.isInAppEnable,
            value: configModel!.isInApp,
            onChanged: (val) =>
                usageCtrl.commonSwitcherValueChange("isInApp", val)),
        MobileSwitchCommon(
            title: fonts.isRazorPayEnable,
            value: configModel!.isRazorPay,
            onChanged: (val) =>
                usageCtrl.commonSwitcherValueChange("isRazorPay", val)),

        MobileSwitchCommon(
            title: fonts.isImageGeneratorEnable,
            value: configModel!.isImageGeneratorShow,
            onChanged: (val) => usageCtrl.commonSwitcherValueChange(
                "isImageGeneratorShow", val)),
        MobileSwitchCommon(
            title: fonts.isChatHistoryEnable,
            value: configModel!.isChatHistory,
            onChanged: (val) =>
                usageCtrl.commonSwitcherValueChange("isChatHistory", val)),
        MobileSwitchCommon(
            title: fonts.isChatEnable,
            value: configModel!.isChatShow,
            onChanged: (val) =>
                usageCtrl.commonSwitcherValueChange("isChatShow", val)),
        MobileSwitchCommon(
            title: fonts.isGoogleAdmobEnable,
            value: configModel!.isGoogleAdmobEnable,
            onChanged: (val) => usageCtrl.commonSwitcherValueChange(
                "isGoogleAdmobEnable", val)),
        MobileSwitchCommon(
            title: fonts.isGuestLoginEnable,
            value: configModel!.isGuestLoginEnable,
            onChanged: (val) =>
                usageCtrl.commonSwitcherValueChange("isGuestLoginEnable", val)),
        MobileSwitchCommon(
            title: fonts.isTheme,
            value: configModel!.isTheme,
            onChanged: (val) =>
                usageCtrl.commonSwitcherValueChange("isTheme", val)),
        MobileSwitchCommon(
            title: fonts.isRTL,
            value: configModel!.isRTL,
            onChanged: (val) =>
                usageCtrl.commonSwitcherValueChange("isRTL", val)),
        MobileSwitchCommon(
            title: fonts.voiceSearchEnable,
            value: configModel!.isVoiceEnable,
            onChanged: (val) =>
                usageCtrl.commonSwitcherValueChange("isVoiceEnable", val)),
        MobileSwitchCommon(
            title: fonts.imageTextSearchEnable,
            value: configModel!.isCameraEnable,
            onChanged: (val) =>
                usageCtrl.commonSwitcherValueChange("isCameraEnable", val)),
        MobileSwitchCommon(
            title: fonts.isPaystack,
            value: configModel!.isPaystack,
            onChanged: (val) =>
                usageCtrl.commonSwitcherValueChange("isPaystack", val)),
        MobileSwitchCommon(
            title: fonts.isFlutterWave,
            value: configModel!.isFlutterWave,
            onChanged: (val) =>
                usageCtrl.commonSwitcherValueChange("isFlutterWave", val)),
        MobileSwitchCommon(
            title: fonts.isCategorySuggestion,
            value: configModel!.isCategorySuggestion,
            onChanged: (val) =>
                usageCtrl.commonSwitcherValueChange("isCategorySuggestion", val)),
        MobileTextFieldCommon(
            obscureText: true,
            validator: (number) => Validation().statusValidation(number),
            title: fonts.chatGPTKey,
            controller: usageCtrl.txtChatGPTKey),
        MobileTextFieldCommon(
            validator: (number) => Validation().statusValidation(number),
            title: fonts.balance,
            controller: usageCtrl.txtBalance),
        MobileTextFieldCommon(
            validator: (number) => Validation().statusValidation(number),
            title: fonts.rewardPoint,
            controller: usageCtrl.txtRewardPoint),
        MobileTextFieldCommon(
            validator: (number) => Validation().statusValidation(number),
            title: fonts.bannerAddId,
            controller: usageCtrl.txtBannerAddId),
        MobileTextFieldCommon(
            validator: (number) => Validation().statusValidation(number),
            title: fonts.bannerIOSId,
            controller: usageCtrl.txtBannerIOSId),
        MobileTextFieldCommon(
            validator: (number) => Validation().statusValidation(number),
            title: fonts.interstitialAdIdAndroid,
            controller: usageCtrl.txtInterstitialAdIdAndroid),
        MobileTextFieldCommon(
            validator: (number) => Validation().statusValidation(number),
            title: fonts.interstitialAdIdIOS,
            controller: usageCtrl.txtInterstitialAdIdIOS),
        MobileTextFieldCommon(
            obscureText: true,
            validator: (number) => Validation().statusValidation(number),
            title: fonts.rewardAndroidId,
            controller: usageCtrl.txtRewardAndroidId),
        MobileTextFieldCommon(
            obscureText: true,
            validator: (number) => Validation().statusValidation(number),
            title: fonts.rewardIOSId,
            controller: usageCtrl.txtRewardIOSId),
        MobileTextFieldCommon(
            obscureText: true,
            validator: (number) => Validation().statusValidation(number),
            title: fonts.payPalClientId,
            controller: usageCtrl.txtPayPalClientId),
        MobileTextFieldCommon(
            obscureText: true,
            validator: (number) => Validation().statusValidation(number),
            title: fonts.payPalSecret,
            controller: usageCtrl.txtPayPalSecret),
        MobileTextFieldCommon(
            obscureText: true,
            validator: (number) => Validation().statusValidation(number),
            title: fonts.razorPayKey,
            controller: usageCtrl.txtRazorPayKey),
        MobileTextFieldCommon(
            obscureText: true,
            validator: (number) => Validation().statusValidation(number),
            title: fonts.razorPaySecret,
            controller: usageCtrl.txtRazorSecret),
        MobileTextFieldCommon(
            obscureText: true,
            validator: (number) => Validation().statusValidation(number),
            title: fonts.stripeKey,
            controller: usageCtrl.txtStripeKey),
        MobileTextFieldCommon(
            obscureText: true,
            validator: (number) => Validation().statusValidation(number),
            title: fonts.stripePublishKey,
            controller: usageCtrl.txtStripePublishKey),
        MobileTextFieldCommon(

            validator: (number) => Validation().statusValidation(number),
            title: fonts.facebookAndroidId,
            controller: usageCtrl.txtFacebookAndroidId),
        MobileTextFieldCommon(

            validator: (number) => Validation().statusValidation(number),
            title: fonts.facebookInterstitialAdId,
            controller: usageCtrl.txtFacebookInterstitialId),
        MobileTextFieldCommon(
            validator: (number) => Validation().statusValidation(number),
            title: fonts.facebookRewardId,
            controller: usageCtrl.txtFacebookRewardId),
        MobileTextFieldCommon(
            validator: (number) => Validation().statusValidation(number),
            title: fonts.paystackPublicKey,
            controller: usageCtrl.txtPayStackPublicKey),
        MobileTextFieldCommon(
            validator: (number) => Validation().statusValidation(number),
            title: fonts.flutterWavePublicKey,
            controller: usageCtrl.txtFlutterWavePublicKey),
      ]).paddingAll(Insets.i10);
    });
  }
}
