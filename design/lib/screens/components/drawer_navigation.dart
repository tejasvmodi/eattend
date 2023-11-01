import 'package:flutter/material.dart';
import '../../auth/firebase_auth_repository.dart';
import '../contact_us/about_us.dart';
import '../contact_us/contact_us.dart';

class DrawerNavigation extends StatelessWidget {
  const DrawerNavigation({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          const DrawerHeader(
            child: Center(
              child: Image(
                  height: 150,
                  width: 300,
                  image: AssetImage('assets/images/logo1.jpg')),
            ),
          ),
          ListTile(
            leading: const Icon(Icons.group),
            title: const Text(
              'About Us',
              style: TextStyle(fontSize: 20),
            ),
            onTap: () {
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => const AboutUs()));
            },
          ),
          ListTile(
            leading: const Icon(Icons.support),
            title: const Text(
              'Contact Us',
              style: TextStyle(fontSize: 20),
            ),
            onTap: () {
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => const ContactUs()));
            },
          ),
          const Spacer(), // Pushes the "LogOut" button to the bottom
          SizedBox(
            width: double.infinity, // Full width
            child: TextButton.icon(
              label: const Text('LogOut'),
              onPressed: () {
                AuthenticationRepository.instance.logOut();
              },
              icon: const Icon(Icons.logout),
            ),
          ),
        ],
      ),
    );
  }
}
