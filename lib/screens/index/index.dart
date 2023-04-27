import '../../config.dart';


class IndexLayout extends StatefulWidget {
  final GlobalKey<ScaffoldState>? scaffoldDrawerKey;
  final GlobalKey<ScaffoldState>? scaffoldKey;

  const IndexLayout({Key? key, this.scaffoldDrawerKey, this.scaffoldKey})
      : super(key: key);

  @override
  State<IndexLayout> createState() => _IndexLayoutState();
}

class _IndexLayoutState extends State<IndexLayout> {
  final indexCtrl = Get.put(IndexController());


  @override
  Widget build(BuildContext context) {
    return GetBuilder<IndexController>(builder: (_) {
      return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
            key: widget.scaffoldKey,
            backgroundColor: appCtrl.appTheme.bg1,
            appBar: AppBar(
                elevation: 0.0,
                shadowColor: Colors.transparent,
                centerTitle: false,
                backgroundColor: appCtrl.appTheme.bg1,
                leadingWidth: Responsive.isDesktop(context) ? Sizes.s392 : Sizes.s100,
                title: !Responsive.isDesktop(context)
                    ? Text(indexCtrl.pageName.tr,style: AppCss.outfitSemiBold16.textColor(appCtrl.appTheme.blackColor),)
                    : Container(),
                leading:  LeadingRow(scaffoldKey: widget.scaffoldKey,scaffoldDrawerKey: widget.scaffoldDrawerKey),
                actions: const [DarkLanguageLayout()]),
            drawerScrimColor: Colors.transparent,
            drawer: const IndexDrawer(),
            body: SafeArea(
                child: Scaffold(


                    key: widget.scaffoldDrawerKey,
                    body: Row(
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ValueListenableBuilder<bool>(
                              valueListenable: indexCtrl.isOpen,
                              builder: (context, value, child) {
                                return Responsive.isDesktop(context)
                                    ? Container(
                                    height:
                                    MediaQuery.of(context).size.height,
                                    width: value ? Sizes.s240 : Sizes.s70,
                                    color: appCtrl.appTheme.secondary,
                                    child: SingleChildScrollView(
                                        controller: ScrollController(),
                                        child: Column(
                                            crossAxisAlignment: value
                                                ? CrossAxisAlignment.start
                                                : CrossAxisAlignment.center,
                                            mainAxisSize: MainAxisSize.min,
                                            mainAxisAlignment:
                                            MainAxisAlignment.start,
                                            children: [
                                              DrawerList(value: value)
                                            ])))
                                    : const SizedBox.shrink();
                              }),
                          const SelectedIndexBodyLayout()
                        ])))),
      );
    });
  }
}
