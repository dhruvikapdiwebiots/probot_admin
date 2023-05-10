import 'dart:developer';

import 'package:pinput/pinput.dart';
import 'package:probot_admin/screens/category_suggestion_list/layouts/suggestion_custom_pagination.dart';
import 'package:probot_admin/screens/category_suggestion_list/layouts/suggestion_list_desktop.dart';
import 'package:probot_admin/screens/category_suggestion_list/layouts/suggestion_list_mobile.dart';
import 'package:probot_admin/screens/category_suggestion_list/layouts/suggestion_search.dart';


import '../../config.dart';

class CategorySuggestionList extends StatelessWidget {
  final categoryCtrl = Get.isRegistered<CategorySuggestionController>()
      ? Get.find<CategorySuggestionController>()
      : Get.put(CategorySuggestionController());

  CategorySuggestionList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CategorySuggestionController>(builder: (_) {
      return Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          mainAxisAlignment: MainAxisAlignment.end,
          mainAxisSize: MainAxisSize.min,
          children: [
            const SuggestionSearch().alignment(Alignment.centerRight),
            const VSpace(Sizes.s20),
            StreamBuilder(
                stream: categoryCtrl.txtSearch.length > 0
                    ? categoryCtrl.getChatsFromRefs()
                    : FirebaseFirestore.instance
                    .collection(collectionName.categorySuggestion)
                    .snapshots(),
                builder: (context, snapShot) {
                  if (snapShot.hasData) {
                    log("LENTH : ${snapShot.data.docs.length}");
                    if(snapShot.data.docs.length >0) {
                      categoryCtrl.lastVisible = snapShot.data.docs.length - 1;
                      categoryCtrl.lastIndexId =
                          snapShot.data.docs[snapShot.data.docs.length - 1].id;
                    }

                    return Responsive.isDesktop(context)
                        ? SuggestionListDesktop(snapShot: snapShot,)
                        : SuggestionListMobile(
                            snapShot: snapShot,
                          );
                  } else {
                    return Container();
                  }
                }),
            const SuggestionCustomPagination()
          ]).paddingAll(Insets.i25).boxExtension();
    });
  }
}
