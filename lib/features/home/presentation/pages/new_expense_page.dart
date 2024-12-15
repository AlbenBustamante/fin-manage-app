import 'dart:developer';

import 'package:finmanageapp/features/home/presentation/blocs/expenses_bloc/expenses_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../widgets/new_transaction_form.dart';

class NewExpensePage extends StatefulWidget {
  static const route = '/new-expense';

  const NewExpensePage({super.key});

  @override
  State<NewExpensePage> createState() => _NewExpensePageState();
}

class _NewExpensePageState extends State<NewExpensePage> {
  @override
  void initState() {
    context.read<ExpensesBloc>().add(FetchData());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final maxWidth = MediaQuery.sizeOf(context).width - 50.0;

    return Scaffold(
        appBar: AppBar(title: const Text('Nuevo gasto')),
        body: BlocConsumer<ExpensesBloc, ExpensesState>(
          listener: (context, state) {
            if (state is FetchFailure) {
              ScaffoldMessenger.of(context)
                  .showSnackBar(SnackBar(content: Text(state.error)));
            }

            if (state is SubmitSuccess) {
              log(state.transaction.toString());
            }
          },
          builder: (context, state) {
            if (state is ExpensesInitial) {
              return const Center(child: Text('Por favor, espera...'));
            }

            if (state is FetchLoading) {
              return const Center(child: CircularProgressIndicator());
            }

            if (state is FetchSuccess ||
                state is SubmitSuccess ||
                state is SubmitLoading) {
              return _view(theme, context, maxWidth, state);
            }

            return Container();
          },
        ));
  }

  SingleChildScrollView _view(ThemeData theme, BuildContext context,
      double maxWidth, ExpensesState state) {
    return SingleChildScrollView(
        child: Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 25.0, vertical: 25.0),
            child: SizedBox(
              height: MediaQuery.sizeOf(context).height - 160.0,
              child: _form(theme, maxWidth, state),
            )));
  }

  NewTransactionForm _form(
      ThemeData theme, double maxWidth, ExpensesState state) {
    return NewTransactionForm(
        theme: theme,
        categories: state.categories,
        descriptions: state.descriptions,
        callback: (params) => context.read<ExpensesBloc>().add(Submit(params)),
        loading: state is SubmitLoading,
        maxWidth: maxWidth);
  }
}
