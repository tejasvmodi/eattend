import 'package:design/screens/view_attendance/attendance_list.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

  class ButtonState extends ChangeNotifier {
  bool _isButtonEnabled = true;

  bool get isButtonEnabled => _isButtonEnabled;

  void disableButton() {
    _isButtonEnabled = false;
    notifyListeners();
  }
}
class _HomeState extends State<Home> {
  bool isButtonDisable = false;

  @override
  void initState() {
    super.initState();
  }

  void disableButton() {
    setState(() {
      isButtonDisable = true;
    });
  }

  @override
  Widget build(BuildContext context) {
      final buttonState = Provider.of<ButtonState>(context);
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          // const SingleChildScrollView(
          //   child: Padding(
          //     padding: EdgeInsets.all(16.0),
          //     // child: TextField(
          //     //   decoration: InputDecoration(labelText: "Enter the OTP"),
          //     // ),
          //   ),
          // ),
           Padding(
             padding: const EdgeInsets.only(left: 115,bottom: 20),
             child: ElevatedButton(
                     onPressed: buttonState.isButtonEnabled
                ? () {
                    // Your action when the button is pressed
                    buttonState.disableButton(); 
                    _showAlertDialog(context, "Server Response");// Disable the button
                  }
                : null,
                     child: const Text('Mark Attendance'),
                   ),
           ),
      

          //create the second OTP module
        ],
      ),
    );
  }
}

  void _showAlertDialog(BuildContext context,String message) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          content:  Text(message,),
          actions: <Widget>[
            TextButton(
              child: const Text('OK'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
