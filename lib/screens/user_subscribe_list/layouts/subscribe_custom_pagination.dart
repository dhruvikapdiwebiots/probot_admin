import 'package:probot_admin/screens/user_subscribe_list/layouts/subscribe_pages_drop_down.dart';

import '../../../config.dart';

class SubscribeCustomPagination extends StatelessWidget {
  const SubscribeCustomPagination({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<UserSubscribeController>(builder: (userSettingCtrl) {
      return Row(
        children: [
          Container(
              padding: const EdgeInsets.symmetric(horizontal: Insets.i15),
              child: Text(
                fonts.rowPerPage.tr,
                style:
                    AppCss.outfitMedium14.textColor(appCtrl.appTheme.primary),
              )),
          if (userSettingCtrl.perPages.isNotEmpty)
            const SubscribePageDropDown(),
          Container(
              padding: const EdgeInsets.symmetric(horizontal: Insets.i15),
              child: Text(
                "${userSettingCtrl.currentPage} - ${userSettingCtrl.currentPerPage} of ${userSettingCtrl.total}",
                style: AppCss.outfitMedium14
                    .textColor(appCtrl.appTheme.blackColor),
              )),
          ArrowBack(
            onPressed: userSettingCtrl.currentPage == 1
                ? null
                : () {
                    var nextSet = userSettingCtrl.currentPage -
                        userSettingCtrl.currentPerPage!;
                    userSettingCtrl.currentPage = nextSet > 1 ? nextSet : 1;
                    userSettingCtrl.resetData(
                        start: userSettingCtrl.currentPage - 1);
                    userSettingCtrl.update();
                  },
          ),
          ArrowForward(
              onPressed: userSettingCtrl.currentPage +
                          userSettingCtrl.currentPerPage! -
                          1 >
                      userSettingCtrl.total
                  ? null
                  : () {
                      var nextSet = userSettingCtrl.currentPage +
                          userSettingCtrl.currentPerPage!;
                      userSettingCtrl.currentPage =
                          nextSet < userSettingCtrl.total
                              ? nextSet
                              : userSettingCtrl.total -
                                  userSettingCtrl.currentPerPage!;
                      userSettingCtrl.resetData(start: nextSet - 1);
                      userSettingCtrl.getChatsFromRefs();
                      userSettingCtrl.update();
                    })
        ],
      );
    });
  }
}
