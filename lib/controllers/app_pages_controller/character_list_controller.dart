import 'dart:developer';
import 'dart:math' as math;
import 'package:flutter/foundation.dart';
import 'package:probot_admin/config.dart';
import 'package:probot_admin/screens/characters/layouts/add_character.dart';
import 'dart:io' as io;

class CharactersController extends GetxController {
  dynamic usageCtrl;
  bool isLoading = false;
  XFile? imageFile;
  bool isUploadSize = false;
  bool isAlert = false;
  TextEditingController txtTitle = TextEditingController();
  TextEditingController txtMessage = TextEditingController();
  TextEditingController txtPrice = TextEditingController();
  TextEditingController txtType = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  late DropzoneViewController? controller1;

  Uint8List uploadWebImage = Uint8List(8);

  bool sortAscending = true;

  final bool showSelect = true;
  io.File? pickImage;
  List banner = [];
  String characterId = "";
  var random = math.Random();

  String imageName = "", imageUrl = "";
  Uint8List webImage = Uint8List(8);

  //get data from firebase
  getData() async {}

  //add data
  addData() async {
    bool isLoginTest = appCtrl.storage.read(session.isLoginTest) ?? false;
    if (isLoginTest) {
      accessDenied(fonts.modification.tr);
    } else {
      isLoading = true;
      log("usage2: $usageCtrl");
      if (characterId != "") {
        await FirebaseFirestore.instance
            .collection(collectionName.characters)
            .doc(characterId)
            .update({
          "message": txtMessage.text,
          "image": imageUrl,
          "title": txtTitle.text
        }).then((value) {
          webImage = Uint8List(8);
          pickImage = null;
          imageUrl = "";
          pickImage = null;
          imageFile = null;

          log("usage3: $usageCtrl");
          Get.back();
          isLoading = false;
          update();
        });
        update();
      } else {
        int id = DateTime.now().millisecondsSinceEpoch;
        update();
        await FirebaseFirestore.instance
            .collection(collectionName.characters)
            .doc(id.toString())
            .set({
          "message": txtMessage.text,
          "image": imageUrl,
          "title": txtTitle.text,
          "isActive": true,
          "id": id
        }).then((value) {
          log("usage3: $usageCtrl");
          webImage = Uint8List(8);
          pickImage = null;
          imageUrl = "";
          pickImage = null;
          imageFile = null;
          Get.back();
          isLoading = false;
          update();
        });
        update();
      }
    }
  }

  //on click Image
  onImagePickUp(setState, context) {
    if (kIsWeb) {
      getImage(source: ImageSource.gallery, context: context);
    } else {
      imagePickerOption(
          setState: setState,
          cameraTap: () {
            getImage(
                source: ImageSource.camera,
                setState: setState,
                context: context);
            Get.back();
          },
          galleryTap: () {
            getImage(
                source: ImageSource.gallery,
                setState: setState,
                context: context);
            Get.back();
          });
    }
  }

// GET IMAGE FROM GALLERY
  Future getImage({source, StateSetter? setState, dropImage, context}) async {
    if (dropImage != null) {
      if (imageName.contains("png") ||
          imageName.contains("jpg") ||
          imageName.contains("jpeg")) {
        var image = dropImage;
        uploadWebImage = image;
        log("uploadWebImage : $uploadWebImage");
        Image image1 = Image.memory(uploadWebImage);

        ImageInfo info = await getImageInfo(image1);

        if (info.image.width > 300 && info.image.height > 50) {
          webImage = uploadWebImage;
          pickImage = io.File("a");
          isUploadSize = false;
        } else {
          isUploadSize = true;
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
      imageFile = (await picker.pickImage(source: ImageSource.gallery))!;
      log("imageFile : $imageFile");

      if (imageFile!.name.contains("png") ||
          imageFile!.name.contains("jpg") ||
          imageFile!.name.contains("jpeg")) {
        var image = await imageFile!.readAsBytes();
        uploadWebImage = image;

        Image image1 = Image.memory(uploadWebImage);
        log("image1 : $image1");
        ImageInfo info = await getImageInfo(image1);

        if (info.image.width > 300 && info.image.height > 50) {
          webImage = uploadWebImage;
          pickImage = io.File(imageFile!.path);
          isUploadSize = false;
        } else {
          isUploadSize = true;
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
  Future uploadFile() async {
    bool isLoginTest = appCtrl.storage.read(session.isLoginTest);
    if (isLoginTest) {
      accessDenied(fonts.modification.tr);
    } else {
      if (imageUrl == "") {
        isLoading = true;
        if (pickImage != null) {
          update();
          String fileName = DateTime.now().millisecondsSinceEpoch.toString();
          Reference reference = FirebaseStorage.instance.ref().child(fileName);
          log("reference : $webImage");
          UploadTask? uploadTask;
          uploadTask = reference.putData(webImage);

          uploadTask.then((res) async {
            log("res : $res");
            res.ref.getDownloadURL().then((downloadUrl) async {
              imageUrl = downloadUrl;
              log("imageUrl : $imageUrl");
              update();
              await Future.delayed(Durations.s3);

              addData();
            }, onError: (err) {
              update();
            });
          });
        } else {
          addData();
        }
      } else {
        isLoading = true;
        update();
        addData();
      }
    }
  }

  addCharacterDialog({data}) {
    if (data != null) {
      txtTitle.text = data["title"];
      txtMessage.text = data["message"];
      imageUrl = data["image"];
      characterId = data["id"].toString();
      update();
    } else {
      txtTitle.text = "";
      txtMessage.text = "";
      characterId = "";
      imageUrl = "";

      update();
    }
    showDialog(
        context: Get.context!,
        builder: (BuildContext context) {
          return StatefulBuilder(
              builder: (BuildContext context, StateSetter setState) {
            return const AddCharacter();
          });
        });
  }

  isActiveChange(id, value) async {
    await FirebaseFirestore.instance
        .collection(collectionName.characters)
        .doc(id)
        .update({"isActive": value});
  }

  deleteData(id) async {
    await FirebaseFirestore.instance
        .collection(collectionName.characters)
        .doc(id)
        .delete();
  }

  @override
  void onReady() {
    getData();
    update();
    // TODO: implement onReady
    super.onReady();
  }
}
