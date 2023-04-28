import 'package:probot_admin/config.dart';
import 'package:probot_admin/screens/abouts_us/abouts_us.dart';
import 'package:probot_admin/screens/category/category.dart';
import 'package:probot_admin/screens/characters/characters.dart';
import 'package:probot_admin/screens/onboard_screen/onboard_screen.dart';

import 'package:probot_admin/screens/user_subscribe_list/user__subscribe_list.dart';

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
    SubscriptionList(),
    CharacterLayout(),
     Category(),
    OnboardScreen(),
    GeneralSetting(),
    AboutsUs(),
    Text("LOGOUT")
  ];

  @override
  void onReady() {
    // TODO: implement onReady
    appCtrl.getStorageData();
    super.onReady();
  }

}