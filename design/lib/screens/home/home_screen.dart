import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
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
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          const SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.all(16.0),
              child: TextField(
                decoration: InputDecoration(labelText: "Enter the OTP"),
              ),
            ),
          ),
          ElevatedButton(
            onPressed: isButtonDisable
                ? null
                : () {
                    disableButton();
                  },
            child: const Text("Fill Attendace"),
          ),

          //create the second OTP module
        ],
      ),
    );
  }
}
