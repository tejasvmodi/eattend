import 'package:design/auth/auth_repository.dart';
import 'package:design/utility/constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UserProfileScreen extends StatefulWidget {
  const UserProfileScreen({super.key});

  @override
  State<UserProfileScreen> createState() => _UserProfileScreenState();
}

class _UserProfileScreenState extends State<UserProfileScreen> {
  final AuthenticationRepository authRepo = Get.find();

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        const CircleAvatar(
          backgroundColor: Colors.black12,
          radius: 60,
          backgroundImage: AssetImage(appLogo),
        ),
        const SizedBox(height: 10),
        Text(
          authRepo.student.value!.studentName,
          style: const TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            letterSpacing: 2.5,
          ),
        ),
        const SizedBox(
          height: 20,
          width: 200,
          child: Divider(color: Colors.black12),
        ),
        InfoCard(
          text: authRepo.student.value!.studentEnrollment,
          icon: Icons.email,
          onPressed: () async {},
        ),
        InfoCard(
          text: authRepo.student.value!.studentEmail,
          icon: Icons.email,
          onPressed: () async {},
        ),
        InfoCard(
          text: authRepo.student.value!.studentBatch.batchName,
          icon: Icons.email,
          onPressed: () async {},
        ),
        InfoCard(
          text: authRepo.student.value!.studentCourse.courseName,
          icon: Icons.email,
          onPressed: () async {},
        ),
        InfoCard(
          text: authRepo.student.value!.studentDivision,
          icon: Icons.email,
          onPressed: () async {},
        ),
      ],
    );
  }
}

class InfoCard extends StatelessWidget {
  final String text;
  final IconData icon;
  final Function onPressed;

  const InfoCard({
    super.key,
    required this.text,
    required this.icon,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Card(
        margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 20.0),
        child: ListTile(
          leading: Icon(
            icon,
          ),
          title: Text(
            text,
            style: const TextStyle(
              fontSize: 20,
            ),
          ),
        ),
      ),
    );
  }
}
