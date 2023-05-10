import 'package:flutter/services.dart';

import '../config.dart';

class CommonWidgetClass {
  //common title text
  Widget commonTitleText(title) => Column(
        children: [
          Text(
            title.toString().tr.toUpperCase(),
            style: AppCss.outfitMedium14.textColor(appCtrl.isTheme
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

  //credential copy
  Widget credentialCopy(title) => Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title,
              style:
                  AppCss.outfitMedium14.textColor(appCtrl.appTheme.blackColor)),
          Icon(Icons.copy, size: Sizes.s20, color: appCtrl.appTheme.blackColor)
              .inkWell(onTap: () {
            Clipboard.setData(ClipboardData(text: title));
          })
        ],
      );

  //action layout
  Widget actionLayout({GestureTapCallback? onTap, isUser = true}) =>
      Column(children: [
        Icon(isUser ?Icons.delete : Icons.edit,
            color: appCtrl.appTheme.primary)
            .inkWell(onTap:onTap)
      ]).marginSymmetric(vertical: Insets.i15);
}
