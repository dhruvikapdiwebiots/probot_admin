import 'dart:developer' as log;
import 'dart:math';

import 'package:probot_admin/config.dart';
import 'package:probot_admin/screens/category_suggestion/layouts/add_text_form_field.dart';

class CategorySuggestionController extends GetxController {
  List<String> suggestionList = [];
  final formKey = GlobalKey<FormState>();
  TextEditingController suggestionController = TextEditingController();
  TextEditingController txtSearch = TextEditingController();
  TextEditingController? suggestionDynamicController;
  String docId = "";
  bool isLoading = false, isSearch = false;
  TextEditingController txtTitle = TextEditingController();

  final List<int> perPages = [10, 20, 50, 100];
  int total = 100;
  int? currentPerPage = 10;
  List<bool>? expanded;
  String? searchKey = "title";
  XFile? imageFile;
  int currentPage = 1;
  final List<Map<String, dynamic>> sourceOriginal = [];
  List<Map<String, dynamic>> sourceFiltered = [];
  List<Map<String, dynamic>> source = [];
  int lastVisible = 0;

  // ignore: unused_field
  final String selectableKey = "id";
  String lastIndexId = "";

  String? sortColumn;

  bool sortAscending = true;
  final bool showSelect = true;

  var random = Random();

  //reset data
  resetData({start = 0}) async {
    isLoading = true;
    update();
    var expandedLen =
        total - start < currentPerPage! ? total - start : currentPerPage;
    Future.delayed(const Duration(seconds: 0)).then((value) {
      expanded = List.generate(expandedLen as int, (index) => false);
      source.clear();
      source = sourceFiltered.getRange(start, start + expandedLen).toList();
      isLoading = false;
      update();
    });
  }

  Stream getChatsFromRefs() {
    Stream<QuerySnapshot<Map<String, dynamic>>> event = FirebaseFirestore
        .instance
        .collection(collectionName.categorySuggestion)
        .where("title", isGreaterThanOrEqualTo: txtSearch.text)
        .limit(currentPerPage!)
        .snapshots();
    log.log("event : $event");
    return event;
  }

  //filter data
  filterData(value) {
    isLoading = true;
    update();
    getChatsFromRefs();
    try {
      if (value == "" || value == null) {
        sourceFiltered = sourceOriginal;
      } else {
        sourceFiltered = sourceOriginal
            .where((data) => data[searchKey!]
                .toString()
                .toLowerCase()
                .contains(value.toString().toLowerCase()))
            .toList();
      }

      total = sourceFiltered.length;
      var rangeTop = total < currentPerPage! ? total : currentPerPage!;
      expanded = List.generate(rangeTop, (index) => false);
      source = sourceFiltered.getRange(0, rangeTop).toList();
    } catch (e) {
      log.log("filter error : $e");
    }
    isLoading = false;
    update();
  }

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
        if (add) {
          // add new text-fields at the top of all friends textfields
          suggestionList.insert(0, "");
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
    bool isLoginTest = appCtrl.storage.read(session.isLoginTest);
    if (isLoginTest) {
      accessDenied(fonts.modification.tr);
    } else {
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
  }

  //update suggestion
  updateSuggestion() async {
    bool isLoginTest =
    appCtrl.storage.read(session.isLoginTest);
    if (isLoginTest) {
      accessDenied(fonts.modification.tr);
    } else {
      await FirebaseFirestore.instance
          .collection(collectionName.categorySuggestion)
          .doc(docId)
          .update({
        "title": txtTitle.text,
        "suggestionList": suggestionList,
        "isActive": true
      });
    }
  }

  //active status change
  isActiveChange(id, value) async {
    bool isLoginTest =
    appCtrl.storage.read(session.isLoginTest);
    if (isLoginTest) {
      accessDenied(fonts.modification.tr);
    } else {
      await FirebaseFirestore.instance
          .collection(collectionName.categorySuggestion)
          .doc(id)
          .update({"isActive": value});
    }
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
