import 'package:probot_admin/config.dart';
import 'package:probot_admin/models/firebase_config.dart';

class GeneralSetting extends StatelessWidget {
  final settingCtrl = Get.put(GeneralSettingController());

  GeneralSetting({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<GeneralSettingController>(builder: (_) {
      if (settingCtrl.usageCtrl != null) {
        return StreamBuilder(
            stream: FirebaseFirestore.instance
                .collection(collectionName.config)
                .snapshots(),
            builder: (context, snapShot) {
              if (snapShot.hasData) {
                FirebaseConfigModel configModel =
                    FirebaseConfigModel.fromJson(snapShot.data!.docs[0].data());
                return SingleChildScrollView(
                    child: Stack(alignment: Alignment.center, children: [
                  Form(
                      key: settingCtrl.formKey,
                      child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                            GeneralSettingResponsive(configModel: configModel),
                            const VSpace(Sizes.s20),

                            AdShowHide(configModel: configModel),
                            const VSpace(Sizes.s20),
                            if (Responsive.isDesktop(context))
                              const AllTextBoxDesktop(),
                            // Update button & Note
                            ButtonLayout(onTap: () => settingCtrl.updateData())
                          ])
                          .paddingSymmetric(
                              horizontal: Responsive.isDesktop(context)
                                  ? Insets.i100
                                  : Insets.i30,
                              vertical: Insets.i25)
                          .boxExtension()),
                  if (settingCtrl.isLoading)
                    Center(
                        child: CircularProgressIndicator(
                            color: appCtrl.appTheme.primary))
                ]));
              } else {
                return Container();
              }
            });
      } else {
        return const SomethingWrong();
      }
    });
  }
}
