
import '../../config.dart';

class Dashboard extends StatelessWidget {
  final dashboardCtrl = Get.put(DashboardController());

  Dashboard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<DashboardController>(builder: (_) {
      return SizedBox(
          width: MediaQuery.of(context).size.width,
          child: GridView.builder(
              gridDelegate: Responsive.isMobile(context)
                  ? const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 1,
                      crossAxisSpacing: 20,
                      mainAxisSpacing: 20,
                      mainAxisExtent: 155,
                    )
                  : MediaQuery.of(context).size.width < 1500
                      ? const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: 20,
                          mainAxisSpacing: 20,
                          mainAxisExtent: 155,
                        )
                      : SliverGridDelegateWithMaxCrossAxisExtent(
                          maxCrossAxisExtent:
                              MediaQuery.of(context).size.width * 0.30,
                          crossAxisSpacing: 20,
                          mainAxisSpacing: 20,
                          mainAxisExtent: 150,
                        ),
              itemCount: dashboardCtrl.listItem.length,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                return DashboardBoxLayout(index: index).inkWell(onTap: () {
                  var indexCtrl = Get.isRegistered<IndexController>()
                      ? Get.find<IndexController>()
                      : Get.put(IndexController());
                  if (index == 0) {
                    indexCtrl.selectedIndex = 1;
                    indexCtrl.pageName = fonts.users.tr;
                  } else if (index == 1) {
                    indexCtrl.selectedIndex = 2;
                    indexCtrl.pageName = fonts.subscribeUser.tr;
                  } else {
                    indexCtrl.selectedIndex = 5;
                    indexCtrl.pageName = fonts.character.tr;
                  }
                  indexCtrl.update();
                });
              }));
    });
  }
}
