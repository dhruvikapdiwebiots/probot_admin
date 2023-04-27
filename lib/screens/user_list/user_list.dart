import 'package:pinput/pinput.dart';
import 'package:probot_admin/screens/user_list/layouts/user_custom_pagination.dart';
import 'package:probot_admin/screens/user_list/layouts/user_mobile_layout.dart';
import '../../config.dart';

class UsersList extends StatelessWidget {
  final userSettingCtrl = Get.put(UserController());

  UsersList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<UserController>(builder: (userSettingCtrl) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          const SearchAction().alignment(Alignment.centerRight),
          const VSpace(Sizes.s20),
          StreamBuilder(
              stream: userSettingCtrl.txtSearch.length > 0
                  ? userSettingCtrl.getChatsFromRefs()
                  : FirebaseFirestore.instance
                      .collection(collectionName.users)
                      .limit(userSettingCtrl.currentPerPage!)
                      .snapshots(),
              builder: (context, snapShot) {
                if (snapShot.hasData) {
                  userSettingCtrl.lastVisible = snapShot.data.docs.length - 1;
                  userSettingCtrl.lastIndexId =
                      snapShot.data.docs[snapShot.data.docs.length - 1].id;
                  return  Responsive.isDesktop(context) ? UserListLayout(
                    snapShot: snapShot,
                  ) :UserMobileLayout( snapShot: snapShot);
                } else {
                  return Container();
                }
              }),
          const UserCustomPagination()
        ],
      ).paddingAll(Insets.i25).boxExtension();
    });
  }
}
