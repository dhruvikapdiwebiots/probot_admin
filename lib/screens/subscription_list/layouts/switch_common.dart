import '../../../config.dart';

class MobileSwitchCommon extends StatelessWidget {
  final String? title;
  final bool? value;
  final ValueChanged<bool>? onChanged;
  const MobileSwitchCommon({Key? key,this.title,this.value,this.onChanged}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  SizedBox(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title!.tr,style: AppCss.outfitMedium14.textColor(appCtrl.appTheme.dark)),
          Switch(

            activeColor: appCtrl.appTheme.primary,
              materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
              value: value!, onChanged: onChanged)
        ]
      ),
    );
  }
}
