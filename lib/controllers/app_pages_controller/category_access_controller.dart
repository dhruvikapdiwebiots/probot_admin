
import 'package:probot_admin/config.dart';

class CategoryAccessController extends GetxController {
  dynamic usageCtrl;
  bool isLoading = false;
  bool isAlert = false;
  String id = "";
  GlobalKey<FormState> formKey = GlobalKey<FormState>();



  commonSwitcherValueChange(title,value)async{
    bool isLoginTest =
    appCtrl.storage.read(session.isLoginTest);
    if (isLoginTest) {
      accessDenied(fonts.modification.tr);
    } else {
      await FirebaseFirestore.instance.collection(collectionName.categoryAccess)
          .doc(id)
          .update({
        title: value
      });
    }
  }

  getId()async{
    await FirebaseFirestore.instance.collection(collectionName.categoryAccess).get().then((value) {
      if(value.docs.isNotEmpty){
        id = value.docs[0].id;
      }
      update();
    });
  }

  @override
  void onReady() {
getId();

    // TODO: implement onReady
    super.onReady();
  }
}
