import 'package:probot_admin/screens/category_suggestion_list/layouts/suggestion_list_table.dart';
import 'package:probot_admin/screens/category_suggestion_list/layouts/suggestion_widget_class.dart';
import 'package:probot_admin/screens/characters/layouts/character_mobile_layout.dart';

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
            StreamBuilder(
                stream: FirebaseFirestore.instance
                    .collection(collectionName.categorySuggestion)
                    .snapshots(),
                builder: (context, snapShot) {
                  if (snapShot.hasData) {
                    return Responsive.isDesktop(context)
                        ? SuggestionListTable(children: [
                            SuggestionWidgetClass().tableWidget(),
                            ...snapShot.data!.docs.asMap().entries.map((e) {
                              String suggestionName = "";
                              List suggestionList =
                                  e.value.data()["suggestionList"];

                              return TableRow(
                                  decoration: BoxDecoration(
                                      border: Border(
                                          bottom: BorderSide(
                                              color:
                                                  appCtrl.appTheme.primary))),
                                  children: [
                                    CommonWidgetClass()
                                        .commonValueText(e.value.id)
                                        .marginSymmetric(
                                            vertical: Insets.i12,
                                            horizontal: Insets.i10),
                                    CommonWidgetClass()
                                        .commonValueText(
                                            e.value.data()["title"])
                                        .marginSymmetric(vertical: Insets.i12),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        ...suggestionList
                                            .asMap()
                                            .entries
                                            .map((element) {
                                          return Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: [
                                              Icon(Icons.circle,
                                                  size: Sizes.s5),
                                              const HSpace(Sizes.s5),
                                              Expanded(
                                                  child: Text(
                                                element.value,
                                                overflow: TextOverflow.clip,
                                                style: AppCss.outfitRegular14
                                                    .textColor(appCtrl
                                                        .appTheme.blackColor),
                                              ))
                                            ],
                                          ).marginOnly(bottom: Insets.i10);
                                        }).toList()
                                      ],
                                    ).marginSymmetric(vertical: Insets.i10),
                                    CommonSwitcher(
                                        isActive:
                                            e.value.data()["isActive"] ?? true,
                                        onToggle: (val) => categoryCtrl
                                            .isActiveChange(e.value.id, val)),
                                    SuggestionWidgetClass().actionLayout(
                                        onTap: () {
                                      final indexCtrl =
                                          Get.isRegistered<IndexController>()
                                              ? Get.find<IndexController>()
                                              : Get.put(IndexController());
                                      indexCtrl.selectedIndex = 7;
                                      categoryCtrl.getData(e.value.id);
                                      indexCtrl.update();
                                    }).marginSymmetric(vertical: Insets.i12)
                                  ]);
                            }).toList()
                          ])
                        : CharacterMobileLayout(
                            snapShot: snapShot,
                          );
                  } else {
                    return Container();
                  }
                })
          ]).paddingAll(Insets.i25).boxExtension();
    });
  }
}
