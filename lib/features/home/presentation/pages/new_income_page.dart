import 'dart:developer';

import 'package:finmanageapp/features/home/presentation/blocs/incomes_bloc/incomes_bloc.dart';
import 'package:finmanageapp/features/home/presentation/widgets/new_transaction_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NewIncomePage extends StatefulWidget {
  static const route = '/new-income';

  const NewIncomePage({super.key});

  @override
  State<NewIncomePage> createState() => _NewIncomePageState();
}

class _NewIncomePageState extends State<NewIncomePage> {
  @override
  void initState() {
    context.read<IncomesBloc>().add(FetchData());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final size = MediaQuery.sizeOf(context);

    return Scaffold(
        appBar: AppBar(title: const Text('Nuevo ingreso')),
        body: BlocConsumer<IncomesBloc, IncomesState>(
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
            if (state is IncomesInitial) {
              return const Center(child: Text('Por favor, espera...'));
            }

            if (state is FetchLoading) {
              return const Center(child: CircularProgressIndicator());
            }

            if (state is FetchSuccess ||
                state is SubmitLoading ||
                state is SubmitSuccess) {
              return _view(theme, size, state);
            }

            return Container();
          },
        ));
  }

  SingleChildScrollView _view(ThemeData theme, Size size, IncomesState state) {
    final maxWidth = size.width - 50.0;

    return SingleChildScrollView(
        child: Padding(
            padding: const EdgeInsets.all(25.0),
            child: SizedBox(
              height: size.height - 160.0,
              child: _form(theme, state, maxWidth),
            )));
  }

  NewTransactionForm _form(
      ThemeData theme, IncomesState state, double maxWidth) {
    return NewTransactionForm(
        theme: theme,
        categories: state.categories,
        descriptions: state.descriptions,
        callback: (params) => context.read<IncomesBloc>().add(Submit(params)),
        loading: state is SubmitLoading,
        maxWidth: maxWidth);
  }
}
