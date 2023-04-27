import '../../../config.dart';

class SelectedIndexBodyLayout extends StatelessWidget {
  const SelectedIndexBodyLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<IndexController>(builder: (indexCtrl) {
      return Expanded(
          child: SelectionArea(
              child: CustomScrollView(
                  shrinkWrap: true,
                  controller: indexCtrl.scrollController,
                  slivers: [
            SliverList(
                delegate: SliverChildListDelegate([
              Container(
                  color: appCtrl.appTheme.bg1,
                  padding: const EdgeInsets.symmetric(horizontal: Insets.i24),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        if (Responsive.isDesktop(context))
                          Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Text(indexCtrl.pageName.tr,
                                          style: AppCss.outfitblack18.textColor(
                                              appCtrl.appTheme.secondary1)),
                                      const VSpace(Sizes.s8),
                                      Row(children: [
                                        InkWell(
                                            mouseCursor:
                                                SystemMouseCursors.click,
                                            child: Text(fonts.admin.tr,
                                                style: AppCss.outfitMedium14
                                                    .textColor(appCtrl
                                                        .appTheme.secondary1))),
                                        Text('  /  ',
                                            style: AppCss.outfitMedium14
                                                .textColor(appCtrl
                                                    .appTheme.secondary1)),
                                        Text(indexCtrl.pageName.tr,
                                            style: AppCss.outfitMedium14
                                                .textColor(appCtrl
                                                    .appTheme.secondary1))
                                      ])
                                    ]),
                                GetBuilder<AppController>(builder: (context) {
                                  return CustomSnackBar(
                                      isAlert: appCtrl.isAlert);
                                })
                              ]).marginOnly(top: Insets.i20),
                        const VSpace(Sizes.s20),
                        indexCtrl.widgetOptions
                            .elementAt(indexCtrl.selectedIndex)
                      ]))
            ])),
            SliverFillRemaining(
                hasScrollBody: false,
                fillOverscroll: true,
                child: Column(children: const <Widget>[
                  Expanded(child: SizedBox.shrink())
                ]).backgroundColor(appCtrl.appTheme.bg1))
          ])));
    });
  }
}
