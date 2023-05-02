import '../../../config.dart';

class AddSubscriptionLayout extends StatelessWidget {
  const AddSubscriptionLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StatefulBuilder(
        builder: (BuildContext context, StateSetter setState) {
          return GetBuilder<SubscriptionListController>(builder: (subscriptionCtrl) {
            return Stack(alignment: Alignment.topCenter, children: [
              AlertDialog(
                  contentPadding: EdgeInsets.zero,
                  content: Container(
                      decoration: BoxDecoration(
                          color: appCtrl.appTheme.whiteColor,
                          boxShadow: [
                            BoxShadow(
                                blurRadius: appCtrl.isTheme ?  1 :0,
                                spreadRadius: appCtrl.isTheme ?  1 :0,
                                color: appCtrl.appTheme.blackColor
                            )
                          ]),
                      width: Sizes.s500,
                      child:
                      Stack(alignment: Alignment.topRight, children: <Widget>[
                        Column(mainAxisSize: MainAxisSize.min, children: <Widget>[
                          Container(
                              height: Sizes.s50,
                              width: Sizes.s500,
                              decoration: BoxDecoration(
                                  color: appCtrl.appTheme.whiteColor,
                                  border: Border(
                                      bottom:
                                      BorderSide(color: appCtrl.appTheme.gray.withOpacity(0.3)))),
                              child: Center(
                                  child: Text(fonts.addSubscription.tr,
                                      style: AppCss.outfitSemiBold20
                                          .textColor(appCtrl.appTheme.blackColor)))),
                          Padding(
                              padding: const EdgeInsets.all(20.0),
                              child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    CommonTextBox(

                                        hinText: fonts.title.tr,
                                        controller: subscriptionCtrl.txtTitle),
                                    const VSpace(Sizes.s15),
                                    CommonTextBox(

                                        hinText: fonts.price.tr,
                                        controller: subscriptionCtrl.txtPrice),
                                    const VSpace(Sizes.s15)

                                  ])),

                          const VSpace(Sizes.s25),
                          CommonButton(
                              icon: subscriptionCtrl.isLoading
                                  ? CircularProgressIndicator(
                                  color: appCtrl.appTheme.white)
                                  .paddingSymmetric(vertical: Insets.i10)
                                  : Container(),
                              title: fonts.submit.tr,
                              onTap: () => subscriptionCtrl.updateData(),
                              style: AppCss.outfitRegular14
                                  .textColor(appCtrl.appTheme.white)),
                          const VSpace(Sizes.s15)
                        ]),
                        Positioned(
                            right: 15.0,
                            top: 15.0,
                            child: InkResponse(
                                onTap: () => Navigator.of(context).pop(),
                                child: CircleAvatar(
                                    radius: 12,
                                    backgroundColor: appCtrl.appTheme.primary,
                                    child: Icon(Icons.close,
                                        size: 18, color: appCtrl.appTheme.white))))
                      ]))),
              CustomSnackBar(isAlert: subscriptionCtrl.isAlert)
            ]);
          });
        });
  }
}
