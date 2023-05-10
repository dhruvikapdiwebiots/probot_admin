import '../../../config.dart';

class AddTextFormField extends StatefulWidget {
  final int? index;
  final String? text;

  const AddTextFormField({Key? key, this.index,this.text}) : super(key: key);

  @override
  State<AddTextFormField> createState() => _AddTextFormFieldState();
}

class _AddTextFormFieldState extends State<AddTextFormField> {
  final suggestionCtrl = Get.isRegistered<CategorySuggestionController>()
      ? Get.find<CategorySuggestionController>()
      : Get.put(CategorySuggestionController());
  TextEditingController? _nameController;
  int index = 0;

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController();
    if(widget.text !=null){
      _nameController!.text = widget.text!;
    }
    index = widget.index!;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      _nameController!.text = suggestionCtrl.suggestionList[widget.index!];
    });
    return GetBuilder<CategorySuggestionController>(builder: (suggestionCtrl) {
      return CommonTextBox(
        onChanged: (v) => suggestionCtrl.suggestionList[widget.index!] = v,
        hinText: fonts.enterYourSuggestion.tr,
        controller: _nameController,
        validator: (number) => Validation().statusValidation(number),
      );
    });
  }
}
