
import 'package:pinput/pinput.dart';
import 'package:probot_admin/screens/user_subscribe_list/layouts/subscribe_custom_pagination.dart';
import 'package:probot_admin/screens/user_subscribe_list/layouts/user_subscribe_list_layout.dart';
import 'package:probot_admin/screens/user_subscribe_list/layouts/user_subscribe_mobile_layout.dart';

import '../../config.dart';
import 'layouts/subscribe_search_action.dart';

class UserSubscribeList extends StatelessWidget {
  final userSettingCtrl = Get.put(UserSubscribeController());

  UserSubscribeList({Key? key}) : super(key: key);

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
                      .collection(collectionName.userSubscribe)
                      .limit(userSettingCtrl.currentPerPage!)
                      .snapshots(),
              builder: (context, snapShot) {
                if (snapShot.hasData) {
                  userSettingCtrl.lastVisible = snapShot.data.docs.length - 1;
                  userSettingCtrl.lastIndexId =
                      snapShot.data.docs[snapShot.data.docs.length - 1].id;
                  return Responsive.isDesktop(context)
                      ? UserSubscribeLListLayout(snapShot: snapShot)
                      : UserSubscribeMobileLayout(snapShot: snapShot);
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
