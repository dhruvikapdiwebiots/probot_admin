
import '../../../config.dart';

class OnboardDesktop extends StatelessWidget {
  const OnboardDesktop({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<OnboardController>(builder: (onboardCtrl) {
      return SizedBox(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                  Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("${fonts.image.tr} 1",
                            style: AppCss.outfitMedium18
                                .textColor(appCtrl.appTheme.dark)
                                .textHeight(1.5)),
                        const VSpace(Sizes.s15),
                        OnboardImage1(image: onboardCtrl.imageUrl),
                        const VSpace(Sizes.s20),
                        if (onboardCtrl.isAlert == true &&
                            onboardCtrl.pickImage == null)
                          Text("Please Upload Image",
                              style: AppCss.outfitSemiBold16
                                  .textColor(appCtrl.appTheme.redColor))
                      ]),
                  Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("${fonts.image.tr} 2",
                            style: AppCss.outfitMedium18
                                .textColor(appCtrl.appTheme.dark)
                                .textHeight(1.5)),
                        OnboardImage2(image: onboardCtrl.imageUrl2),
                        const VSpace(Sizes.s20),
                        if (onboardCtrl.isAlert == true &&
                            onboardCtrl.onboardPickImage2 == null)
                          Text("Please Upload Image",
                              style: AppCss.outfitSemiBold16
                                  .textColor(appCtrl.appTheme.redColor))
                      ]),
                  Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("${fonts.image.tr} 3",
                            style: AppCss.outfitMedium18
                                .textColor(appCtrl.appTheme.dark)
                                .textHeight(1.5)),
                        OnboardImage3(image: onboardCtrl.imageUrl3),
                        const VSpace(Sizes.s20),
                        if (onboardCtrl.isAlert == true &&
                            onboardCtrl.onboardPickImage3 == null)
                          Text("Please Upload Image",
                              style: AppCss.outfitSemiBold16
                                  .textColor(appCtrl.appTheme.redColor))
                      ])
                ]).marginOnly(top: Insets.i15)),
            const HSpace(Sizes.s30),
          ],
        ).paddingAll(Insets.i30),
      ).boxExtension1().marginOnly(top: Insets.i15);
    });
  }
}
