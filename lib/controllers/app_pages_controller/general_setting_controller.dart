import 'dart:developer';
import 'dart:math' as math;
import 'package:flutter/foundation.dart';
import 'package:probot_admin/config.dart';
import 'package:probot_admin/screens/characters/layouts/add_character.dart';
import 'dart:io' as io;

class GeneralSettingController extends GetxController {
  dynamic usageCtrl;
  bool isLoading = false;
  bool isAlert = false;
  String id = "";
  TextEditingController txtBannerAddId = TextEditingController();
  TextEditingController txtBannerIOSId = TextEditingController();
  TextEditingController txtChatGPTKey = TextEditingController();
  TextEditingController txtInterstitialAdIdAndroid = TextEditingController();
  TextEditingController txtInterstitialAdIdIOS = TextEditingController();
  TextEditingController txtPayPalClientId = TextEditingController();
  TextEditingController txtPayPalSecret = TextEditingController();
  TextEditingController txtRazorPayKey = TextEditingController();
  TextEditingController txtRazorSecret = TextEditingController();
  TextEditingController txtStripeKey = TextEditingController();
  TextEditingController txtStripePublishKey = TextEditingController();
  TextEditingController txtBalance = TextEditingController();
  TextEditingController txtRewardAndroidId = TextEditingController();
  TextEditingController txtRewardIOSId = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  //get data from firebase
  getData() async {
    await FirebaseFirestore.instance.collection("config").get().then((value) {
      if (value.docs.isNotEmpty) {
        id = value.docs[0].id;
        usageCtrl = value.docs[0].data();
        txtBannerAddId.text = usageCtrl["bannerAddId"];
        txtBannerIOSId.text = usageCtrl["bannerIOSId"];
        txtChatGPTKey.text = usageCtrl["chatGPTKey"];
        txtInterstitialAdIdAndroid.text = usageCtrl["interstitialAdIdAndroid"];
        txtInterstitialAdIdIOS.text = usageCtrl["interstitialAdIdIOS"];
        txtPayPalClientId.text = usageCtrl["payPalClientId"];
        txtPayPalSecret.text = usageCtrl["payPalSecret"];
        txtRazorPayKey.text = usageCtrl["razorPayKey"];
        txtRazorSecret.text = usageCtrl["razorPaySecret"];
        txtStripeKey.text = usageCtrl["stripeKey"];
        txtStripePublishKey.text = usageCtrl["stripePublishKey"];
        txtBalance.text = usageCtrl["balance"].toString();
        txtRewardAndroidId.text = usageCtrl["rewardAndroidId"];
        txtRewardIOSId.text = usageCtrl["rewardIOSId"];
      }
    });
    update();
  }

  updateData() async {
    await FirebaseFirestore.instance.collection("config").doc(id).update({
      "bannerAddId": txtBannerAddId.text,
      "bannerIOSId": txtBannerIOSId.text,
      "chatGPTKey": txtChatGPTKey.text,
      "interstitialAdIdAndroid": txtInterstitialAdIdAndroid.text,
      "interstitialAdIdIOS": txtInterstitialAdIdIOS.text,
      "payPalClientId": txtPayPalClientId.text,
      "payPalSecret": txtPayPalSecret.text,
      "razorPayKey": txtRazorPayKey.text,
      "razorPaySecret": txtRazorSecret.text,
      "stripeKey": txtStripeKey.text,
      "stripePublishKey": txtStripePublishKey.text,
      "balance": txtBalance.text,
      "rewardAndroidId": txtRewardAndroidId.text,
      "rewardIOSId": txtRewardIOSId.text,
    });
  }

  commonSwitcherValueChange(title,value)async{
    await FirebaseFirestore.instance.collection("config").doc(id).update({
      title:value
    });
  }

  @override
  void onReady() {
    getData();

    // TODO: implement onReady
    super.onReady();
  }
}
