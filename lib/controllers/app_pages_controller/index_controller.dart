import 'package:probot_admin/config.dart';
import 'package:probot_admin/screens/abouts_us/abouts_us.dart';
import 'package:probot_admin/screens/category/category.dart';
import 'package:probot_admin/screens/category_suggestion/category_suggestion.dart';
import 'package:probot_admin/screens/category_suggestion_list/category_suggestion_list.dart';
import 'package:probot_admin/screens/characters/characters.dart';
import 'package:probot_admin/screens/onboard_screen/onboard_screen.dart';
import 'package:probot_admin/screens/subscription_list/subscription_list.dart';
import 'package:probot_admin/screens/top_up_users/top_up_users.dart';

import 'package:probot_admin/screens/user_subscribe_list/user_subscribe_list.dart';

import '../../screens/general_setting/general_setting.dart';

class IndexController extends GetxController {
  ValueNotifier<bool> isOpen = ValueNotifier(true);
  GlobalKey<ScaffoldState>? scaffoldDrawerKey;
  GlobalKey<ScaffoldState>? scaffoldKey;
  int selectedIndex = 0;
  String pageName = fonts.dashboard.tr;
  bool isHover = false;
  int isSelectedHover = 0;

  final ScrollController scrollController = ScrollController();

  //list of bottommost page
  List<Widget> widgetOptions = <Widget>[
    Dashboard(),
    UsersList(),
    UserSubscribeList(),
    TopUpUserList(),
    SubscriptionList(),
    CharacterLayout(),
    Category(),
    CategorySuggestion(),
    CategorySuggestionList(),
    OnboardScreen(),
    GeneralSetting(),
    AboutsUs(),
 const   Text("LOGOUT")
  ];

  @override
  void onReady() {
    // TODO: implement onReady
    appCtrl.getStorageData();
    super.onReady();
  }
}
