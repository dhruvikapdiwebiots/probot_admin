import 'dart:developer';
import 'dart:math' as math;
import 'package:flutter/foundation.dart';
import 'package:probot_admin/config.dart';
import 'package:probot_admin/models/select_language_model.dart';
import 'package:probot_admin/screens/characters/layouts/add_character.dart';
import 'dart:io' as io;

import 'package:probot_admin/screens/onboard_screen/layouts/add_onboard.dart';

class OnboardController extends GetxController {
  dynamic usageCtrl;
  bool isLoading = false;
  bool isAlert = false;
  String id = "",
      languageVal = "en";
  int selectIndex = 0;
  List languages = [];
  List<Widget> controllers = [];
  String langValue = fonts.english;
  TextEditingController txtEngTitle = TextEditingController();
  TextEditingController txtEngDesc = TextEditingController();
  TextEditingController txtHiTitle = TextEditingController();
  TextEditingController txtHiDesc = TextEditingController();
  TextEditingController txtFrTitle = TextEditingController();
  TextEditingController txtFrDesc = TextEditingController();
  TextEditingController txtITTitle = TextEditingController();
  TextEditingController txtITDesc = TextEditingController();
  TextEditingController txtGrTitle = TextEditingController();
  TextEditingController txtGrDesc = TextEditingController();
  TextEditingController txtJpTitle = TextEditingController();
  TextEditingController txtJpDesc = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  List<SelectLanguageModel> selectLanguageLists = [];
  XFile? onboard1File, onboard2File, onboard3File;
  bool isUploadSize = false,
      isOnboardUploadFile2 = false,
      isOnboardUploadFile3 = false;
  late DropzoneViewController? controller1, controller2, controller3;

  Uint8List onboardWebImage1 = Uint8List(8);
  Uint8List onboardUploadWebImage2 = Uint8List(8);
  Uint8List onboard3UploadWebImage3 = Uint8List(8);
  io.File? pickImage, onboardPickImage2, onboardPickImage3;
  var random = math.Random();

  String imageName = "",
      imageUrl = "",
      imageUrl2 = "",
      imageUrl3 = "",
      onboardImageUrl2 = "",
      onboardImageUrl3 = "",
      onboardImageName2 = "",
      onboardImageName3 = "";
  Uint8List webImage = Uint8List(8);
  Uint8List onboardWebImage2 = Uint8List(8);
  Uint8List onboardWebImage3 = Uint8List(8);

  //get data from firebase
  getData() async {
    selectLanguageLists = appArray.languagesList
        .map((e) => SelectLanguageModel.fromJson(e))
        .toList();

    await FirebaseFirestore.instance.collection(collectionName.onBoardScreen).get().then((value) {
      if(value.docs.isNotEmpty){
        id= value.docs[0].id;
        languages = value.docs[0].data()["languages"];
        List images =value.docs[0].data()["images"];
        imageUrl = images[0];
        imageUrl2 = images[1];
        imageUrl3 = images[2];
        languages.asMap().entries.forEach((element) {
          if(element.value["language"] == "en"){
            txtEngTitle.text = element.value["title"];
            txtEngDesc.text = element.value["description"];
          }else  if(element.value["language"] == "hi"){
            txtHiTitle.text = element.value["title"];
            txtHiDesc.text = element.value["description"];
          }else  if(element.value["language"] == "fr"){
            txtFrTitle.text = element.value["title"];
            txtFrDesc.text = element.value["description"];
          }else  if(element.value["language"] == "it"){
            txtITTitle.text = element.value["title"];
            txtITDesc.text = element.value["description"];
          }else  if(element.value["language"] == "ge"){
            txtGrTitle.text = element.value["title"];
            txtGrDesc.text = element.value["description"];
          }else  if(element.value["language"] == "ja"){
            txtJpTitle.text = element.value["title"];
            txtJpDesc.text = element.value["description"];
          }
        });
        update();
      }

    });
    update();
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

  //on language select
  onLanguageSelectTap(SelectLanguageModel data) async {
    if (data.code == "en") {
      languageVal = "en";
    } else if (data.code == "hi") {
      languageVal = "hi";
    } else if (data.code == "ar") {
      languageVal = "ar";
    } else if (data.code == "fr") {
      languageVal = "fr";
    } else if (data.code == "it") {
      languageVal = "it";
    } else if (data.code == "ge") {
      languageVal = "ge";
    }
    update();
  }

// GET IMAGE FROM GALLERY
  Future getImage({source,
    StateSetter? setState,
    dropImage,
    context,
    uploadFile,
    title}) async {
    if (title == "image1") {
      onboard1Upload(
          setState: setState,
          source: source,
          dropImage: dropImage,
          title: title,
          context: context,
          uploadFile: uploadFile);
    } else if (title == "image2") {
      onboard2Upload(
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

  onboard1Upload({source,
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
        onboardWebImage1 = image;
        log("onboardWebImage1 : $onboardWebImage1");
        Image image1 = Image.memory(onboardWebImage1);
        log("image1 : $image1");
        isUploadSize = true;
        webImage = onboardWebImage1;
        pickImage = io.File("a");

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
      onboard1File = (await picker.pickImage(source: ImageSource.gallery))!;
      log("onboard1File : $onboard1File");

      if (onboard1File!.name.contains("png") ||
          onboard1File!.name.contains("jpg") ||
          onboard1File!.name.contains("jpeg")) {
        var image = await onboard1File!.readAsBytes();
        onboardWebImage1 = image;

        Image image1 = Image.memory(onboardWebImage1);
        log("image1 : $image1");
        isUploadSize = true;
        webImage = onboardWebImage1;
        pickImage = io.File(onboard1File!.path);
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

  onboard2Upload({source,
    StateSetter? setState,
    dropImage,
    context,
    uploadFile,
    title}) async {
    if (dropImage != null) {
      if (onboardImageName2.contains("png") ||
          onboardImageName2.contains("jpg") ||
          onboardImageName2.contains("jpeg")) {
        var image = dropImage;
        onboardUploadWebImage2 = image;

        Image image1 = Image.memory(onboardUploadWebImage2);

        ImageInfo info = await getImageInfo(image1);

        onboardWebImage2 = onboardUploadWebImage2;
        onboardPickImage2 = io.File("a");
        isOnboardUploadFile2 = true;
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
      onboard2File = (await picker.pickImage(source: ImageSource.gallery))!;
      log("onboard1File : $onboard2File");

      if (onboard2File!.name.contains("png") ||
          onboard2File!.name.contains("jpg") ||
          onboard2File!.name.contains("jpeg")) {
        var image = await onboard2File!.readAsBytes();
        onboardUploadWebImage2 = image;

        Image image1 = Image.memory(onboardUploadWebImage2);
        log("image1 : $image1");
        ImageInfo info = await getImageInfo(image1);

        onboardWebImage2 = onboardUploadWebImage2;
        onboardPickImage2 = io.File(onboard2File!.path);
        isOnboardUploadFile2 = true;

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

  drawerLogoUpload({source,
    StateSetter? setState,
    dropImage,
    context,
    uploadFile,
    title}) async {
    if (dropImage != null) {
      if (onboardImageName3.contains("png") ||
          onboardImageName3.contains("jpg") ||
          onboardImageName3.contains("jpeg")) {
        var image = dropImage;
        onboard3UploadWebImage3 = image;

        Image image1 = Image.memory(onboard3UploadWebImage3);

        onboardWebImage3 = onboard3UploadWebImage3;
        onboardPickImage3 = io.File("a");
        isOnboardUploadFile3 = true;

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
      onboard3File = (await picker.pickImage(source: ImageSource.gallery))!;
      log("onboard1File : $onboard3File");

      if (onboard3File!.name.contains("png") ||
          onboard3File!.name.contains("jpg") ||
          onboard3File!.name.contains("jpeg")) {
        var image = await onboard3File!.readAsBytes();
        onboard3UploadWebImage3 = image;

        Image image1 = Image.memory(onboard3UploadWebImage3);
        log("image1 : $image1");
        ImageInfo info = await getImageInfo(image1);

        onboardWebImage3 = onboard3UploadWebImage3;
        onboardPickImage3 = io.File(onboard3File!.path);
        isOnboardUploadFile3 = true;

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
  Future uploadLogoFile() async {
    bool isLoginTest = appCtrl.storage.read(session.isLoginTest);
    if (isLoginTest) {
      accessDenied(fonts.modification.tr);
    } else {
      isLoading = true;
      if (pickImage != null) {
        update();
        String fileName = DateTime
            .now()
            .millisecondsSinceEpoch
            .toString();
        Reference reference = FirebaseStorage.instance.ref().child(fileName);

        UploadTask? uploadTask;
        uploadTask = reference.putData(webImage);

        uploadTask.then((res) async {
          log("res : $res");
          res.ref.getDownloadURL().then((downloadUrl) async {
            imageUrl = downloadUrl;
            log("imageUrl : $imageUrl");
            update();
            await Future.delayed(Durations.s3);
          }, onError: (err) {
            update();
          });
        });
      }

      if (onboardPickImage2 != null) {
        update();
        String fileName = DateTime
            .now()
            .millisecondsSinceEpoch
            .toString();
        Reference reference = FirebaseStorage.instance.ref().child(fileName);

        UploadTask? uploadTask;
        uploadTask = reference.putData(onboardWebImage2);

        uploadTask.then((res) async {
          log("res : $res");
          res.ref.getDownloadURL().then((downloadUrl) async {
            imageUrl2 = downloadUrl;
            log("imageUrl2 : $imageUrl2");
            update();
            await Future.delayed(Durations.s3);
          }, onError: (err) {
            update();
          });
        });
      }

      if (onboardPickImage3 != null) {
        update();
        String fileName = DateTime
            .now()
            .millisecondsSinceEpoch
            .toString();
        Reference reference = FirebaseStorage.instance.ref().child(fileName);

        UploadTask? uploadTask;
        uploadTask = reference.putData(onboardWebImage3);

        uploadTask.then((res) async {
          log("res : $res");
          res.ref.getDownloadURL().then((downloadUrl) async {
            imageUrl3 = downloadUrl;
            log("imageUrl3 : $imageUrl3");
            update();
            addData();
            await Future.delayed(Durations.s3);
          }, onError: (err) {
            update();
          });
        });
      }
    }
  }


  updateData()async{
    isLoading = true; update();

    if(formKey.currentState!.validate()){
      if(imageUrl.isNotEmpty && imageUrl2.isNotEmpty && imageUrl3.isNotEmpty) {

        await FirebaseFirestore.instance.collection(collectionName.onBoardScreen).doc(id)
            .update({
          "images": [imageUrl, imageUrl2, imageUrl3],
          "languages": [
            {
              "title": txtEngTitle.text,
              "description": txtEngDesc.text,
              "language": "en"
            },
            {
              "title": txtHiTitle.text,
              "description": txtHiDesc.text,
              "language": "hi"
            },
            {
              "title": txtFrTitle.text,
              "description": txtFrDesc.text,
              "language": "fr"
            },
            {
              "title": txtITTitle.text,
              "description": txtITDesc.text,
              "language": "it"
            },
            {
              "title": txtGrTitle.text,
              "description": txtGrDesc.text,
              "language": "ge"
            },
            {
              "title": txtJpTitle.text,
              "description": txtJpDesc.text,
              "language": "ja"
            }
          ]
        }).then((value) {
          appCtrl.isAlert = false;
          isLoading = false;
          update();
        });
      }else{
        appCtrl.isAlert = true;
        update();
      }
    }
  }

  addData() async {
    isLoading = true; update();

    if(formKey.currentState!.validate()){
      if(imageUrl.isNotEmpty && imageUrl2.isNotEmpty && imageUrl3.isNotEmpty) {

        await FirebaseFirestore.instance.collection(collectionName.onBoardScreen)
            .add({
          "images": [imageUrl, imageUrl2, imageUrl3],
          "languages": [
            {
              "title": txtEngTitle.text,
              "description": txtEngDesc.text,
              "language": "en"
            },
            {
              "title": txtHiTitle.text,
              "description": txtHiDesc.text,
              "language": "hi"
            },
            {
              "title": txtFrTitle.text,
              "description": txtFrDesc.text,
              "language": "fr"
            },
            {
              "title": txtITTitle.text,
              "description": txtITDesc.text,
              "language": "it"
            },
            {
              "title": txtGrTitle.text,
              "description": txtGrDesc.text,
              "language": "ge"
            },
            {
              "title": txtJpTitle.text,
              "description": txtJpDesc.text,
              "language": "ja"
            }
          ]
        }).then((value) {
          appCtrl.isAlert = false;
          isLoading = false;
          update();
        });
      }else{
        appCtrl.isAlert = true;
        update();
      }
    }
  }

  @override
  void onReady() {
    getData();

    // TODO: implement onReady
    super.onReady();
  }
}
