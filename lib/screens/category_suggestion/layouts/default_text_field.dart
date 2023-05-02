import '../../../config.dart';

class DefaultTextField extends StatelessWidget {
  final String? title;
  final TextEditingController? controller;
  final FormFieldValidator? validator;
  final bool? isNote,isAppSettings,obscureText;
  final double? width;
  final ValueChanged<String>? onChanged;
  final Widget? addButtonWidget;

  const DefaultTextField(
      {Key? key, this.title, this.controller, this.validator,this.isNote,this.isAppSettings,this.width,this.obscureText = false,this.onChanged,this.addButtonWidget})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Text(title!.tr,
          style: AppCss.outfitMedium18
              .textColor(appCtrl.appTheme.dark).textHeight(1.5)),
      if(isNote == true)
        Text(fonts.note.tr,
            style: AppCss.outfitSemiBold12
                .textColor(appCtrl.appTheme.error).textHeight(1.2)),
      const VSpace(Sizes.s15),
      Row(
        children: [
          Expanded(
            child: CommonTextBox(hinText: title.toString().tr,controller: controller,)
          ),
          const HSpace( 32.0),
          addButtonWidget!
        ],
      )

    ]);
  }
}
