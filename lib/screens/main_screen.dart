import 'package:activeaid/screens/profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:activeaid/screens/home_screen.dart';
import 'package:activeaid/screens/activity_screen.dart';
import 'package:activeaid/widgets/main_app_bar.dart';
import 'package:activeaid/widgets/bottom_menu.dart';

class Main extends StatefulWidget {
  const Main({Key? key}) : super(key: key);

  @override
  State<Main> createState() => _MainState();
}

class _MainState extends State<Main> {
  int screenIndex = 0;

  final List screens = [
    {"name": "Home", "screen": const HomeScreen()},
    {"name": "Activity", "screen": const ActivtyScreen()},
    {"name": "Calendar", "screen": const Center(child: Text("Calendar"))},
    {"name": "Profile", "screen": const ProfileScreen()},
  ];

  void onTap(index) {
    setState(() {
      screenIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color.fromRGBO(255, 255, 255, 1),
        appBar: MainAppBar(title: screens[screenIndex]["name"])
            .buildAppBar(context),
        body: screens[screenIndex]["screen"],
        bottomNavigationBar: Container(
          padding: const EdgeInsets.only(bottom: 12, top: 8),
          color: const Color(0XFF7C4DFF),
          child: BottomMenu(screenIndex: screenIndex, onTap: onTap),
        ),
      ),
    );
  }
}
