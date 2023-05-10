import '../../../config.dart';

class LoginLeftDesktopView extends StatelessWidget {
  const LoginLeftDesktopView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Container(
            height: MediaQuery.of(context).size.height,
            alignment: Alignment.topCenter,
            padding: const EdgeInsets.only(
                top: Insets.i115,
                left: Sizes.s80,
                right: Sizes.s80),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                  colors: [
                    appCtrl.appTheme.secondary,
                    appCtrl.appTheme.gradientColor,
                  ],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter),
            ),
            child: Column(
              children: [
                FittedBox(
                    fit: BoxFit.fill,
                    child: Row(children: [
                      Container(
                          width: 5,
                          height: Sizes.s90,
                          decoration: BoxDecoration(
                              color: appCtrl.appTheme.primary,
                              borderRadius:
                              BorderRadius.circular(
                                  AppRadius.r6))),
                      const HSpace(Sizes.s20),
                      Column(
                          crossAxisAlignment:
                          CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                                fonts.manageYour.tr
                                    .toUpperCase(),
                                overflow: TextOverflow.clip,
                                style: AppCss.outfitMedium30
                                    .textColor(appCtrl
                                    .appTheme.white)),
                            const VSpace(Sizes.s15),
                            Text(
                              fonts.getBetterExperience.tr,
                              style: AppCss.outfitMedium20
                                  .textColor(appCtrl
                                  .appTheme.white
                                  .withOpacity(.4)),
                            ),
                          ])
                    ])),
                const VSpace(Sizes.s115),
                Image.asset(imageAssets.loginBg,height: Sizes.s350,)
              ],
            )));
  }
}
