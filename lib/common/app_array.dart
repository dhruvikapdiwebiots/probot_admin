
import '../config.dart';

class AppArray{
  //language list
  var languageList = [
    {'name': 'english', 'locale': const Locale('en', 'US')},
    {'name': 'arabic', 'locale': const Locale('ar', 'AE')},
    {'name': 'hindi', 'locale': const Locale('hi', 'IN')},
    {'name': 'korean', 'locale': const Locale('ko', 'KR')}
  ];

  //action list
  var actionList = [
    {'title': "english"},
    {'title': "hindi"},
    {'title': "korean"},
    {'title': "arabic"},
  ];

  //Drawer list
  var drawerList = [
    {'icon': svgAssets.dashboard, 'title': "dashboard"},
    {'icon': svgAssets.people, 'title': "users"},
    {'icon': svgAssets.userSubscribe, 'title': "subscribeUser"},
    {'icon': svgAssets.crown, 'title': "subscription"},
    {'icon': svgAssets.android, 'title': "character"},
    {'icon': svgAssets.category, 'title': "category"},
    {'icon': svgAssets.onBoard, 'title': "onBoardScreen"},
    {'icon': svgAssets.setting, 'title': "generalSetting"},
    {'icon': svgAssets.aboutUs, 'title': "aboutsUs"},
    {'icon': svgAssets.logout, 'title': "logout"},
  ];


// Languages list
  var languagesList = [
    {
      "title": "english",
      'locale': const Locale('en', 'US'),
      "code": "en"
    },
    {

      "title": "hindi",
      'locale': const Locale('hi', 'IN'),
      "code": "hi"
    },
    {
      "title": "french",
      'locale': const Locale('fr', 'CA'),
      "code": "fr"
    },
    {
      "title": "italian",
      'locale': const Locale('it', 'IT'),
      "code": "it"
    },
    {
      "title": "german",
      'locale': const Locale('ge', 'GE'),
      "code": "ge"
    },
    {

      "title": "japanese",
      'locale': const Locale('ja', 'JP'),
      "code": "ja"
    },
  ];

}