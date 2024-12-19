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
        appBar: _appBar(theme),
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

  AppBar _appBar(ThemeData theme) {
    return AppBar(
        title: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text('¡Bienvenido!', style: theme.textTheme.titleLarge),
          Text('Cristal', style: theme.textTheme.titleMedium)
        ]),
        titleSpacing: 25.0,
        actions: [
          Container(
              margin: const EdgeInsets.only(right: 25.0),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(25.0)),
              child: IconButton(
                  icon: Icon(Icons.settings,
                      size: 32.0, color: theme.colorScheme.primary),
                  onPressed: () {}))
        ]);
  }
}
