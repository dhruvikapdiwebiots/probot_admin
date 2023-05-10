import 'dart:developer';
import 'package:probot_admin/config.dart';
import 'package:probot_admin/screens/subscription_list/layouts/add_subscription.dart';

class SubscriptionListController extends GetxController {
  dynamic usageCtrl;
  bool isLoading = false;
  bool isAlert = false;
  String id ="";
  TextEditingController txtTitle = TextEditingController();
  TextEditingController txtPlanType = TextEditingController();
  TextEditingController txtPrice = TextEditingController();
  TextEditingController txtType = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  //get data from firebase
  getData() async {}

  //update data
  updateData() async {
    bool isLoginTest = appCtrl.storage.read(session.isLoginTest) ?? false;
    if (isLoginTest) {
      accessDenied(fonts.modification.tr);
    } else {
      isLoading = true;
      log("usage2: $usageCtrl");
      update();
      await FirebaseFirestore.instance.collection(collectionName.plans).doc(id).update({
        "price": int.parse(txtPrice.text),
        "title": txtTitle.text
      }).then((value) {
        log("usage3: $usageCtrl");
        Get.back();
        isLoading = false;
        update();
      });
      update();
    }
  }

  addSubscriptionDialog({data}) {
    txtTitle.text = data["title"];
    txtPrice.text = data["price"].toString();
    showDialog(
        context: Get.context!,
        builder: (BuildContext context) {
          return StatefulBuilder(
              builder: (BuildContext context, StateSetter setState) {
            return const AddSubscriptionLayout();
          });
        });
  }

  onDeleteData(id) async {
    bool isLoginTest =
    appCtrl.storage.read(session.isLoginTest);
    if (isLoginTest) {
      accessDenied(fonts.modification.tr);
    } else {
      await FirebaseFirestore.instance
          .collection(collectionName.plans)
          .doc(id)
          .delete();
    }
  }

  onActiveStatusChange(id, value) async {
    bool isLoginTest =
    appCtrl.storage.read(session.isLoginTest);
    if (isLoginTest) {
      accessDenied(fonts.modification.tr);
    } else {
      await FirebaseFirestore.instance
          .collection("plans")
          .doc()
          .update({"isActive": value});
    }
  }

  @override
  void onReady() {
    getData();
    update();
    // TODO: implement onReady
    super.onReady();
  }
}
