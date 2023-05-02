import 'package:probot_admin/controllers/app_pages_controller/category_access_controller.dart';
import 'package:probot_admin/models/category_access_model.dart';
import 'package:probot_admin/models/firebase_config.dart';

import '../../../config.dart';

class CategoryAccessMobile extends StatelessWidget {
  final CategoryAccessModel? configModel;

  const CategoryAccessMobile({Key? key, this.configModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CategoryAccessController>(builder: (usageCtrl) {
      return Column(children: [
        MobileSwitchCommon(
            title: fonts.contentWritingEnable,
            value: configModel!.isContentWritingEnable,
            onChanged: (val) =>
                usageCtrl.commonSwitcherValueChange("isContentWritingEnable", val)),

        MobileSwitchCommon(
            title: fonts.essayWriterEnable,
            value: configModel!.isEssayWriterEnable,
            onChanged: (val) =>
                usageCtrl.commonSwitcherValueChange("isEssayWriterEnable", val)),
        MobileSwitchCommon(
            title: fonts.socialMediaEnable,
            value: configModel!.isSocialMediaEnable,
            onChanged: (val) => usageCtrl.commonSwitcherValueChange(
                "isSocialMediaEnable", val)),
        MobileSwitchCommon(
            title: fonts.travelEnable,
            value: configModel!.isTravelEnable,
            onChanged: (val) =>
                usageCtrl.commonSwitcherValueChange("isTravelEnable", val)),
        MobileSwitchCommon(
            title: fonts.translateAnythingEnable,
            value: configModel!.isTranslateAnythingEnable,
            onChanged: (val) =>
                usageCtrl.commonSwitcherValueChange("isTranslateAnythingEnable", val)),
        MobileSwitchCommon(
            title: fonts.codeGeneratorEnable,
            value: configModel!.isCodeGeneratorEnable,
            onChanged: (val) =>
                usageCtrl.commonSwitcherValueChange("isCodeGeneratorEnable", val)),
        MobileSwitchCommon(
            title: fonts.passwordGeneratorEnable,
            value: configModel!.isPasswordGeneratorEnable,
            onChanged: (val) =>
                usageCtrl.commonSwitcherValueChange("isPasswordGeneratorEnable", val)),
        MobileSwitchCommon(
            title: fonts.personalAdvisorEnable,
            value: configModel!.isPersonalAdvisorEnable,
            onChanged: (val) =>
                usageCtrl.commonSwitcherValueChange("isPersonalAdvisorEnable", val)),
        MobileSwitchCommon(
            title: fonts.emailGeneratorEnable,
            value: configModel!.isEmailGeneratorEnable,
            onChanged: (val) =>
                usageCtrl.commonSwitcherValueChange("isEmailGeneratorEnable", val)),

      ]).paddingAll(Insets.i10);
    });
  }
}
