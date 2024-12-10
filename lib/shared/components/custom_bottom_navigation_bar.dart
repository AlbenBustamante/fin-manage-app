import 'package:flutter/material.dart';

class CustomBottomNavigationBar extends StatelessWidget {
  final void Function(int index) onTap;
  final int selectedIndex;

  const CustomBottomNavigationBar(
      {required this.onTap, required this.selectedIndex, super.key});

  @override
  Widget build(BuildContext context) {
    const iconSize = 36.0;

    return BottomNavigationBar(
        showSelectedLabels: false,
        showUnselectedLabels: false,
        currentIndex: selectedIndex,
        onTap: (index) => onTap(index),
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.home_outlined, size: iconSize), label: 'Home'),
          BottomNavigationBarItem(
              icon: Icon(Icons.list_alt_outlined, size: iconSize),
              label: 'Reports')
        ]);
  }
}
