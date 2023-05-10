import '../config.dart';

class MobileTextFieldCommon extends StatelessWidget {
  final String? title;
  final TextEditingController? controller;
  final FormFieldValidator? validator;
  final bool? isNote,obscureText;

  const MobileTextFieldCommon(
      {Key? key, this.title, this.controller, this.validator, this.isNote,this.obscureText = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        Text(title!.tr,
        style: AppCss.outfitSemiBold14
            .textColor(appCtrl.appTheme.blackColor)),
      const HSpace(Sizes.s10),
      SizedBox(
        width: Sizes.s150,
        child: TextFormField(
            style: TextStyle(color: appCtrl.appTheme.blackColor),
            validator: validator,
            obscureText: obscureText!,
            cursorColor: appCtrl.appTheme.primary,
            controller: controller!,
            decoration: InputDecoration(
                errorStyle: AppCss.outfitMedium10,
                isDense: true,
                focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                        color: appCtrl.appTheme.primary, width: 2)),
                disabledBorder: OutlineInputBorder(
                    borderSide:
                        BorderSide(color: appCtrl.appTheme.primary)),
                contentPadding: const EdgeInsets.symmetric(
                    vertical: Insets.i10, horizontal: Insets.i10),
                enabledBorder: OutlineInputBorder(
                    borderSide:
                        BorderSide(color: appCtrl.appTheme.primary)),
                border: OutlineInputBorder(
                    borderSide:
                        BorderSide(color: appCtrl.appTheme.primary))))
            .paddingOnly(right: Insets.i10),
      )
    ]).paddingOnly(bottom: Insets.i20);
  }
}
