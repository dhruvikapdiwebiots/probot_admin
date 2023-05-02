
import 'package:probot_admin/config.dart';
import 'package:probot_admin/screens/category_suggestion/layouts/add_text_form_field.dart';


class CategorySuggestionController extends GetxController {

   List<String> suggestionList = [];
   final formKey = GlobalKey<FormState>();
   TextEditingController suggestionController= TextEditingController();
   TextEditingController? suggestionDynamicController;
   TextEditingController txtTitle = TextEditingController();

   @override
   void dispose() {
      suggestionController.dispose();
      suggestionDynamicController!.dispose();
      super.dispose();
   }

   /// get suggestion text-fields
   List<Widget> getSuggestions(){
      List<Widget> friendsTextFields = [];
      for(int i=0; i<suggestionList.length; i++){
         friendsTextFields.add(
             Padding(
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                child: Row(
                   children: [
                      Expanded(child: AddTextFormField(index: i,)),
                      const HSpace( 32.0),

                      addRemoveButton(i == suggestionList.length-1, i),
                   ],
                ),
             )
         );
      }
      return friendsTextFields;
   }

   /// add / remove button
   Widget addRemoveButton(bool add, int index,){
      return InkWell(
         onTap: (){
            if(add){
               // add new text-fields at the top of all friends textfields
               suggestionList.insert(0, "");
            }
            else {
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
            child: Icon((add) ? Icons.add : Icons.remove, color: Colors.white,),
         ),
      );
   }

}
