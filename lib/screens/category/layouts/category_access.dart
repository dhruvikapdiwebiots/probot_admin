
import 'package:probot_admin/models/category_access_model.dart';

import '../../../../config.dart';

class CategoryAccessDesktop extends StatelessWidget {
  final CategoryAccessModel? configModel;

  const CategoryAccessDesktop({Key? key, this.configModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CategoryAccessController>(builder: (usageCtrl) {
      return Stack(
        children: [
          Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                IntrinsicHeight(
                    child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                      Expanded(
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              DesktopSwitchCommon(
                                  title: fonts.contentWritingEnable,
                                  value: configModel!.isContentWritingEnable,
                                  onChanged: (val) =>
                                      usageCtrl.commonSwitcherValueChange(
                                          "isContentWritingEnable", val)),
                              DesktopSwitchCommon(
                                  title: fonts.essayWriterEnable,
                                  value: configModel!.isEssayWriterEnable,
                                  onChanged: (val) =>
                                      usageCtrl.commonSwitcherValueChange(
                                          "isEssayWriterEnable", val)),
                              DesktopSwitchCommon(
                                  title: fonts.socialMediaEnable,
                                  value: configModel!.isSocialMediaEnable,
                                  onChanged: (val) =>
                                      usageCtrl.commonSwitcherValueChange(
                                          "isSocialMediaEnable", val)),
                              DesktopSwitchCommon(
                                  title: fonts.emailGeneratorEnable,
                                  value: configModel!.isEmailGeneratorEnable,
                                  onChanged: (val) =>
                                      usageCtrl.commonSwitcherValueChange(
                                          "isEmailGeneratorEnable", val)),
                              DesktopSwitchCommon(
                                  title: fonts.travelEnable,
                                  value: configModel!.isTravelEnable,
                                  onChanged: (val) =>
                                      usageCtrl.commonSwitcherValueChange(
                                          "isTravelEnable", val)),

                            ]),
                      ),
                      VerticalDivider(
                              width: 1,
                              color: appCtrl.appTheme.primary.withOpacity(0.1))
                          .paddingSymmetric(horizontal: Insets.i30),
                      Expanded(
                          child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                            DesktopSwitchCommon(
                                title: fonts.passwordGeneratorEnable,
                                value: configModel!.isPasswordGeneratorEnable,
                                onChanged: (val) =>
                                    usageCtrl.commonSwitcherValueChange(
                                        "isPasswordGeneratorEnable", val)),

                            DesktopSwitchCommon(
                                title: fonts.codeGeneratorEnable,
                                value: configModel!.isCodeGeneratorEnable,
                                onChanged: (val) =>
                                    usageCtrl.commonSwitcherValueChange(
                                        "isCodeGeneratorEnable", val)),
                            DesktopSwitchCommon(
                                title: fonts.personalAdvisorEnable,
                                value: configModel!.isPersonalAdvisorEnable,
                                onChanged: (val) =>
                                    usageCtrl.commonSwitcherValueChange(
                                        "isPersonalAdvisorEnable", val)),
                            DesktopSwitchCommon(
                                title: fonts.translateAnythingEnable,
                                value: configModel!.isTranslateAnythingEnable,
                                onChanged: (val) =>
                                    usageCtrl.commonSwitcherValueChange(
                                        "isTranslateAnythingEnable", val)),
                          ]))
                    ]).marginOnly(top: Insets.i15))
              ])
              .paddingAll(Insets.i30)
              .boxExtension1()
              .marginOnly(top: Insets.i15),
        ],
      );
    });
  }
}
