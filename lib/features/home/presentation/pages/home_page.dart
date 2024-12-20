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
    final width = MediaQuery.sizeOf(context).width;

    return Scaffold(
        appBar: _appBar(theme),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(25.0),
            child: Column(children: [
              _card(width, theme),
              const SizedBox(height: 40.0),
              _transactionsTitle(),
              const SizedBox(height: 20.0),
              _transaction(width),
              _transaction(width),
              _transaction(width),
              _transaction(width),
              _transaction(width),
              _transaction(width),
              _transaction(width),
              _transaction(width),
              _transaction(width),
              _transaction(width)
            ]),
          ),
        ),
        bottomNavigationBar: _navigationBar(),
        floatingActionButton: CustomNavbarFloatingActionButton(theme: theme),
        floatingActionButtonLocation:
            FloatingActionButtonLocation.centerDocked);
  }

  Container _transaction(double width) {
    return Container(
        margin: const EdgeInsets.only(bottom: 20.0),
        padding: const EdgeInsets.symmetric(horizontal: 25.0),
        width: width,
        height: 100.0,
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(25.0)),
        child: const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Comida',
                  style:
                      TextStyle(fontSize: 19.0, fontWeight: FontWeight.w900)),
              Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text('9.999.999',
                        style: TextStyle(
                            fontSize: 18.0, fontWeight: FontWeight.bold)),
                    Text('Hoy', style: TextStyle(fontWeight: FontWeight.w300))
                  ])
            ]));
  }

  Row _transactionsTitle() {
    return Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
      Text('Transacciones',
          style: TextStyle(
              color: Colors.grey[800],
              fontSize: 24.0,
              fontWeight: FontWeight.bold)),
      GestureDetector(
          onTap: () {},
          child: Text('Ver todo',
              style: TextStyle(color: Colors.blue[800], fontSize: 18.0)))
    ]);
  }

  Container _card(double width, ThemeData theme) {
    return Container(
        width: width,
        height: width - 150.00,
        decoration: BoxDecoration(
            color: theme.colorScheme.primary,
            borderRadius: BorderRadius.circular(36.0),
            boxShadow: const [
              BoxShadow(color: Colors.grey, spreadRadius: 3.0, blurRadius: 12.0)
            ]),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 32.0),
          child: _cardStats(),
        ));
  }

  Column _cardStats() {
    return Column(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
      const Column(children: [
        Text('Saldo Total',
            style: TextStyle(
                color: Colors.white,
                fontSize: 20.0,
                fontWeight: FontWeight.bold)),
        Text("+# 99.999.999",
            style: TextStyle(
                color: Colors.white,
                fontSize: 44.0,
                fontWeight: FontWeight.bold))
      ]),
      Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [_cardStat(false, 999999999), _cardStat(true, 999999999)])
    ]);
  }

  Row _cardStat(bool expense, int amount) {
    return Row(
      children: [
        Container(
          padding: const EdgeInsets.all(2.0),
          decoration: BoxDecoration(
              color: Colors.black.withOpacity(.1),
              borderRadius: BorderRadius.circular(25.0)),
          child: Icon(expense ? Icons.arrow_upward : Icons.arrow_downward,
              size: 32.0, color: expense ? Colors.red[400] : Colors.green[400]),
        ),
        const SizedBox(width: 12.0),
        Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text(expense ? 'Gastos' : 'Ingresos',
              style: const TextStyle(color: Colors.white, fontSize: 17.0)),
          Text('$amount',
              style: const TextStyle(
                  color: Colors.white,
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold))
        ]),
      ],
    );
  }

  CustomBottomNavigationBar _navigationBar() {
    return CustomBottomNavigationBar(
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        selectedIndex: _selectedIndex);
  }

  AppBar _appBar(ThemeData theme) {
    return AppBar(
        toolbarHeight: 80.0,
        title: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text('¡Bienvenido!', style: theme.textTheme.titleMedium),
          Text('Cristal', style: theme.textTheme.titleLarge)
        ]),
        titleSpacing: 25.0,
        actions: [
          Container(
              margin: const EdgeInsets.only(right: 25.0),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(25.0)),
              child: IconButton(
                  icon:
                      Icon(Icons.settings, size: 32.0, color: Colors.grey[700]),
                  onPressed: () {}))
        ]);
  }
}
