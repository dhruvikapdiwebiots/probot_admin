import '../../../config.dart';

class IndexDrawer extends StatelessWidget {
  const IndexDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<IndexController>(builder: (indexCtrl) {
      return Visibility(
          visible: MediaQuery.of(context).size.width <= 992,
          child: ValueListenableBuilder<bool>(
              valueListenable: indexCtrl.isOpen,
              builder: (context, value, child) {
                return MouseRegion(
                  onHover: (val) {
                    indexCtrl.isHover = true;
                    indexCtrl.update();
                  },
                  onExit: (exit) {
                    indexCtrl.isHover = false;
                    indexCtrl.update();
                  },
                  onEnter: (enter) {
                    indexCtrl.isHover = true;
                    indexCtrl.update();
                  },
                  child: Drawer(
                      backgroundColor: appCtrl.appTheme.secondary,
                      elevation: 2,
                      child: ListView(children: [
                        const VSpace(Sizes.s40),
                        Image.asset(imageAssets.logo1, height: Sizes.s40)
                            .backgroundColor(appCtrl.appTheme.secondary),
                        const VSpace(Sizes.s30),
                        Divider(color: appCtrl.appTheme.primary.withOpacity(0.2),indent: 12,endIndent: 12),
                        const VSpace(Sizes.s20),
                         DrawerList(value:value)
                      ])),
                );
              }));
    });
  }
}
