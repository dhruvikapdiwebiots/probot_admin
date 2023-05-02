import 'dart:developer';
import 'dart:math' as math;
import 'package:flutter/foundation.dart';
import 'package:probot_admin/config.dart';
import 'package:probot_admin/screens/characters/layouts/add_character.dart';
import 'dart:io' as io;

class CategoryAccessController extends GetxController {
  dynamic usageCtrl;
  bool isLoading = false;
  bool isAlert = false;
  String id = "";
  GlobalKey<FormState> formKey = GlobalKey<FormState>();



  commonSwitcherValueChange(title,value)async{
    await FirebaseFirestore.instance.collection(collectionName.categoryAccess).doc(id).update({
      title:value
    });
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
