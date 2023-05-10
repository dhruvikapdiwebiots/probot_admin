import 'package:probot_admin/config.dart';
import 'package:probot_admin/models/firebase_config.dart';
import 'package:probot_admin/screens/abouts_us/layouts/about_us_logo.dart';
import 'package:probot_admin/screens/abouts_us/layouts/drawer_logo.dart';
import 'package:probot_admin/screens/abouts_us/layouts/home_logo.dart';

class AboutsUs extends StatelessWidget {
  final settingCtrl = Get.put(AboutUsController());

  AboutsUs({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AboutUsController>(builder: (_) {
      if (settingCtrl.usageCtrl != null) {
        return Stack(alignment: Alignment.center, children: [
          Form(
              key: settingCtrl.formKey,
              child: StreamBuilder(
                stream: FirebaseFirestore.instance.collection(collectionName.config).snapshots(),
                builder: (context,snapShot) {
                  if(snapShot.hasData) {
                    FirebaseConfigModel config = FirebaseConfigModel.fromJson(snapShot.data!.docs[0].data());
                    return Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Stack(
                            children: [
                              SizedBox(
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment
                                      .spaceBetween,
                                  children: [
                                    Expanded(
                                      child: Column(
                                          crossAxisAlignment: CrossAxisAlignment
                                              .start,
                                          mainAxisAlignment: MainAxisAlignment
                                              .start,
                                          children: [
                                            DesktopTextFieldCommon(
                                                validator: (number) =>
                                                    Validation()
                                                        .statusValidation(
                                                        number),
                                                title: fonts.privacyPolicyLink,
                                                controller:
                                                settingCtrl
                                                    .txtPrivacyPolicyLink),
                                            const VSpace(Sizes.s30),
                                            DesktopTextFieldCommon(
                                                validator: (number) =>
                                                    Validation()
                                                        .statusValidation(
                                                        number),
                                                title: fonts.rateAppAndroidId,
                                                controller:
                                                settingCtrl
                                                    .txtRateAppAndroidId),
                                            const VSpace(Sizes.s30),
                                            Column(
                                              crossAxisAlignment: CrossAxisAlignment
                                                  .start,
                                              mainAxisSize: MainAxisSize.min,
                                              children: [
                                                Text("Logo",
                                                    style: AppCss.outfitMedium18
                                                        .textColor(appCtrl
                                                        .appTheme.dark)
                                                        .textHeight(1.5)),
                                                const VSpace(Sizes.s15),
                                                AboutUsLogo( image: config.splashLogo),
                                              ],
                                            ),
                                            const VSpace(Sizes.s30),
                                            Column(
                                              crossAxisAlignment: CrossAxisAlignment
                                                  .start,
                                              children: [
                                                Text("Drawer Logo",
                                                    style: AppCss.outfitMedium18
                                                        .textColor(appCtrl
                                                        .appTheme.dark)
                                                        .textHeight(1.5)),
                                                const VSpace(Sizes.s15),
                                                 DrawerLogo(image: config.drawerLogo,),
                                              ],
                                            )
                                          ]).marginOnly(top: Insets.i15),
                                    ),
                                    const HSpace(Sizes.s30),
                                    Expanded(
                                      child: Column(
                                          crossAxisAlignment: CrossAxisAlignment
                                              .start,
                                          mainAxisAlignment: MainAxisAlignment
                                              .start,
                                          children: [
                                            DesktopTextFieldCommon(
                                                validator: (number) =>
                                                    Validation()
                                                        .statusValidation(
                                                        number),
                                                title: fonts.refundLink,
                                                controller:
                                                settingCtrl.txtRefundLink),
                                            const VSpace(Sizes.s30),
                                            DesktopTextFieldCommon(
                                                validator: (number) =>
                                                    Validation()
                                                        .statusValidation(
                                                        number),
                                                title: fonts.rateAppIOSId,
                                                controller:
                                                settingCtrl.txtRateAppIOSId),
                                            const VSpace(Sizes.s30),
                                            Column(
                                              crossAxisAlignment: CrossAxisAlignment
                                                  .start,
                                              children: [
                                                Text("Home Logo",
                                                    style: AppCss.outfitMedium18
                                                        .textColor(appCtrl
                                                        .appTheme.dark)
                                                        .textHeight(1.5)),
                                                const VSpace(Sizes.s15),
                                                 HomeLogo(image: config.homeLogo,),
                                              ],
                                            )
                                          ]).marginOnly(top: Insets.i15),
                                    ),
                                  ],
                                ).paddingAll(Insets.i30),
                              ).boxExtension1().marginOnly(top: Insets.i15),
                              CommonButton(
                                title: fonts.aboutUs.tr.toUpperCase(),
                                style: AppCss.outfitMedium12
                                    .textColor(appCtrl.appTheme.white),
                                width: Sizes.s250,
                                margin: Insets.i15,
                              ),
                            ],
                          ),
                          // Update button & Note
                          ButtonLayout(onTap: () => settingCtrl.updateData())
                        ])
                        .paddingSymmetric(
                        horizontal: Insets.i100, vertical: Insets.i25)
                        .boxExtension();
                  }else{
                    return Container();
                  }
                }
              )),
          if (settingCtrl.isLoading)
            Center(
                child:
                    CircularProgressIndicator(color: appCtrl.appTheme.primary))
        ]);
      } else {
        return Center(
            child: CircularProgressIndicator(color: appCtrl.appTheme.primary));
      }
    });
  }
}
