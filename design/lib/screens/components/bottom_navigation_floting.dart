import 'dart:io';

import 'package:design/screens/uploads/upload_splash.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class FlotingBottomNavigation extends StatefulWidget {
  const FlotingBottomNavigation({super.key});

  @override
  State<FlotingBottomNavigation> createState() =>
      _FlotingBottomNavigationState();
}

class _FlotingBottomNavigationState extends State<FlotingBottomNavigation> {
  File? pickedImage;

  pickImage(ImageSource imageType) async {
    try {
      final photo = await ImagePicker().pickImage(source: imageType);
      if (photo == null) return;

      setState(() {
        final pickedImage = File(photo.path);
        Get.to(() => const UploadSplash(),
            arguments: pickedImage,
            transition: Transition.rightToLeftWithFade,
            duration: const Duration(milliseconds: 700));
      });

      // Get.back();
    } catch (error) {
      debugPrint(error.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {
        imagePickerOption();
      },
      backgroundColor: Colors.green,
      foregroundColor: Colors.white,
      elevation: 12,
      mini: true,
      child: const Icon(
        Icons.camera_alt_rounded,
      ),
    );
  }

  void imagePickerOption() {
    Get.bottomSheet(
      SingleChildScrollView(
        child: ClipRRect(
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(10.0),
            topRight: Radius.circular(10.0),
          ),
          child: Container(
            color: Colors.white,
            height: 250,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const Text(
                    "Pick Plant Image",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  ElevatedButton.icon(
                    onPressed: () {
                      pickImage(ImageSource.camera);
                      Get.back();
                    },
                    icon: const Icon(
                      Icons.camera,
                    ),
                    label: const Text(
                      "CAMERA",
                    ),
                  ),
                  ElevatedButton.icon(
                    onPressed: () {
                      pickImage(ImageSource.gallery);
                      Get.back();
                    },
                    icon: const Icon(
                      Icons.image,
                    ),
                    label: const Text(
                      "GALLERY",
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  ElevatedButton.icon(
                    onPressed: () {
                      Get.back();
                    },
                    icon: const Icon(
                      Icons.close,
                    ),
                    label: const Text(
                      "CANCEL",
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
