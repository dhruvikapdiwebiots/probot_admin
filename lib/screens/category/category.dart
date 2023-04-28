

import 'package:probot_admin/models/category_access_model.dart';
import 'package:probot_admin/screens/category/layouts/category_access.dart';
import 'package:probot_admin/screens/category/layouts/category_access_mobile.dart';

import '../../config.dart';

class Category extends StatelessWidget {
  const Category({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        StreamBuilder(
          stream: FirebaseFirestore.instance.collection(collectionName.categoryAccess).snapshots(),
          builder: (context,snapShot) {
            if(snapShot.hasData) {
              CategoryAccessModel categoryAccessModel = CategoryAccessModel.fromJson(snapShot.data!.docs[0].data());
              return SizedBox(
                  child: Column(
                      mainAxisAlignment:
                      MainAxisAlignment.spaceBetween,
                      children: [
                        Responsive.isMobile(context) ||
                            Responsive.isTablet(context)
                        // Mobile view
                            ? CategoryAccessMobile(configModel: categoryAccessModel,)
                        // Desktop view
                            : CategoryAccessDesktop(configModel: categoryAccessModel),
                      ]));
            }else{
              return Container();
            }
          }
        ),
      ],
    ).paddingAll(Insets.i25).boxExtension();
  }
}
