import 'dart:developer';

import '../../../config.dart';

class OnboardImage1 extends StatelessWidget {
  final StateSetter? setState;
  final String? image;

  const OnboardImage1({Key? key, this.setState, this.image}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<OnboardController>(builder: (onboardCtrl) {
      return Stack(alignment: Alignment.centerLeft, children: [
        DragDropLayout(
            onCreated: (ctrl) => onboardCtrl.controller1 = ctrl,
            onDrop: (ev) async {
              log('Zone 1 drop: ${ev.name}');
              onboardCtrl.imageName = ev.name;
              onboardCtrl.update();
              final bytes = await onboardCtrl.controller1!.getFileData(ev);
              onboardCtrl.getImage(dropImage: bytes, title: "image1");
            }),
        image!.isNotEmpty &&
                image != "" &&
                onboardCtrl.pickImage != null &&
                onboardCtrl.webImage.isNotEmpty
            ? CommonDottedBorder(
                    child: Image.memory(onboardCtrl.webImage, fit: BoxFit.fill,height: Sizes.s150,width: Sizes.s150,))
                .inkWell(
                    onTap: () => onboardCtrl.getImage(
                        source: ImageSource.gallery,
                        context: context,
                        title: "image1"))
            : image!.isNotEmpty
                ? CommonDottedBorder(
                    child: Image.network(
                    image!,
                      height: Sizes.s150,width: Sizes.s150,
                  )).inkWell(
                    onTap: () => onboardCtrl.getImage(
                        source: ImageSource.gallery,
                        context: context,
                        title: "image1"))
                : onboardCtrl.pickImage == null
                    ? const ImagePickUp().inkWell(
                        onTap: () => onboardCtrl.onImagePickUp(
                            setState, context, "image1"))
                    : CommonDottedBorder(
                            child: Image.memory(onboardCtrl.webImage,
                                fit: BoxFit.fill,height: Sizes.s150,width: Sizes.s150))
                        .inkWell(
                            onTap: () => onboardCtrl.getImage(
                                source: ImageSource.gallery,
                                context: context,
                                title: "image1"))
      ]).height(onboardCtrl.isUploadSize ? Sizes.s150  : image!.isNotEmpty ?Sizes.s150 : Sizes.s50);
    });
  }
}
