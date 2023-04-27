import 'package:figma_squircle/figma_squircle.dart';

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
                return Container(
                        height: Sizes.s177,
                        decoration: BoxDecoration(
                            gradient: LinearGradient(
                                begin: const Alignment(9, 8),
                                end: const Alignment(-9, -8),
                                colors: [
                                  appCtrl.appTheme.primary.withOpacity(.1),
                                  Colors.white,
                                  Colors.white
                                ]),
                            borderRadius: BorderRadius.circular(Insets.i16)),
                        padding: const EdgeInsets.all(Insets.i40),
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                              index == 0
                                                  ? dashboardCtrl.totalUser
                                                      .toString()
                                                  : index == 1
                                                      ? dashboardCtrl
                                                          .totalUserSubscribe
                                                          .toString()
                                                      : dashboardCtrl
                                                          .totalCharacter
                                                          .toString(),
                                              style: AppCss.outfitSemiBold24
                                                  .textColor(
                                                      appCtrl.appTheme.number)),
                                          const VSpace(Sizes.s15),
                                          Text(
                                              dashboardCtrl.listItem[index]
                                                      ["title"]
                                                  .toString()
                                                  .tr,
                                              style: AppCss.outfitMedium16
                                                  .textColor(
                                                      appCtrl.appTheme.gray)
                                                  .letterSpace(1.3))
                                        ]),
                                    ClipRRect(
                                      borderRadius:
                                          BorderRadius.circular(AppRadius.r15),
                                      child: SvgPicture.asset(dashboardCtrl
                                              .listItem[index]["icon"])
                                          .paddingAll(Insets.i14)
                                          .decorated(
                                              color: appCtrl.appTheme.primary,
                                              borderRadius: SmoothBorderRadius(
                                                  cornerRadius: 13,
                                                  cornerSmoothing: 1)),
                                    )
                                  ]),
                            ]))
                    .paddingAll(Insets.i4)
                    .decorated(
                        borderRadius: BorderRadius.circular(Insets.i18),
                        boxShadow: const [
                          BoxShadow(
                              color: Color.fromRGBO(49, 100, 189, 0.07),
                              blurRadius: 20)
                        ],
                        color: appCtrl.appTheme.whiteColor);
              }));
    });
  }
}

