import '../../../config.dart';

class SubscribePageDropDown extends StatelessWidget {
  const SubscribePageDropDown({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<UserSubscribeController>(builder: (bannerCtrl) {
      return Container(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: DropdownButton<int>(
          value: bannerCtrl.currentPerPage,
          items: bannerCtrl.perPages
              .map((e) => DropdownMenuItem<int>(
                  value: e,
                  child: Text("$e",
                      style: AppCss.outfitMedium14
                          .textColor(appCtrl.appTheme.blackColor))))
              .toList(),
          onChanged: (dynamic value) {
            bannerCtrl.currentPerPage = value;
            bannerCtrl.currentPage = 1;
            bannerCtrl.resetData();
            bannerCtrl.update();
          },
          isExpanded: false,
        ),
      );
    });
  }
}
