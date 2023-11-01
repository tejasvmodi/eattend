import 'dart:io';

import 'package:design/database/upload_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

// import 'package:image_picker_platform_interface/image_picker_platform_interface.dart';

class UploadSplash extends StatefulWidget {
  const UploadSplash({super.key});

  @override
  State<UploadSplash> createState() => _UploadSplashState();
}

class _UploadSplashState extends State<UploadSplash> {
  File? pickedImage = Get.arguments;

  var nameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    ImageOperations().uploadImage(pickedImage);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        centerTitle: true,
        title: const Text('Results'),
        forceMaterialTransparency: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.only(bottom: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Align(
              alignment: Alignment.center,
              child: Stack(
                children: [
                  ClipRRect(
                    child: pickedImage != null
                        ? Image.file(
                            pickedImage!,
                            width: 350,
                            height: 350,
                            fit: BoxFit.cover,
                          )
                        : const Icon(Icons.error),
                  ),
                ],
              ),
            ),

            const SizedBox(
              height: 30,
            ), // Adding some spacing between the image and text
            const Text(
              'Identified',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Color.fromARGB(
                    137, 0, 0, 0), // You can change the text color here
              ),
            ),
            const SizedBox(
                height: 25), // Adding some spacing between the image and text
            const Text(
              'Blister rust',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
                color: Color.fromARGB(
                    134, 54, 109, 22), // You can change the text color here
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
              child: // Adding some spacing between the image and text
                  Text(
                'Cronaritium ribicola is a species of rust fungus in the family cronatiacease that causes the disease while pine bister rust.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(
                      137, 0, 0, 0), // You can change the text color here
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {
                    Get.back();
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(
                        134, 54, 109, 22), // Change the background color
                    shape: RoundedRectangleBorder(
                      borderRadius:
                          BorderRadius.circular(5), // Change the radius
                    ),
                    padding: const EdgeInsets.symmetric(
                      vertical: 12, // Adjust vertical padding as needed
                      horizontal: 30, // Adjust horizontal padding as needed
                    ),
                  ),
                  child: const Text(
                    'OKEY',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                    ), // Change the text color
                  ),
                ),
                const SizedBox(width: 30), // Adding spacing between buttons
                ElevatedButton(
                  onPressed: () {
                    // Add your button 2 logic here

                    //Chat Screen
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor:
                        Colors.white, // Change the background color
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5),
                      side: const BorderSide(
                        width: 1, // Change the border width if needed
                      ), // Change the radius
                    ),
                    padding: const EdgeInsets.symmetric(
                      vertical: 12, // Adjust vertical padding as needed
                      horizontal: 30, // Adjust horizontal padding as needed
                    ),
                  ),
                  child: const Text(
                    'ASK EXPERT',
                    style: TextStyle(
                      fontSize: 18,
                    ), // Change the text color
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
