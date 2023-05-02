

import 'package:pinput/pinput.dart';
import 'package:probot_admin/screens/top_up_users/layouts/top_up_user_list.dart';
import 'package:probot_admin/screens/top_up_users/layouts/top_up_user_mobile.dart';

import '../../config.dart';
import '../user_subscribe_list/layouts/subscribe_custom_pagination.dart';
import '../user_subscribe_list/layouts/subscribe_search_action.dart';

class TopUpUserList extends StatelessWidget {
  final userSettingCtrl = Get.put(UserSubscribeController());

  TopUpUserList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<UserSubscribeController>(builder: (userSettingCtrl) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          const SubscribeSearchAction().alignment(Alignment.centerRight),
          const VSpace(Sizes.s20),
          StreamBuilder(
              stream: userSettingCtrl.txtSearch.length > 0
                  ? userSettingCtrl.getChatsFromRefs()
                  : FirebaseFirestore.instance
                      .collection(collectionName.userSubscribe).where("isSubscribe",isEqualTo: false)
                      .limit(userSettingCtrl.currentPerPage!)
                      .snapshots(),
              builder: (context, snapShot) {
                if (snapShot.hasData) {
                  userSettingCtrl.lastVisible = snapShot.data.docs.length - 1;
                  userSettingCtrl.lastIndexId =
                      snapShot.data.docs[snapShot.data.docs.length - 1].id;
                  return Responsive.isDesktop(context)
                      ? TopUpUserListDesktop(snapShot: snapShot)
                      : TopUpUserMobile(snapShot: snapShot);
                } else {
                  return Container();
                }
              }),
          const SubscribeCustomPagination()
        ],
      ).paddingAll(Insets.i25).boxExtension();
    });
  }
}
