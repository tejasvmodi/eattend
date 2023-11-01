import 'package:design/screens/experts/expert_list.dart';
import 'package:design/screens/home/home_screen.dart';
import 'package:design/screens/profile/user_profile_screen.dart';
import 'package:flutter/material.dart';
import 'components/bottom_navigation_floting.dart';
import 'components/drawer_navigation.dart';
import 'components/custom_appbar.dart';

class ScreenNavigator extends StatefulWidget {
  const ScreenNavigator({super.key});

  @override
  State<ScreenNavigator> createState() => _ScreenNavigatorState();
}

class _ScreenNavigatorState extends State<ScreenNavigator> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    final List<Widget> currentScreen = [
      const Home(),
      ExpertList(),
      const UserProfileScreen(),
    ];

    return Scaffold(
      drawer: const DrawerNavigation(),
      appBar: CustomAppBar().customAppBar(),
      body: SafeArea(
        maintainBottomViewPadding: true,
        child: Container(
          color: Colors.greenAccent.withOpacity(0.1),
          child: currentScreen[_currentIndex],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(
            tooltip: 'Mark Attendance',
            icon: Icon(Icons.home),
            label: 'Mark Attendance',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_search),
            label: 'see Attendance',
            tooltip: 'see Attendance',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
            tooltip: 'Profile',
          )
        ],
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
      // floatingActionButton: const FlotingBottomNavigation(),
      // floatingActionButtonLocation: FloatingActionButtonLocation.miniEndFloat,
    );
  }
}
