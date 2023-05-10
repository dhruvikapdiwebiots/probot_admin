import '../../config.dart';

class OnboardScreen extends StatelessWidget {
  final onboardCtrl = Get.put(OnboardController());

  OnboardScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<OnboardController>(builder: (_) {
      return Form(
          key: onboardCtrl.formKey,
          child: Stack(children: [
            Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.end,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Responsive.isDesktop(context)
                      ? const OnboardDesktop()
                      : const OnboardMobileLayout(),
                  const VSpace(Sizes.s20),
                  const OnboardLanguage(),
                  const VSpace(Sizes.s20),
                  EnglishTextBox(
                      txtTitle: onboardCtrl.selectIndex == 0
                          ? onboardCtrl.txtEngTitle
                          : onboardCtrl.selectIndex == 1
                              ? onboardCtrl.txtHiTitle
                              : onboardCtrl.selectIndex == 2
                                  ? onboardCtrl.txtFrTitle
                                  : onboardCtrl.selectIndex == 3
                                      ? onboardCtrl.txtITTitle
                                      : onboardCtrl.selectIndex == 4
                                          ? onboardCtrl.txtGrTitle
                                          : onboardCtrl.txtJpTitle,
                      txtDesc: onboardCtrl.selectIndex == 0
                          ? onboardCtrl.txtEngDesc
                          : onboardCtrl.selectIndex == 1
                              ? onboardCtrl.txtHiDesc
                              : onboardCtrl.selectIndex == 2
                                  ? onboardCtrl.txtFrDesc
                                  : onboardCtrl.selectIndex == 3
                                      ? onboardCtrl.txtITDesc
                                      : onboardCtrl.selectIndex == 4
                                          ? onboardCtrl.txtGrDesc
                                          : onboardCtrl.txtJpDesc),
                  const VSpace(Sizes.s30),
                  CommonButton(
                      icon: onboardCtrl.isLoading
                          ? const CircularProgressIndicator()
                          : Container(),
                      title: onboardCtrl.id != ""
                          ? fonts.update.tr
                          : fonts.submit.tr,
                      onTap: () => onboardCtrl.id != ""
                          ? onboardCtrl.updateData()
                          : onboardCtrl.uploadLogoFile(),
                      style: AppCss.outfitRegular14
                          .textColor(appCtrl.appTheme.white))
                ]).paddingAll(Insets.i25).boxExtension(),
            CustomSnackBar(
                isAlert: onboardCtrl.isTextAlert,
                text: "Please Fill all the Text box")
          ]));
    });
  }
}
