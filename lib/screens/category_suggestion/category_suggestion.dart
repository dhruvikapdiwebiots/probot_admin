import 'dart:developer';

import 'package:probot_admin/config.dart';
import 'package:probot_admin/screens/category_suggestion/layouts/default_text_field.dart';

class CategorySuggestion extends StatelessWidget {
  final suggestionCtrl = Get.put(CategorySuggestionController());

  CategorySuggestion({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CategorySuggestionController>(builder: (_) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CommonTextBox(
              validator: (number) => Validation().statusValidation(number),
              hinText: fonts.title,
              controller: suggestionCtrl.txtTitle),
          const VSpace(Sizes.s20),
          Form(
            key: suggestionCtrl.formKey,
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.end, children: [
              // name textfield
              DefaultTextField(
                validator: (number) => Validation().statusValidation(number),
                title: fonts.enterYourSuggestion,
                controller: suggestionCtrl.suggestionController,
                addButtonWidget: suggestionCtrl
                    .addRemoveButton(suggestionCtrl.suggestionList.isEmpty, 0)
                    .alignment(Alignment.bottomCenter),
              ),
              const VSpace(Sizes.s16),
              ...suggestionCtrl.getSuggestions(),
              const VSpace(Sizes.s40),
              CommonButton(
                margin: 0,

                title: fonts.addSuggestion.tr,
                style: AppCss.outfitMedium16.textColor(appCtrl.appTheme.white),
                width: Sizes.s200,
              )
              /*InkWell(
                    onTap: (){
                      if(suggestionCtrl.formKey.currentState!.validate()){
                        suggestionCtrl.formKey.currentState!.save();

                      }
                    },
                    child: Text('Submit'),

                  )*/
            ]),
          )
        ],
      ).paddingAll(Insets.i25).boxExtension();
    });
  }
}
