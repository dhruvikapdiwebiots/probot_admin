

import 'package:probot_admin/config.dart';


class CategorySuggestion extends StatelessWidget {
  final suggestionCtrl = Get.put(CategorySuggestionController());

  CategorySuggestion({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CategorySuggestionController>(builder: (_) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Form(
            key: suggestionCtrl.formKey,
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.end, children: [
              //  MyForm(),
              CommonTextBox(
                  validator: (number) => Validation().statusValidation(number),
                  hinText: fonts.title,
                  controller: suggestionCtrl.txtTitle),
              const VSpace(Sizes.s20),
              // name textfield

              ...suggestionCtrl.getSuggestions(),
              const VSpace(Sizes.s40),
              CommonButton(
                margin: 0,
                icon: suggestionCtrl.isLoading
                    ? CircularProgressIndicator(
                        color: appCtrl.appTheme.white,
                      )
                    : Container(),
                onTap: () {
                  if (suggestionCtrl.formKey.currentState!.validate()) {
                    suggestionCtrl.formKey.currentState!.save();
                    if (suggestionCtrl.docId != "") {
                      suggestionCtrl.updateSuggestion();
                    } else {
                      suggestionCtrl.addSuggestion();
                    }
                  }
                  suggestionCtrl.update();
                },
                title: suggestionCtrl.docId != ""
                    ? fonts.updateSuggestion.tr
                    : fonts.addSuggestion.tr,
                style: AppCss.outfitMedium16.textColor(appCtrl.appTheme.white),
                width: Sizes.s200,
              )
            ]),
          )
        ],
      ).paddingAll(Insets.i25).boxExtension();
    });
  }
}
