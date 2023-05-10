import 'package:probot_admin/screens/user_list/layouts/pages_drop_down.dart';

import '../../../config.dart';

class SuggestionCustomPagination extends StatelessWidget {
  const SuggestionCustomPagination({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CategorySuggestionController>(builder: (suggestionCtrl) {
      return Row(
        children: [
          Container(
              padding: const EdgeInsets.symmetric(horizontal: Insets.i12),
              child: Text(fonts.rowPerPage.tr,
                  style: AppCss.outfitMedium14
                      .textColor(appCtrl.appTheme.primary))),
          if (suggestionCtrl.perPages.isNotEmpty) const PageDropDown(),
          Container(
              padding: const EdgeInsets.symmetric(horizontal: Insets.i12),
              child: Text(
                "${suggestionCtrl.currentPage} - ${suggestionCtrl.currentPerPage} of ${suggestionCtrl.total}",
                style: AppCss.outfitMedium14
                    .textColor(appCtrl.appTheme.blackColor),
              )),
          ArrowBack(
              onPressed: suggestionCtrl.currentPage == 1
                  ? null
                  : () {
                var nextSet =
                    suggestionCtrl.currentPage - suggestionCtrl.currentPerPage!;
                suggestionCtrl.currentPage = nextSet > 1 ? nextSet : 1;
                suggestionCtrl.resetData(start: suggestionCtrl.currentPage - 1);
                suggestionCtrl.update();
              }),
          ArrowForward(
              onPressed: suggestionCtrl.currentPage + suggestionCtrl.currentPerPage! - 1 >
                  suggestionCtrl.total
                  ? null
                  : () {
                var nextSet =
                    suggestionCtrl.currentPage + suggestionCtrl.currentPerPage!;
                suggestionCtrl.currentPage = nextSet < suggestionCtrl.total
                    ? nextSet
                    : suggestionCtrl.total - suggestionCtrl.currentPerPage!;
                suggestionCtrl.resetData(start: nextSet - 1);
                suggestionCtrl.getChatsFromRefs();
                suggestionCtrl.update();
              })
        ],
      );
    });
  }
}
