import 'package:probot_admin/screens/user_list/layouts/pages_drop_down.dart';

import '../../../config.dart';

class UserCustomPagination extends StatelessWidget {
  const UserCustomPagination({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<UserController>(builder: (userCtrl) {
      return Row(
        children: [
          Container(
              padding: const EdgeInsets.symmetric(horizontal: Insets.i15),
              child: Text(fonts.rowPerPage.tr,
                  style: AppCss.outfitMedium14
                      .textColor(appCtrl.appTheme.primary))),
          if (userCtrl.perPages.isNotEmpty) const PageDropDown(),
          Container(
              padding: const EdgeInsets.symmetric(horizontal: Insets.i15),
              child: Text(
                "${userCtrl.currentPage} - ${userCtrl.currentPerPage} of ${userCtrl.total}",
                style: AppCss.outfitMedium14
                    .textColor(appCtrl.appTheme.blackColor),
              )),
          ArrowBack(
              onPressed: userCtrl.currentPage == 1
                  ? null
                  : () {
                      var nextSet =
                          userCtrl.currentPage - userCtrl.currentPerPage!;
                      userCtrl.currentPage = nextSet > 1 ? nextSet : 1;
                      userCtrl.resetData(start: userCtrl.currentPage - 1);
                      userCtrl.update();
                    }),
          ArrowForward(
              onPressed: userCtrl.currentPage + userCtrl.currentPerPage! - 1 >
                      userCtrl.total
                  ? null
                  : () {
                      var nextSet =
                          userCtrl.currentPage + userCtrl.currentPerPage!;
                      userCtrl.currentPage = nextSet < userCtrl.total
                          ? nextSet
                          : userCtrl.total - userCtrl.currentPerPage!;
                      userCtrl.resetData(start: nextSet - 1);
                      userCtrl.getChatsFromRefs();
                      userCtrl.update();
                    })
        ],
      );
    });
  }
}
