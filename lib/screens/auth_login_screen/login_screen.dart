
import '../../config.dart';

class LoginScreen extends StatelessWidget {
  final loginCtrl = Get.put(LoginController());

  LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<LoginController>(builder: (_) {
      return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Builder(builder: (context) {
          return Scaffold(
              backgroundColor: appCtrl.appTheme.whiteColor,
              body: SingleChildScrollView(
                child: SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: Row(
                    children: [
                      if (Responsive.isDesktop(context))
                        const LoginLeftDesktopView(),
                      Expanded(
                        child: GlassMorphicLayout(
                            linearGradient: loginLinearGradient(),
                            child: SingleChildScrollView(
                              child: Column(children: const [
                                DarkLanguageLayout(),
                                VSpace(Sizes.s80),
                                LoginLayout(),
                                VSpace(Sizes.s30),
                              ]),
                            )),
                      )
                    ],
                  ),
                ),
              ));
        }),
      );
    });
  }
}
