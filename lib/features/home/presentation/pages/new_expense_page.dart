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
  final _amountController = TextEditingController();
  final _dateController = TextEditingController();

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
          },
          builder: (context, state) {
            if (state is ExpensesInitial || state is Loading) {
              return const Center(child: CircularProgressIndicator());
            }

            if (state is FetchSuccess) {
              return _view(theme, context, maxWidth, state);
            }

            return Container();
          },
        ));
  }

  SingleChildScrollView _view(ThemeData theme, BuildContext context,
      double maxWidth, FetchSuccess state) {
    return SingleChildScrollView(
        child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25.0, vertical: 25.0),
      child: NewTransactionForm(
          amountController: _amountController,
          dateController: _dateController,
          theme: theme,
          height: MediaQuery.sizeOf(context).height - 160.0,
          maxWidth: maxWidth,
          onTap: () {},
          categories: state.categories,
          descriptions: state.descriptions),
    ));
  }
}
