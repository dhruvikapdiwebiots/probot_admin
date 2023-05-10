import 'package:probot_admin/screens/category_suggestion_list/layouts/suggestion_list_table.dart';
import 'package:probot_admin/screens/category_suggestion_list/layouts/suggestion_widget_class.dart';

import '../../../config.dart';

class SuggestionListDesktop extends StatelessWidget {
  final AsyncSnapshot<dynamic>? snapShot;
  const SuggestionListDesktop({Key? key,this.snapShot}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CategorySuggestionController>(
      builder: (categoryCtrl) {
        return SuggestionListTable(children: [
          SuggestionWidgetClass().tableWidget(),
          ...snapShot!.data!.docs.asMap().entries.map((e) {
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
                          const  Icon(Icons.circle,
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
        ]);
      }
    );
  }
}
