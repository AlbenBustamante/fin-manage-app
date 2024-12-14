part of 'expenses_bloc.dart';

sealed class ExpensesEvent extends Equatable {
  const ExpensesEvent();

  @override
  List<Object> get props => [];
}

class FetchData extends ExpensesEvent {
  final TransactionType type = TransactionType.expense;

  @override
  List<Object> get props => [type];
}
