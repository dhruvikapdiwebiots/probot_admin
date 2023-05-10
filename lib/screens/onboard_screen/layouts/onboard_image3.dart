import 'dart:developer';


import '../../../config.dart';

class OnboardImage3 extends StatelessWidget {
  final StateSetter? setState;
  final String? image;

  const OnboardImage3({Key? key, this.setState, this.image}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<OnboardController>(builder: (onboardCtrl) {
      return  Stack(alignment: Alignment.centerLeft, children: [
        DragDropLayout(
            onCreated: (ctrl) => onboardCtrl.controller3 = ctrl,
            onDrop: (ev) async {
              log('Zone 1 drop: ${ev.name}');
              onboardCtrl.onboardImageName3 = ev.name;
              onboardCtrl.update();
              final bytes = await onboardCtrl.controller3!.getFileData(ev);
              onboardCtrl.getImage(dropImage: bytes, title: "image3");
            }),
        image!.isNotEmpty &&
                image != "" &&
                onboardCtrl.onboardPickImage3 != null &&
                onboardCtrl.onboardWebImage3.isNotEmpty
            ? CommonDottedBorder(
                    child: Image.memory(onboardCtrl.onboardWebImage3, fit: BoxFit.fill,height: Sizes.s150,width: Sizes.s150))
                .inkWell(
                    onTap: () => onboardCtrl.getImage(
                        source: ImageSource.gallery,
                        context: context,
                        title: "image3"))
            : image!.isNotEmpty
                ? CommonDottedBorder(
                    child: Image.network(
                    image!,height: Sizes.s150,width: Sizes.s150
                  )).inkWell(
                    onTap: () => onboardCtrl.getImage(
                        source: ImageSource.gallery,
                        context: context,
                        title: "image3"))
                : onboardCtrl.onboardPickImage3 == null
                    ? const ImagePickUp().inkWell(
                        onTap: () => onboardCtrl.onImagePickUp(
                            setState, context, "image3"))
                    : CommonDottedBorder(
                            child: Image.memory(onboardCtrl.onboardWebImage3,
                                fit: BoxFit.fill,height: Sizes.s150,width: Sizes.s150))
                        .inkWell(
                            onTap: () => onboardCtrl.getImage(
                                source: ImageSource.gallery,
                                context: context,
                                title: "image3"))
      ]).height(onboardCtrl.isOnboardUploadFile3 ? Sizes.s150 : image!.isNotEmpty ?Sizes.s150 : Sizes.s50);
    });
  }
}
