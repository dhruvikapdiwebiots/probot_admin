import '../config.dart';

class CommonWidgetClass {
  //common title text
  Widget commonTitleText(title) => Column(
        children: [
          Text(
            title.toString().tr.toUpperCase(),
            style: AppCss.outfitMedium16.textColor(appCtrl.isTheme
                ? appCtrl.appTheme.white
                : appCtrl.appTheme.secondary),
          ),
        ],
      ).paddingSymmetric(vertical: Insets.i20);

  //common value text
  Widget commonValueText(value, {isImage = false}) => Column(
        children: [
          isImage
              ? value != null
                  ? ClipRRect(
                      borderRadius: BorderRadius.circular(AppRadius.r50),
                      child: Image.network(
                        value,
                        height: Sizes.s50,
                        width: Sizes.s50,
                        fit: BoxFit.fill,
                      ))
                  : ClipRRect(
                      borderRadius: BorderRadius.circular(AppRadius.r50),
                      child: Image.asset(imageAssets.addUser,
                          height: Sizes.s50,
                          width: Sizes.s50,
                          fit: BoxFit.fill))
              : Text(
                  value,
                  style: AppCss.outfitRegular14
                      .textColor(appCtrl.appTheme.blackColor),
                )
        ],
      );
}
