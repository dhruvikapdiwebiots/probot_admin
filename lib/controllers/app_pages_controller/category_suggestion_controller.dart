import 'dart:developer';

import 'package:probot_admin/config.dart';
import 'package:probot_admin/screens/category_suggestion/layouts/add_text_form_field.dart';

class CategorySuggestionController extends GetxController {
  List<String> suggestionList = [];
  final formKey = GlobalKey<FormState>();
  TextEditingController suggestionController = TextEditingController();
  TextEditingController? suggestionDynamicController;
  String docId = "";
  bool isLoading = false;
  TextEditingController txtTitle = TextEditingController();

  @override
  void dispose() {
    suggestionController.dispose();
    suggestionDynamicController!.dispose();
    super.dispose();
  }

  /// get suggestion text-fields
  List<Widget> getSuggestions() {
    List<Widget> friendsTextFields = [];
    for (int i = 0; i < suggestionList.length; i++) {
      friendsTextFields.add(Padding(
        padding: const EdgeInsets.symmetric(vertical: 16.0),
        child: Row(
          children: [
            Expanded(
                child: AddTextFormField(
              index: i,
            )),
            const HSpace(32.0),
            addRemoveButton(
                i == suggestionList.length - 1, i, suggestionList[i]),
          ],
        ),
      ));
    }
    return friendsTextFields;
  }

  /// add / remove button
  Widget addRemoveButton(bool add, int index, String text) {
    return InkWell(
      onTap: () {
        log("INDE : $index");
        log("add : $add");
        if (add) {
          // add new text-fields at the top of all friends textfields
          suggestionList.insert(0, text);
        } else {
          suggestionList.removeAt(index);
        }
        update();
      },
      child: Container(
        width: 30,
        alignment: Alignment.center,
        height: 30,
        decoration: BoxDecoration(
          color: (add) ? Colors.green : Colors.red,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Icon(
          (add) ? Icons.add : Icons.remove,
          color: Colors.white,
        ),
      ),
    );
  }

  //add suggestion
  addSuggestion() async {
    isLoading = true;
    update();
    await FirebaseFirestore.instance
        .collection(collectionName.categorySuggestion)
        .add({
      "title": txtTitle.text,
      "suggestionList": suggestionList,
      "isActive": true
    }).then((value) {
      suggestionList = [];
      txtTitle.text = "";

      suggestionList.insert(0, "");
      isLoading = false;
      update();
    });
  }

  //update suggestion
  updateSuggestion() async {
    await FirebaseFirestore.instance
        .collection(collectionName.categorySuggestion)
        .doc(docId)
        .update({
      "title": txtTitle.text,
      "suggestionList": suggestionList,
      "isActive": true
    });
  }

  //active status change
  isActiveChange(id, value) async {
    await FirebaseFirestore.instance
        .collection(collectionName.categorySuggestion)
        .doc(id)
        .update({"isActive": value});
  }

  getData(id) async {
    if (id != 0) {
      suggestionList = [];
      txtTitle.text = "";
      docId = id.toString();
      FirebaseFirestore.instance
          .collection(collectionName.categorySuggestion)
          .doc(id)
          .get()
          .then((value) {
        if (value.exists) {
          txtTitle.text = value.data()!["title"];
          List suggestList = value.data()!["suggestionList"];
          suggestList.asMap().entries.forEach((element) {
            suggestionList.insert(0, element.value);
          });
          update();
        } else {
          suggestionList.insert(0, "");
          update();
        }
      });
    } else {
      docId = "";
      suggestionList = [];
      txtTitle.text = "";

      suggestionList.insert(0, "");

      update();
    }
  }

  @override
  void onReady() {
    // TODO: implement onReady

    getData(0);
    super.onReady();
  }
}
