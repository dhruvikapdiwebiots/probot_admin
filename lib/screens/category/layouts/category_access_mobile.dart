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
            title: fonts.isStripeEnable,
            value: configModel!.isStripe,
            onChanged: (val) =>
                usageCtrl.commonSwitcherValueChange("isStripe", val)),
        MobileSwitchCommon(
            title: fonts.isPayPalEnable,
            value: configModel!.isPaypal,
            onChanged: (val) =>
                usageCtrl.commonSwitcherValueChange("isPayPal", val)),
        MobileSwitchCommon(
            title: fonts.isInAppEnable,
            value: configModel!.isInApp,
            onChanged: (val) =>
                usageCtrl.commonSwitcherValueChange("isInApp", val)),
        MobileSwitchCommon(
            title: fonts.isRazorPayEnable,
            value: configModel!.isRazorPay,
            onChanged: (val) =>
                usageCtrl.commonSwitcherValueChange("isRazorPay", val)),
        MobileSwitchCommon(
            title: fonts.isTextCompletionEnable,
            value: configModel!.isTextCompletionShow,
            onChanged: (val) => usageCtrl.commonSwitcherValueChange(
                "isTextCompletionShow", val)),
        MobileSwitchCommon(
            title: fonts.isImageGeneratorEnable,
            value: configModel!.isImageGeneratorShow,
            onChanged: (val) => usageCtrl.commonSwitcherValueChange(
                "isImageGeneratorShow", val)),
        MobileSwitchCommon(
            title: fonts.isAddEnable,
            value: configModel!.isAddShow,
            onChanged: (val) =>
                usageCtrl.commonSwitcherValueChange("isAddShow", val)),
        MobileSwitchCommon(
            title: fonts.isChatHistoryEnable,
            value: configModel!.isChatHistory,
            onChanged: (val) =>
                usageCtrl.commonSwitcherValueChange("isChatHistory", val)),
        MobileSwitchCommon(
            title: fonts.isChatEnable,
            value: configModel!.isCodeGenerator,
            onChanged: (val) =>
                usageCtrl.commonSwitcherValueChange("isChatShow", val)),
        MobileSwitchCommon(
            title: fonts.isGoogleAdmobEnable,
            value: configModel!.isGoogleAdmobEnable,
            onChanged: (val) => usageCtrl.commonSwitcherValueChange(
                "isGoogleAdmobEnable", val)),
        MobileSwitchCommon(
            title: fonts.isGuestLoginEnable,
            value: configModel!.isGuestLoginEnable,
            onChanged: (val) =>
                usageCtrl.commonSwitcherValueChange("isGuestLoginEnable", val)),
        MobileSwitchCommon(
            title: fonts.isTheme,
            value: configModel!.isTheme,
            onChanged: (val) =>
                usageCtrl.commonSwitcherValueChange("isTheme", val)),
      ]).paddingAll(Insets.i10);
    });
  }
}
