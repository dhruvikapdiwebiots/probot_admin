import '../config.dart';

class AppArray {
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
    {
      'icon': svgAssets.dashboard,
      'title': "dashboard",
      "darkIcon": svgAssets.dashboardDark
    },
    {
      'icon': svgAssets.people,
      'title': "users",
      "darkIcon": svgAssets.peopleDark
    },
    {
      'icon': svgAssets.userSubscribe,
      'title': "subscribeUser",
      "darkIcon": svgAssets.userSubscribeDark
    },
    {
      'icon': svgAssets.userSubscribe,
      'title': "topUpUsers",
      "darkIcon": svgAssets.userSubscribeDark
    },
    {
      'icon': svgAssets.crown,
      'title': "subscription",
      "darkIcon": svgAssets.crownDark
    },
    {
      'icon': svgAssets.android,
      'title': "character",
      "darkIcon": svgAssets.androidDark
    },
    {
      'icon': svgAssets.category,
      'title': "category",
      "darkIcon": svgAssets.categoryDark
    },
    {
      'icon': svgAssets.category,
      'title': "categorySuggestion",
      "darkIcon": svgAssets.categoryDark
    },
    {
      'icon': svgAssets.suggestion,
      'title': "suggestionList",
      "darkIcon": svgAssets.suggestionDark
    },
    {
      'icon': svgAssets.onBoard,
      'title': "onBoardScreen",
      "darkIcon": svgAssets.onBoardDark
    },
    {
      'icon': svgAssets.setting,
      'title': "generalSetting",
      "darkIcon": svgAssets.settingDark
    },
    {
      'icon': svgAssets.aboutUs,
      'title': "aboutsUs",
      "darkIcon": svgAssets.aboutUsDark
    },
    {'icon': svgAssets.logout, 'title': "logout", "darkIcon": svgAssets.logout},
  ];

// Languages list
  var languagesList = [
    {"title": "english", 'locale': const Locale('en', 'US'), "code": "en"},
    {"title": "hindi", 'locale': const Locale('hi', 'IN'), "code": "hi"},
    {"title": "french", 'locale': const Locale('fr', 'CA'), "code": "fr"},
    {"title": "italian", 'locale': const Locale('it', 'IT'), "code": "it"},
    {"title": "german", 'locale': const Locale('ge', 'GE'), "code": "ge"},
    {"title": "japanese", 'locale': const Locale('ja', 'JP'), "code": "ja"},
  ];
}
