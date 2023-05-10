import '../../../config.dart';

class DashboardTitleCount extends StatelessWidget {
  final String? count,title;
  const DashboardTitleCount({Key? key,this.count,this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
              count!,
              style: AppCss.outfitSemiBold24
                  .textColor(appCtrl.appTheme.number)),
          const VSpace(Sizes.s15),
          Text(
              title!,
              style: AppCss.outfitMedium16
                  .textColor(appCtrl.appTheme.gray)
                  .letterSpace(1.3))
        ]);
  }
}
