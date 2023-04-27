import '../../../config.dart';

class ButtonLayout extends StatelessWidget {
  final GestureTapCallback? onTap;
  final bool? isNote;

  const ButtonLayout({Key? key, this.onTap, this.isNote}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SubscriptionListController>(builder: (usageCtrl) {
      return Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        (Responsive.isMobile(context) || Responsive.isTablet(context)) &&
                isNote == true
            ? SizedBox(
                    width: Sizes.s260,
                    child: Text(fonts.note.tr,
                        style: AppCss.outfitSemiBold12
                            .textColor(appCtrl.appTheme.error)
                            .textHeight(1.2)))
                .paddingOnly(left: Insets.i15)
            : Container(),
        CommonButton(
                title: fonts.update,
                onTap: onTap,
                width: Sizes.s150,
                style: AppCss.outfitMedium18
                    .textColor(appCtrl.appTheme.whiteColor))
            .paddingOnly(top: Insets.i30)
      ]);
    });
  }
}
