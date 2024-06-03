import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';

class BottomMenu extends StatelessWidget {
  const BottomMenu({required this.screenIndex, required this.onTap, Key? key})
      : super(key: key);

  final int screenIndex;
  final Function(int) onTap;

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      iconSize: 26,
      showUnselectedLabels: true,
      currentIndex: screenIndex,
      onTap: (index) {
        onTap(index);
      },
      type: BottomNavigationBarType.fixed,
      elevation: 0,
      items: <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(
            screenIndex == 0 ? Ionicons.home : Ionicons.home_outline,
          ),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(
            screenIndex == 1
                ? Ionicons.stats_chart
                : Ionicons.stats_chart_outline,
          ),
          label: 'Activity',
        ),
        BottomNavigationBarItem(
          icon: Icon(
              screenIndex == 2 ? Ionicons.calendar : Ionicons.calendar_outline),
          label: 'Calendar',
        ),
        BottomNavigationBarItem(
          icon: Icon(
              screenIndex == 3 ? Ionicons.person : Ionicons.person_outline),
          label: 'Profile',
        ),
      ],
    );
  }
}
