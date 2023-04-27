import 'dart:developer';
import 'dart:math' as math;
import 'package:flutter/foundation.dart';
import 'package:probot_admin/config.dart';
import 'package:probot_admin/screens/characters/layouts/add_character.dart';
import 'dart:io' as io;

class AboutUsController extends GetxController {
  dynamic usageCtrl;
  bool isLoading = false;
  bool isAlert = false;
  String id = "";
  TextEditingController txtPrivacyPolicyLink = TextEditingController();
  TextEditingController txtRateAppAndroidId = TextEditingController();
  TextEditingController txtRateAppIOSId = TextEditingController();
  TextEditingController txtRefundLink = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  XFile? imageFile, homeFile, drawerFile;
  bool isUploadSize = false,
      isHomeUploadFile = false,
      isDrawerUploadFile = false;
  late DropzoneViewController? controller1, controller2, controller3;

  Uint8List uploadWebImage = Uint8List(8);
  Uint8List homeUploadWebImage = Uint8List(8);
  Uint8List drawerUploadWebImage = Uint8List(8);
  io.File? pickImage, homePickImage, drawerPickImage;
  var random = math.Random();

  String imageName = "",
      imageUrl = "",
      homeImageName = "",
      drawerImageName = "";
  Uint8List webImage = Uint8List(8);
  Uint8List homeWebImage = Uint8List(8);
  Uint8List drawerWebImage = Uint8List(8);

  //get data from firebase
  getData() async {
    await FirebaseFirestore.instance
        .collection(collectionName.config)
        .get()
        .then((value) {
      if (value.docs.isNotEmpty) {
        log("VALUE : ${value.docs.length}");
        id = value.docs[0].id;
        usageCtrl = value.docs[0].data();
        txtPrivacyPolicyLink.text = usageCtrl["privacyPolicyLink"];
        txtRateAppAndroidId.text = usageCtrl["rateAppAndroidId"];
        txtRateAppIOSId.text = usageCtrl["rateAppIOSId"];
        txtRefundLink.text = usageCtrl["refundLink"];
        imageUrl = usageCtrl["splashLogo"] ?? "";
      }
    });
    update();
  }

  updateData() {
    FirebaseFirestore.instance
        .collection(collectionName.config)
        .get()
        .then((value) async {
      if (value.docs.isNotEmpty) {
        await FirebaseFirestore.instance.collection("config").doc(id).update({
          "privacyPolicyLink": txtPrivacyPolicyLink.text,
          "rateAppAndroidId": txtRateAppAndroidId.text,
          "rateAppIOSId": txtRateAppIOSId.text,
          "refundLink": txtRefundLink.text,
        });
        update();
      }
    });
  }

  //on click Image
  onImagePickUp(setState, context, title) {
    if (kIsWeb) {
      getImage(source: ImageSource.gallery, context: context, title: title);
    } else {
      imagePickerOption(
          setState: setState,
          cameraTap: () {
            getImage(
                source: ImageSource.camera,
                setState: setState,
                context: context,
                title: title);
            Get.back();
          },
          galleryTap: () {
            getImage(
                source: ImageSource.gallery,
                setState: setState,
                context: context,
                title: title);
            Get.back();
          });
    }
  }

// GET IMAGE FROM GALLERY
  Future getImage(
      {source,
      StateSetter? setState,
      dropImage,
      context,
      uploadFile,
      title}) async {
    if (title == "splashLogo") {
      splashLogoUpload(
          setState: setState,
          source: source,
          dropImage: dropImage,
          title: title,
          context: context,
          uploadFile: uploadFile);
    } else if (title == "homeLogo") {
      homeLogoUpload(
          setState: setState,
          source: source,
          dropImage: dropImage,
          title: title,
          context: context,
          uploadFile: uploadFile);
    } else {
      drawerLogoUpload(
          setState: setState,
          source: source,
          dropImage: dropImage,
          title: title,
          context: context,
          uploadFile: uploadFile);
    }
  }

  splashLogoUpload(
      {source,
      StateSetter? setState,
      dropImage,
      context,
      uploadFile,
      title}) async {
    if (dropImage != null) {
      if (imageName.contains("png") ||
          imageName.contains("jpg") ||
          imageName.contains("jpeg")) {
        var image = dropImage;
        uploadWebImage = image;
        log("uploadWebImage : $uploadWebImage");
        webImage = uploadWebImage;
        pickImage = io.File("a");
        log("SPLASH LOGO :");
        isUploadSize = true;
        uploadLogoFile(title);

        isAlert = false;
        update();
      } else {
        isAlert = true;
        update();
        await Future.delayed(Durations.s2);
        isAlert = false;
        update();
      }
    } else {
      final ImagePicker picker = ImagePicker();
      imageFile = (await picker.pickImage(source: ImageSource.gallery))!;
      log("imageFile : $imageFile");

      if (imageFile!.name.contains("png") ||
          imageFile!.name.contains("jpg") ||
          imageFile!.name.contains("jpeg")) {
        var image = await imageFile!.readAsBytes();
        uploadWebImage = image;

        Image image1 = Image.memory(uploadWebImage);
        log("image1 : $image1");
        isUploadSize = true;
        webImage = uploadWebImage;
        pickImage = io.File(imageFile!.path);
        uploadLogoFile(title);
        isAlert = false;
        update();
      } else {
        isAlert = true;
        update();
        await Future.delayed(Durations.s2);
        isAlert = false;
        update();
      }
    }
  }

  homeLogoUpload(
      {source,
      StateSetter? setState,
      dropImage,
      context,
      uploadFile,
      title}) async {
    if (dropImage != null) {
      if (homeImageName.contains("png") ||
          homeImageName.contains("jpg") ||
          homeImageName.contains("jpeg")) {
        var image = dropImage;
        homeUploadWebImage = image;

        Image image1 = Image.memory(homeUploadWebImage);

        ImageInfo info = await getImageInfo(image1);

        if (info.image.width > 300 && info.image.height > 50) {
          homeWebImage = homeUploadWebImage;
          homePickImage = io.File("a");
          isHomeUploadFile = false;
        } else {
          isHomeUploadFile = true;
          uploadLogoFile(title);
        }

        isAlert = false;
        update();
      } else {
        isAlert = true;
        update();
        await Future.delayed(Durations.s2);
        isAlert = false;
        update();
      }
    } else {
      final ImagePicker picker = ImagePicker();
      homeFile = (await picker.pickImage(source: ImageSource.gallery))!;
      log("imageFile : $homeFile");

      if (homeFile!.name.contains("png") ||
          homeFile!.name.contains("jpg") ||
          homeFile!.name.contains("jpeg")) {
        var image = await homeFile!.readAsBytes();
        homeUploadWebImage = image;

        Image image1 = Image.memory(homeUploadWebImage);
        log("image1 : $image1");
        ImageInfo info = await getImageInfo(image1);

        if (info.image.width > 300 && info.image.height > 50) {
          homeWebImage = homeUploadWebImage;
          homePickImage = io.File(homeFile!.path);
          isHomeUploadFile = false;
        } else {
          isHomeUploadFile = true;

          uploadLogoFile(title);
        }
        isAlert = false;
        update();
      } else {
        isAlert = true;
        update();
        await Future.delayed(Durations.s2);
        isAlert = false;
        update();
      }
    }
  }

  drawerLogoUpload(
      {source,
      StateSetter? setState,
      dropImage,
      context,
      uploadFile,
      title}) async {
    if (dropImage != null) {
      if (drawerImageName.contains("png") ||
          drawerImageName.contains("jpg") ||
          drawerImageName.contains("jpeg")) {
        var image = dropImage;
        drawerUploadWebImage = image;

        Image image1 = Image.memory(drawerUploadWebImage);

        ImageInfo info = await getImageInfo(image1);

        if (info.image.width > 300 && info.image.height > 50) {
          drawerWebImage = drawerUploadWebImage;
          drawerPickImage = io.File("a");
          isDrawerUploadFile = false;
        } else {
          isDrawerUploadFile = true;
          uploadLogoFile(title);
        }

        isAlert = false;
        update();
      } else {
        isAlert = true;
        update();
        await Future.delayed(Durations.s2);
        isAlert = false;
        update();
      }
    } else {
      final ImagePicker picker = ImagePicker();
      drawerFile = (await picker.pickImage(source: ImageSource.gallery))!;
      log("imageFile : $drawerFile");

      if (drawerFile!.name.contains("png") ||
          drawerFile!.name.contains("jpg") ||
          drawerFile!.name.contains("jpeg")) {
        var image = await drawerFile!.readAsBytes();
        drawerUploadWebImage = image;

        Image image1 = Image.memory(drawerUploadWebImage);
        log("image1 : $image1");
        ImageInfo info = await getImageInfo(image1);

        if (info.image.width > 300 && info.image.height > 50) {
          drawerWebImage = drawerUploadWebImage;
          drawerPickImage = io.File(drawerFile!.path);
          isDrawerUploadFile = false;
        } else {
          isDrawerUploadFile = true;

          uploadLogoFile(title);
        }
        isAlert = false;
        update();
      } else {
        isAlert = true;
        update();
        await Future.delayed(Durations.s2);
        isAlert = false;
        update();
      }
    }
  }

// UPLOAD SELECTED IMAGE TO FIREBASE
  Future uploadLogoFile(title) async {
    bool isLoginTest = appCtrl.storage.read(session.isLoginTest);
    if (isLoginTest) {
      accessDenied(fonts.modification.tr);
    } else {
      isLoading = true;
      if (pickImage != null ||
          homePickImage != null ||
          drawerPickImage != null) {
        update();
        String fileName = DateTime.now().millisecondsSinceEpoch.toString();
        Reference reference = FirebaseStorage.instance.ref().child(fileName);

        UploadTask? uploadTask;
        uploadTask = reference.putData(title == "splashLogo"
            ? webImage
            : title == "homeLogo"
                ? homeWebImage
                : drawerWebImage);

        uploadTask.then((res) async {
          log("res : $res");
          res.ref.getDownloadURL().then((downloadUrl) async {
            imageUrl = downloadUrl;
            log("imageUrl : $imageUrl");
            update();
            await Future.delayed(Durations.s3);
            uploadImage(title, imageUrl);
          }, onError: (err) {
            update();
          });
        });
      }
    }
  }

  uploadImage(title, url) async {
    FirebaseFirestore.instance
        .collection(collectionName.config)
        .get()
        .then((value) async {
      if (value.docs.isNotEmpty) {
        await FirebaseFirestore.instance
            .collection("config")
            .doc(id)
            .update({title: url});
        update();
      }
    });
  }

  @override
  void onReady() {
    getData();

    // TODO: implement onReady
    super.onReady();
  }
}
