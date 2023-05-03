import 'dart:developer';
import '../../../config.dart';
import 'dart:html' as html;

class DrawerList extends StatelessWidget {
  final bool? value;

  const DrawerList({Key? key, this.value}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<IndexController>(builder: (indexCtrl) {
      return Column(children: [
        ...appArray.drawerList.asMap().entries.map((e) {
          return MouseRegion(
              onHover: (val) {
                indexCtrl.isHover = true;
                indexCtrl.isSelectedHover = e.key;
                indexCtrl.update();
              },
              onExit: (exit) {
                indexCtrl.isHover = false;
                indexCtrl.update();
                log("val : ${indexCtrl.isHover}");
              },
              child: Container(
                      alignment: Alignment.center,
                      padding: EdgeInsets.symmetric(
                          horizontal:
                              Responsive.isDesktop(context) && value == false
                                  ? 0
                                  : Insets.i15,
                          vertical: Insets.i5),
                      width: double.infinity,
                      child: Responsive.isDesktop(context) && value == false
                          ? SvgPicture.asset(e.value["icon"]!)
                          : Row(children: [
                              SvgPicture.asset(appCtrl.isTheme ? e.value["darkIcon"]! : e.value["icon"]!),
                              const HSpace(Sizes.s20),
                              Responsive.isDesktop(context) && value == false
                                  ? Container()
                                  : Expanded(
                                child: Text(e.value["title"] != null? e.value["title"].toString().tr:"",
                                        style: AppCss.outfitMedium14.textColor(
                                            indexCtrl.selectedIndex == e.key
                                                ? appCtrl.appTheme.white
                                                : indexCtrl.isHover &&
                                                        indexCtrl
                                                                .isSelectedHover ==
                                                            e.key
                                                    ? appCtrl.appTheme.white
                                                    : appCtrl.appTheme.txt)),
                                  )
                            ]))
                  .inkWell(onTap: () {
                    indexCtrl.selectedIndex = e.key;
                    indexCtrl.pageName = e.value["title"]!;
                    if (!Responsive.isDesktop(context)) {
                      Get.back();
                    }
                    if(e.value["title"] == "categorySuggestion"){
                      final suggestionCtrl = Get.isRegistered<CategorySuggestionController>() ? Get.find<CategorySuggestionController>() : Get.put(CategorySuggestionController());
                      suggestionCtrl.onReady();
                    }
                    if (e.value["title"] == "logout") {
                      FirebaseAuth.instance.signOut();
                      indexCtrl.selectedIndex = 0;
                      html.window.localStorage[session.isLogin] = "false";
                      appCtrl.isLogged = false;
                      appCtrl.storage.remove("isSignIn");
                      appCtrl.storage.remove(session.isDarkMode);
                      appCtrl.storage.remove(session.languageCode);
                      log("index: ${indexCtrl.selectedIndex}");
                      Get.offAll(() => LoginScreen());
                    }
                    indexCtrl.update();
                  })
                  .decorated(
                      borderRadius:
                          const BorderRadius.all(Radius.circular(AppRadius.r6)),
                      color: Responsive.isDesktop(context) && value == false
                          ? appCtrl.appTheme.secondary
                          : indexCtrl.selectedIndex == e.key
                              ? appCtrl.appTheme.primary
                              : indexCtrl.isHover &&
                                      indexCtrl.isSelectedHover == e.key
                                  ? appCtrl.appTheme.primaryLight
                                  : appCtrl.appTheme.secondary)
                  .paddingSymmetric(
                      horizontal: Insets.i15, vertical: Insets.i10));
        }).toList()
      ]);
    });
  }
}
