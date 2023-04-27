import '../../config.dart';

class LoginScreen extends StatelessWidget {
  final loginCtrl = Get.put(LoginController());

  LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<LoginController>(builder: (_) {
      return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Builder(builder: (context) {
          return Scaffold(
              backgroundColor: appCtrl.appTheme.whiteColor,
              body: SizedBox(
                width: MediaQuery.of(context).size.width,
                child: Row(
                  children: [
                    Expanded(
                        child: Container(
                            height: MediaQuery.of(context).size.height,
                            alignment: Alignment.topCenter,
                            padding: const EdgeInsets.only(
                                top: Insets.i115, left: Sizes.s80, right: Sizes.s80),
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
                                              borderRadius: BorderRadius.circular(
                                                  AppRadius.r6))),
                                      const HSpace(Sizes.s20),
                                      Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            Text(
                                                "Manage your all user’s data & more"
                                                    .toUpperCase(),
                                                overflow: TextOverflow.clip,
                                                style: AppCss.outfitMedium34
                                                    .textColor(
                                                        appCtrl.appTheme.whiteColor)),
                                            const VSpace(Sizes.s15),
                                            Text(
                                              "Get better experience by using  Probot web app",
                                              style: AppCss.outfitMedium20
                                                  .textColor(appCtrl.appTheme.white
                                                      .withOpacity(.4)),
                                            ),

                                          ])
                                    ])),
                                const VSpace(Sizes.s115),
                                Image.asset(imageAssets.loginBg)
                              ],
                            ))),
                    Expanded(

                      child: GlassMorphicLayout(
                          linearGradient: loginLinearGradient(),
                          child: Column(

                              children: const [
                            DarkLanguageLayout(),
                            VSpace(Sizes.s80),
                            LoginLayout()
                          ])),
                    )
                  ],
                ),
              ));
        }),
      );
    });
  }
}
