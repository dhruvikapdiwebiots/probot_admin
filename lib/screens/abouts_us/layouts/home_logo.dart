import 'dart:developer';

import '../../../config.dart';

class HomeLogo extends StatelessWidget {
  final StateSetter? setState;
  final String? image;
  const HomeLogo({Key? key, this.setState,this.image}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AboutUsController>(builder: (aboutUsCtrl) {
      log("aboutUsCtrl.pickImage : ${image!.isNotEmpty || aboutUsCtrl.homePickImage != null || aboutUsCtrl.homeWebImage.isNotEmpty}");
      return Stack(alignment: Alignment.centerLeft, children: [
        DragDropLayout(
            onCreated: (ctrl) => aboutUsCtrl.controller2 = ctrl,
            onDrop: (ev) async {
              log('Zone 1 drop: ${ev.name}');
              aboutUsCtrl.homeImageName = ev.name;
              aboutUsCtrl.update();
              final bytes = await aboutUsCtrl.controller2!.getFileData(ev);
              aboutUsCtrl.getImage(dropImage: bytes,
                  title: "homeLogo");
            }),
        image!.isNotEmpty &&
                aboutUsCtrl.homePickImage != null &&
                aboutUsCtrl.homeWebImage.isNotEmpty
            ? CommonDottedBorder(
                    child: Image.memory(aboutUsCtrl.homeWebImage, fit: BoxFit.fill))
                .inkWell(
                    onTap: () => aboutUsCtrl.getImage(
                        source: ImageSource.gallery,
                        context: context,
                        title: "homeLogo"))
            : image!.isNotEmpty
                ? CommonDottedBorder(child: Image.network(image!)).inkWell(
                    onTap: () => aboutUsCtrl.getImage(
                        source: ImageSource.gallery,
                        context: context,
                        title: "homeLogo"))
                : aboutUsCtrl.homePickImage == null
                    ? const ImagePickUp().inkWell(
                        onTap: () => aboutUsCtrl.onImagePickUp(
                            setState, context, "homeLogo"))
                    : CommonDottedBorder(
                            child: Image.memory(aboutUsCtrl.homeWebImage,
                                fit: BoxFit.fill))
                        .inkWell(
                            onTap: () => aboutUsCtrl.getImage(
                                source: ImageSource.gallery,
                                context: context,
                                title: "homeLogo"))
      ]).height(aboutUsCtrl.isHomeUploadFile ? Sizes.s40 : Sizes.s50);
    });
  }
}
