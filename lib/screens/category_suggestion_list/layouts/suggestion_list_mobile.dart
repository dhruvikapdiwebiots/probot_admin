import '../../../../config.dart';

class SuggestionListMobile extends StatelessWidget {
  final AsyncSnapshot<dynamic>? snapShot;

  const SuggestionListMobile({Key? key, this.snapShot}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CategorySuggestionController>(builder: (categoryCtrl) {
      return Column(children: [
        ...snapShot!.data!.docs.asMap().entries.map((e) {
          List suggestionList =
          e.value.data()["suggestionList"];
          return Card(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [

                      Row(children: [
                        CommonWidgetClass().commonValueText("${fonts.title.tr} - "),
                        CommonWidgetClass().commonValueText(
                            e.value.data()["title"] ?? "-"),
                      ]),
                      Row(

                          children: [
                            Icon(Icons.edit, color: appCtrl.appTheme.primary)
                                .inkWell(
                                    onTap: () {
                                      final indexCtrl =
                                      Get.isRegistered<IndexController>()
                                          ? Get.find<IndexController>()
                                          : Get.put(IndexController());
                                      indexCtrl.selectedIndex = 7;
                                      categoryCtrl.getData(e.value.id);
                                      indexCtrl.update();
                                    }),
                            const HSpace(Sizes.s20),
                            CommonSwitcher(
                                isActive: e.value.data()["isActive"] ?? true,
                                onToggle: (val) =>
                                    categoryCtrl.isActiveChange(e.value.id, val))
                          ])
                    ]).paddingAll(Insets.i10),
                const VSpace(Sizes.s20),
                ...suggestionList
                    .asMap()
                    .entries
                    .map((element) {
                  return SizedBox(
                    width: Sizes.s400,
                    child: Row(
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
                          ),
                        )
                      ],
                    ).marginOnly(bottom: Insets.i10),
                  ).paddingSymmetric(vertical: Insets.i5,horizontal: Insets.i15);
                }).toList()
              ],
            ),
          ).marginOnly(bottom: Insets.i15);
        }).toList()
      ]);
    });
  }
}
