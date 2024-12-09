import 'package:finmanageapp/shared/components/custom_bottom_navigation_bar.dart';
import 'package:finmanageapp/shared/components/custom_navbar_floating_action_button.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  static const route = '/home';

  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
        body: const Center(child: Text('Home Page')),
        bottomNavigationBar: CustomBottomNavigationBar(
            onTap: (index) {
              setState(() {
                _selectedIndex = index;
              });
            },
            selectedIndex: _selectedIndex),
        floatingActionButton: CustomNavbarFloatingActionButton(theme: theme),
        floatingActionButtonLocation:
            FloatingActionButtonLocation.centerDocked);
  }
}
