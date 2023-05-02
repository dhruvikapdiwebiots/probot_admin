import '../config.dart';

class SomethingWrong extends StatelessWidget {
  const SomethingWrong({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(
          children: [
            Image.asset(imageAssets.failed,height: Sizes.s100,),
            const VSpace(Sizes.s20),
            Text(fonts.somethingWentWrong.tr.toUpperCase(),style: AppCss.outfitSemiBold16.textColor(appCtrl.appTheme.blackColor),),
          ],
        ));
  }
}
