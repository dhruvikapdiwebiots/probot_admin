import 'dart:developer';
import 'package:universal_html/html.dart' as html;
import '../../config.dart';

class LoginController extends GetxController {
  TextEditingController txtName = TextEditingController();
  TextEditingController txtPassword = TextEditingController();
  bool obscureText = true;
  final formKey = GlobalKey<FormState>(debugLabel: "Key1");
  var scaffoldDrawerKey = GlobalKey<ScaffoldState>(debugLabel: "drawer");
  var scaffoldKey = GlobalKey<ScaffoldState>(debugLabel: "key2");

  // Sign in
  signIn(context) async {

    if (formKey.currentState!.validate()) {
      try {
        await FirebaseFirestore.instance
            .collection(collectionName.admin)
            .get()
            .then((value) async {
          log("LIST : ${value.docs.length }");
          if (value.docs.isNotEmpty) {
            value.docs
                .asMap()
                .entries
                .forEach((e) async {
              log("DATA : ${e.value.data()}");
              if (e.value.data()["userName"] == txtName.text) {
                if (e.value.data()["password"] == txtPassword.text) {
                  html.window.localStorage[session.isLogin] == "true";
                  await appCtrl.storage.write(session.isLogin, true);
                  if (txtName.text == "admin@gmail.com" &&
                      txtPassword.text == "Admin1234") {
                    await appCtrl.storage.write(session.isLoginTest, true);
                  } else {
                    await appCtrl.storage.write(session.isLoginTest, false);
                  }
                  appCtrl.isLogged = true;
                  await appCtrl.storage.write("isSignIn", appCtrl.isLogged);
                  txtName.text = "";
                  txtPassword.text = "";
                  update();
                  Get.offAll(() =>
                      IndexLayout(
                        scaffoldDrawerKey: scaffoldDrawerKey,
                        scaffoldKey: scaffoldKey,
                      ));
                  final indexCtrl = Get.isRegistered<IndexController>()
                      ? Get.find<IndexController>()
                      : Get.put(IndexController());
                  indexCtrl.pageName = fonts.dashboard.tr;
                  indexCtrl.update();
                } else {
                  showAlert(context: context, title:fonts.inValidPassword.tr);
                }
              } else {
                showAlert(context: context, title: fonts.invalidEmailPassword.tr);
              }
            });
          } else {
            showAlert(context: context, title: fonts.invalidEmailPassword.tr);
          }
        });
      }catch(e){
        showAlert(context: context, title: fonts.somethingWentWrong.tr,isError: true);
      }
    }
  }

  @override
  void onReady() {
    // TODO: implement onReady
    appCtrl.getStorageData();
    super.onReady();
  }
}
