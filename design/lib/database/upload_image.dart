import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:design/models/image_model.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:get/get.dart';

class ImageOperations extends GetxController {
  final FirebaseFirestore fb = FirebaseFirestore.instance;

  void uploadImage(pickedImage) async {
    if (pickedImage == null) return;
    try {
      // print(pickedImage!.path);
      // Create a storage reference from our app
      firebase_storage.UploadTask uploadTask;
      firebase_storage.Reference ref = firebase_storage.FirebaseStorage.instance
          .ref()
          .child("images/")
          .child("/${DateTime.now().microsecondsSinceEpoch}");
      uploadTask = ref.putFile(File(pickedImage!.path));

      await uploadTask.whenComplete(() => null);

      String imageUrl = await ref.getDownloadURL();
      addPathToCollection(
        imageUrl: imageUrl,
        imageText: 'Text On Image',
        aiDignose: 'Problem Identified By AI',
      );
      // print(imageUrl);
    } catch (e) {
      printError();
    }
  }

  void addPathToCollection({imageUrl, imageText, aiDignose}) {
    fb.collection("Images").add(ImageModel(
          dateTime: DateTime.now(),
          geoLocation: 'Ahmedabad',
          aiDignose: aiDignose,
          imageText: imageText,
          url: imageUrl,
        ).toMap());
  }
}
