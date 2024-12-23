import 'dart:developer';

import 'package:finmanageapp/core/config/init_dependencies.dart';
import 'package:finmanageapp/core/util/enums.dart';
import 'package:finmanageapp/features/home/data/models/transaction_model.dart';
import 'package:finmanageapp/features/home/presentation/blocs/home_bloc/home_bloc.dart';
import 'package:finmanageapp/features/home/presentation/pages/config_page.dart';
import 'package:finmanageapp/features/home/presentation/pages/transaction_detail.dart';
import 'package:finmanageapp/shared/components/custom_bottom_navigation_bar.dart';
import 'package:finmanageapp/shared/components/custom_navbar_floating_action_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

class HomePage extends StatelessWidget {
  static const route = '/home';

  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ij<HomeBloc>(),
      child: const _HomePageView(),
    );
  }
}

class _HomePageView extends StatefulWidget {
  const _HomePageView();

  @override
  State<_HomePageView> createState() => _HomePageViewState();
}

class _HomePageViewState extends State<_HomePageView> {
  int _selectedIndex = 0;

  @override
  void initState() {
    context.read<HomeBloc>().add(FetchData());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final width = MediaQuery.sizeOf(context).width;

    return Scaffold(
        appBar: _appBar(theme),
        body: BlocConsumer<HomeBloc, HomeState>(
          listener: (context, state) {
            if (state is Success) {
              log(state.user.toString());
              log('${state.totalBalance}');
            }

            if (state is Failure) {
              ScaffoldMessenger.of(context)
                  .showSnackBar(SnackBar(content: Text(state.error)));
            }
          },
          builder: (context, state) {
            if (state is HomeInitial) {
              return const Center(child: Text('Por favor, espere...'));
            }

            if (state is Loading) {
              return const Center(child: CircularProgressIndicator());
            }

            if (state is Success || state is Failure) {
              return _view(theme, width, state);
            }

            return Container();
          },
        ),
        bottomNavigationBar: _navigationBar(),
        floatingActionButton: CustomNavbarFloatingActionButton(theme: theme),
        floatingActionButtonLocation:
            FloatingActionButtonLocation.centerDocked);
  }

  Widget _view(ThemeData theme, double width, HomeState state) {
    return Padding(
      padding: const EdgeInsets.all(25.0),
      child: Column(children: [
        _card(width, theme, state),
        const SizedBox(height: 40.0),
        _transactionsTitle(),
        const SizedBox(height: 20.0),
        if (state is Success)
          Flexible(
            child: ListView.builder(
              itemCount: state.transactions.length,
              itemBuilder: (context, index) {
                return _transaction(width, state.transactions[index]);
              },
            ),
          )
      ]),
    );
  }

  GestureDetector _transaction(double width, TransactionModel transaction) {
    final formatter = DateFormat('dd/MM/yyyy');

    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, TransactionDetail.route,
            arguments: transaction);
      },
      child: Container(
          margin: const EdgeInsets.only(bottom: 20.0),
          padding: const EdgeInsets.symmetric(horizontal: 25.0),
          width: width,
          height: 100.0,
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(25.0)),
          child:
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            SizedBox(
              width: width - 250.0,
              child: Text(transaction.category,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                      fontSize: 19.0, fontWeight: FontWeight.w900)),
            ),
            Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                      "${transaction.type == TransactionType.expense ? '-' : '+'} ${transaction.value}",
                      style: const TextStyle(
                          fontSize: 18.0, fontWeight: FontWeight.bold)),
                  Text(formatter.format(transaction.date),
                      style: const TextStyle(fontWeight: FontWeight.w300))
                ])
          ])),
    );
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

  Container _card(double width, ThemeData theme, HomeState state) {
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
          child: _cardStats(state),
        ));
  }

  Column _cardStats(HomeState state) {
    return Column(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
      Column(children: [
        const Text('Saldo Total',
            style: TextStyle(
                color: Colors.white,
                fontSize: 20.0,
                fontWeight: FontWeight.bold)),
        Text(state is Success ? '${state.totalBalance}' : '0',
            style: const TextStyle(
                color: Colors.white,
                fontSize: 44.0,
                fontWeight: FontWeight.bold))
      ]),
      Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        _cardStat(false, state is Success ? state.totalIncomes : 0),
        _cardStat(true, state is Success ? state.totalExpenses : 0)
      ])
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
        title: BlocBuilder<HomeBloc, HomeState>(
          builder: (context, state) {
            return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('¡Bienvenido!', style: theme.textTheme.titleMedium),
                  Text(state is Success ? state.user.name : '',
                      style: theme.textTheme.titleLarge)
                ]);
          },
        ),
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
                  onPressed: () {
                    Navigator.pushNamed(context, ConfigPage.route);
                  }))
        ]);
  }
}
