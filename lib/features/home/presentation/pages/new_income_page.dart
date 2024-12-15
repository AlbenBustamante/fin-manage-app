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
  final _amountController = TextEditingController();
  final _dateController = TextEditingController();

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
          },
          builder: (context, state) {
            if (state is IncomesInitial) {
              return const Center(child: Text('Por favor, espera...'));
            }

            if (state is FetchLoading) {
              return const Center(child: CircularProgressIndicator());
            }

            if (state is FetchSuccess) {
              return _view(theme, size, state);
            }

            return Container();
          },
        ));
  }

  SingleChildScrollView _view(ThemeData theme, Size size, FetchSuccess state) {
    return SingleChildScrollView(
        child: Padding(
            padding: const EdgeInsets.all(25.0),
            child: NewTransactionForm(
                amountController: _amountController,
                dateController: _dateController,
                theme: theme,
                maxWidth: size.width - 50.0,
                height: size.height - 160.0,
                onTap: () {},
                categories: state.categories,
                descriptions: state.descriptions)));
  }
}
