import 'package:probot_admin/models/firebase_config.dart';

import '../../../config.dart';

class GeneralSettingResponsive extends StatelessWidget {
  final FirebaseConfigModel? configModel;
  const GeneralSettingResponsive({Key? key,this.configModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  SizedBox(
        child: Column(
            mainAxisAlignment:
            MainAxisAlignment.spaceBetween,
            children: [
              Responsive.isMobile(context) ||
                  Responsive.isTablet(context)
              // Mobile view
                  ? UsageControlMobile(
                configModel: configModel,
              )
              // Desktop view
                  : UsageControlDesktop(
                  configModel: configModel),
            ]));
  }
}
