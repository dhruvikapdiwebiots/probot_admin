import '../../../config.dart';

class AddTextFormField extends StatefulWidget {
  final int? index;

  const AddTextFormField({Key? key, this.index}) : super(key: key);

  @override
  State<AddTextFormField> createState() => _AddTextFormFieldState();
}

class _AddTextFormFieldState extends State<AddTextFormField> {
  final suggestionCtrl = Get.isRegistered<CategorySuggestionController>()
      ? Get.find<CategorySuggestionController>()
      : Get.put(CategorySuggestionController());

  @override
  void initState() {
    super.initState();
    suggestionCtrl.suggestionDynamicController = TextEditingController();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CategorySuggestionController>(builder: (suggestionCtrl) {
      return CommonTextBox(
        hinText: fonts.enterYourSuggestion.tr,
        controller: suggestionCtrl.suggestionDynamicController,
        validator: (number) => Validation().statusValidation(number),
      );

    });
  }
}
