import 'package:flutter/material.dart';

// class _BottomNavBarState extends State<BottomNavBar> {
class BottomNavBar extends StatelessWidget {
  final int selectedIndex;
  final Function(int) onItemTapped;

  BottomNavBar({required this.selectedIndex, required this.onItemTapped});

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.home, size: 30),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.search, size: 30),
          label: 'Search',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.people, size: 30),
          label: 'Community',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.settings, size: 30),
          label: 'Settings',
        ),
      ],
      currentIndex: selectedIndex,
      selectedItemColor: Colors.black,
      onTap: onItemTapped,
      backgroundColor: Colors.lightGreen,
    );
  }
}
