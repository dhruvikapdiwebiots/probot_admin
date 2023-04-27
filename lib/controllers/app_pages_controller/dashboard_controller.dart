import 'dart:async';
import 'dart:developer';

import '../../config.dart';

class DashboardController extends GetxController{
  int totalUser = 0;

  int totalUserSubscribe = 0;
  int totalCharacter = 0;
  int audioCall = 0;

  @override
  void onReady() async{
    totalUser = await FirebaseFirestore.instance.collection(collectionName.users).get().then((value) => value.size);

    FirebaseFirestore.instance.collection("userSubscribe").get().then((value) {
      log("DATA : ${value.docs.length}");
      totalUserSubscribe =  value.docs.length;
      update();
    });

    FirebaseFirestore.instance.collection("characters").get().then((value) {
      log("DATA : ${value.docs.length}");
      totalCharacter =  value.docs.length;
      update();
    });

    const oneSec = Duration(seconds: 1);
    Timer.periodic(oneSec, (Timer t) async {
        progressValue += 0.1;
        // we "finish" downloading here
        if (progressValue.toStringAsFixed(1) == '1.0') {
          loading = false;
          t.cancel();
          return;
        }
    });

  update();

    // TODO: implement onReady
    super.onReady();
  }
  bool loading = true;
  double progressValue = 0;

  final List<Map<String, dynamic>> listItem = [
    {
      'title': "totalUser",
      'icon': svgAssets.people
    },
    {
      'title': 'totalSubscription',
      'icon': svgAssets.crown
    },
    {
      'title': 'totalCharacter',
      'icon': svgAssets.android
    },
  ];
}