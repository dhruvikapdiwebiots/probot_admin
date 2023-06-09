import 'dart:developer';

import '../../../config.dart';

class AboutUsLogo extends StatelessWidget {
  final StateSetter? setState;
  final String? image;

  const AboutUsLogo({Key? key, this.setState, this.image}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AboutUsController>(builder: (aboutUsCtrl) {
      log("aboutUsCtrl.pickImage : ${image!.isNotEmpty &&
          aboutUsCtrl.pickImage != null &&
          aboutUsCtrl.webImage.isNotEmpty}");
      return Stack(alignment: Alignment.centerLeft, children: [
        DragDropLayout(
            onCreated: (ctrl) => aboutUsCtrl.controller1 = ctrl,
            onDrop: (ev) async {
              log('Zone 1 drop: ${ev.name}');
              aboutUsCtrl.imageName = ev.name;
              aboutUsCtrl.update();
              final bytes = await aboutUsCtrl.controller1!.getFileData(ev);
              aboutUsCtrl.getImage(dropImage: bytes, title: "splashLogo");
            }),
        image!.isNotEmpty &&
                aboutUsCtrl.pickImage != null &&
                aboutUsCtrl.webImage.isNotEmpty
            ? CommonDottedBorder(
                    child: Image.memory(aboutUsCtrl.webImage, fit: BoxFit.fill))
                .inkWell(
                    onTap: () => aboutUsCtrl.getImage(
                        source: ImageSource.gallery,
                        context: context,
                        title: "splashLogo"))
            : image!.isNotEmpty
                ? CommonDottedBorder(child: Image.network(image!,)).inkWell(
                    onTap: () => aboutUsCtrl.getImage(
                        source: ImageSource.gallery,
                        context: context,
                        title: "splashLogo"))
                : aboutUsCtrl.pickImage == null
                    ? const ImagePickUp().inkWell(
                        onTap: () => aboutUsCtrl.onImagePickUp(
                            setState, context, "splashLogo"))
                    : CommonDottedBorder(
                            child: Image.memory(aboutUsCtrl.webImage,
                                fit: BoxFit.fill))
                        .inkWell(
                            onTap: () => aboutUsCtrl.getImage(
                                source: ImageSource.gallery,
                                context: context,
                                title: "splashLogo"))
      ]).height(aboutUsCtrl.isUploadSize ? Sizes.s40 : Sizes.s50);
    });
  }
}
