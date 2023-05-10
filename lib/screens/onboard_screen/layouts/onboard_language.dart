import '../../../config.dart';

class OnboardLanguage extends StatelessWidget {
  const OnboardLanguage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<OnboardController>(
      builder: (onboardCtrl) {
        return SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              ...onboardCtrl.selectLanguageLists
                  .asMap()
                  .entries
                  .map((e) {
                return Text(
                  e.value.title.toString().tr,
                  style: AppCss.outfitRegular14.textColor(
                      onboardCtrl.selectIndex == e.key
                          ? appCtrl.appTheme.white
                          : appCtrl.appTheme.blackColor1),
                )
                    .paddingSymmetric(
                    horizontal: Insets.i15, vertical: Insets.i10)
                    .decorated(
                    color: onboardCtrl.selectIndex == e.key
                        ? appCtrl.appTheme.primary
                        : appCtrl.appTheme.white,
                    borderRadius:
                    BorderRadius.circular(AppRadius.r5))
                    .marginOnly(right: Insets.i10)
                    .inkWell(onTap: () {
                  onboardCtrl.selectIndex = e.key;
                  onboardCtrl.update();
                });
              }).toList()
            ],
          ),
        );
      }
    );
  }
}
