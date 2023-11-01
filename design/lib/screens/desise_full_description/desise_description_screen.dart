import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:design/screens/components/custom_appbar.dart';
import 'package:design/utility/utils.dart';
import 'package:flutter/material.dart';

class DesiseDescriptionScreen extends StatelessWidget {
  final QueryDocumentSnapshot snapsnot;
  const DesiseDescriptionScreen({super.key, required this.snapsnot});

  @override
  Widget build(BuildContext context) {
    final adviceText = TextEditingController();

    return Scaffold(
      appBar: CustomAppBar().customAppBar(),
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
                    child: Image(
                      width: MediaQuery.sizeOf(context).width,
                      fit: BoxFit.cover,
                      image: NetworkImage(
                        snapsnot.get('url'),
                      ),
                    ),
                    // child: pickedImage != null
                    //     ? Image.file(
                    //         pickedImage!,
                    //         width: 350,
                    //         height: 350,
                    //         fit: BoxFit.cover,
                    //       )
                    //     : const Icon(Icons.error),
                  ),
                ],
              ),
            ),

            const SizedBox(
              height: 10,
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
                height: 10), // Adding some spacing between the image and text
            Text(
              snapsnot.get('aiDignose'),
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
                color: Color.fromARGB(
                    134, 54, 109, 22), // You can change the text color here
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
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
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: TextFormField(
                controller: adviceText,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Enter Advice',
                ),
              ),
            ),
            Column(
              // mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: ElevatedButton(
                    onPressed: () async {
                      if (adviceText.text != '') {
                        await FirebaseFirestore.instance
                            .collection('Images')
                            .doc(snapsnot.id)
                            .update({
                          'expertDignose': adviceText.text,
                        });
                        showSnackkBar(
                          title: 'Advice Submited Successfully',
                          icon: const Icon(Icons.done_all),
                          message: 'Success',
                        );
                      } else {
                        showSnackkBar(
                          title: 'Empty Message Can\'t Be Submitted',
                          icon: const Icon(Icons.error),
                          message: 'Error',
                        );
                      }

                      adviceText.text = '';
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromARGB(
                          134, 54, 109, 22), // Change the background color
                      shape: RoundedRectangleBorder(
                        borderRadius:
                            BorderRadius.circular(5), // Change the radius
                      ),
                      padding: const EdgeInsets.symmetric(
                        vertical: 20, // Adjust vertical padding as needed
                        horizontal: 80, // Adjust horizontal padding as needed
                      ),
                    ),
                    child: const Text(
                      'SUBMIT',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                      ), // Change the text color
                    ),
                  ),
                ),
                const SizedBox(width: 30),
                // Adding spacing between buttons
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
                      horizontal: 65, // Adjust horizontal padding as needed
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
