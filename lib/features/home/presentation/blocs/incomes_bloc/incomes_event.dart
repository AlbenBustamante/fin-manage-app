part of 'incomes_bloc.dart';

sealed class IncomesEvent extends Equatable {
  const IncomesEvent();

  @override
  List<Object> get props => [];
}

final class FetchData extends IncomesEvent {
  final TransactionType type = TransactionType.income;

  @override
  List<Object> get props => [type];
}

final class Submit extends IncomesEvent {
  final CreateTransactionParams params;

  const Submit(this.params);
}
