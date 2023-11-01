import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:design/screens/desise_full_description/desise_description_screen.dart';
import 'package:design/screens/experts/expert_list.dart';
import 'package:design/screens/notification_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final FirebaseFirestore fb = FirebaseFirestore.instance;

  @override
  Widget build(BuildContext context) {
            return Scaffold(   
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'Take Your Attendance:',
            ),
            const SizedBox(height: 25,),
            ElevatedButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => ExpertList(),));
              },
              child: Text('I AM Present',style: TextStyle(fontSize: 15),),
            ),
          ],
        ),
      ),
            );
          
  }
}
