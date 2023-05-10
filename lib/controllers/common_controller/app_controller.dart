import 'dart:developer';
import 'package:fluttertoast/fluttertoast.dart';

import '../../config.dart';

class AppController extends GetxController {
  AppTheme _appTheme = AppTheme.fromType(ThemeType.light);
  final storage = GetStorage();

  AppTheme get appTheme => _appTheme;
  int selectedIndex = 0;
  bool isTheme = false;
  bool isAlert = false;
  bool isRTL = false;
  bool isLogged = false;
  String isLogin = "false";
  String languageVal = "in";
  List drawerList = [];
  int currVal = 1;
  String deviceName = "";
  String device = "";
  dynamic userAppSettingsVal;
  dynamic usageControlsVal;
  var deviceData = <String, dynamic>{};

//list of bottommost page
  List<Widget> widgetOptions = <Widget>[];

  //update theme
  updateTheme(theme) {
    _appTheme = theme;
    Get.forceAppUpdate();
  }

  //get storage data
  getStorageData() {
    bool isAdmin = appCtrl.storage.read("isSignIn") ?? false;
    appCtrl.isLogged = isAdmin;
    log("isLogin;  $isAdmin");

    bool isTheme = appCtrl.storage.read(session.isDarkMode) ?? false;
    log("isTheme : $isTheme");
    update();
    appCtrl.isTheme = isTheme;
    ThemeService().switchTheme(appCtrl.isTheme);
    appCtrl.update();

    appCtrl.languageVal = appCtrl.storage.read(session.languageCode) ?? "en";
    log("language : ${appCtrl.languageVal}");
    if (appCtrl.languageVal == "en") {
      var locale = const Locale("en", 'US');
      Get.updateLocale(locale);
    } else if (appCtrl.languageVal == "ar") {
      var locale = const Locale("ar", 'AE');
      Get.updateLocale(locale);
    } else if (appCtrl.languageVal == "hi") {
      var locale = const Locale("hi", 'IN');
      Get.updateLocale(locale);
      Get.forceAppUpdate();
    } else {
      var locale = const Locale("ko", 'KR');
      Get.updateLocale(locale);
      Get.forceAppUpdate();
    }
    update();
  }

  deleteAccount(id, email) async {
    try {
      await FirebaseFirestore.instance
          .collection("users")
          .doc(id)
          .collection("chats")
          .get()
          .then((value) {
        if (value.docs.isNotEmpty) {
          value.docs.asMap().entries.forEach((element) {
            if (element.value.data()["chatId"] != null) {
              FirebaseFirestore.instance
                  .collection("chatHistory")
                  .doc(element.value.data()["chatId"])
                  .delete();
            }
          });
        }
      }).then((value) async {
        await FirebaseFirestore.instance
            .collection("users")
            .doc(FirebaseAuth.instance.currentUser!.uid)
            .delete()
            .then((value) async {
          await FirebaseAuth.instance.currentUser!.delete().then((value) =>
              Fluttertoast.showToast(msg: fonts.deleteUserSuccessfully.tr));
        });
      });
    } on FirebaseAuthException catch (e) {
      if (e.code == 'requires-recent-login') {
        log('The user must reauthenticate before this operation can be executed.');
      }
    }
  }
}
