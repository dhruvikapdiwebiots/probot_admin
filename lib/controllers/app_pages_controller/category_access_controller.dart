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

  @override
  void onReady() {


    // TODO: implement onReady
    super.onReady();
  }
}
