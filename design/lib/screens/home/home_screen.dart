import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:design/controllers/button_disable.dart';
import 'package:design/screens/desise_full_description/desise_description_screen.dart';
import 'package:design/screens/experts/expert_list.dart';
import 'package:design/screens/notification_screen.dart';
import 'package:design/screens/screen_navigator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  bool isButtonDisable =false;
  
  void disableButton(){
    setState(() {
      isButtonDisable = true;
    });
  }
  @override
  Widget build(BuildContext context) {
      return  Scaffold(   
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'Take Your Attendance:',
            ),
            const SizedBox(height: 25,),
            ElevatedButton(onPressed: isButtonDisable ? null: () {
            disableButton();
          }, child: Text("fill the attendace"))
        ],
          
     
        ),
        
      ),
            );
          
  }
}
 
// ignore: non_constant_identifier_names
