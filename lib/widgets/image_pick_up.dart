import '../config.dart';

class ImagePickUp extends StatelessWidget {
  const ImagePickUp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CommonDottedBorder(
        child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
           Icon(Icons.image,color: appCtrl.appTheme.blackColor),
          const HSpace(Sizes.s10),
          Text(fonts.addImage.tr,style: AppCss.outfitBold14.textColor(appCtrl.appTheme.blackColor))
        ]));
  }
}
