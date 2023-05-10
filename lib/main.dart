
import 'dart:ui';
import 'package:flutter/services.dart';
import 'common/language/index.dart';
import 'config.dart';
import 'package:universal_html/html.dart' as html;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // We're using the manual installation on non-web platforms since Google sign in plugin doesn't yet support Dart initialization.
  // See related issue: https://github.com/flutter/flutter/issues/96391
  GetStorage.init();
  Get.put(AppController());
  await Firebase.initializeApp(
    options: const FirebaseOptions(
        apiKey: "AIzaSyDhyfqt1rwCcYDYaHcEjnsxfVmY67F2b4s",
        authDomain: "probot-38408.firebaseapp.com",
        projectId: "probot-38408",
        storageBucket: "probot-38408.appspot.com",
        messagingSenderId: "3921683177",
        appId: "1:3921683177:web:521774f60223d9fde90678"),
  );

  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  var scaffoldDrawerKey = GlobalKey<ScaffoldState>(debugLabel: "drawer");
  var scaffoldKey = GlobalKey<ScaffoldState>(debugLabel: "key2");

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    appCtrl.isLogin = html.window.localStorage[session.isLogin] ?? "false";
    SystemChrome.setApplicationSwitcherDescription(
        ApplicationSwitcherDescription(
      label: fonts.appName.tr,
      primaryColor: Theme.of(context).primaryColor.value,
    ));
    return GetMaterialApp(
      builder: (context, widget) {
        return Title(
            title: fonts.appName.tr,
            color: appCtrl.appTheme.blackColor,
            child: StreamBuilder<User?>(
                stream: FirebaseAuth.instance.authStateChanges(),
                builder: (BuildContext context, AsyncSnapshot<User?> snapshot) {
                  return !snapshot.hasData
                      ? MediaQuery(
                          data: MediaQuery.of(context)
                              .copyWith(textScaleFactor: 1.0),
                          child: widget!)
                      : LoginScreen();
                }));
      },
      debugShowCheckedModeBanner: false,
      translations: Language(),
      locale: const Locale('en', 'US'),
      fallbackLocale: const Locale('en', 'US'),
      // tran
      title: fonts.appName.tr,
      home: appCtrl.isLogged == true
          ? Title(
              title: fonts.appName.tr,
              color: appCtrl.appTheme.blackColor,
              child: IndexLayout(
                  scaffoldDrawerKey: scaffoldDrawerKey,
                  scaffoldKey: scaffoldKey))
          : LoginScreen(),
      getPages: appRoute.getPages,
      theme: AppTheme.fromType(ThemeType.light).themeData,
      darkTheme: AppTheme.fromType(ThemeType.dark).themeData,
      themeMode: ThemeService().theme,
      scrollBehavior: MyCustomScrollBehavior(),
    );
  }
}

class MyCustomScrollBehavior extends MaterialScrollBehavior {
  // Override behavior methods and getters like dragDevices
  @override
  Set<PointerDeviceKind> get dragDevices => {
        PointerDeviceKind.touch,
        PointerDeviceKind.mouse,
      };
}
