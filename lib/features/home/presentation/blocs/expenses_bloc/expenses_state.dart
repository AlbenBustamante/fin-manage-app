part of 'expenses_bloc.dart';

sealed class ExpensesState extends Equatable {
  final List<CategoryModel> categories;
  final List<DescriptionModel> descriptions;

  const ExpensesState(this.categories, this.descriptions);

  @override
  List<Object> get props => [categories, descriptions];
}

final class ExpensesInitial extends ExpensesState {
  ExpensesInitial() : super([], []);
}

final class FetchLoading extends ExpensesState {
  FetchLoading() : super([], []);
}

final class FetchSuccess extends ExpensesState {
  const FetchSuccess(super.categories, super.descriptions);
}

final class FetchFailure extends ExpensesState {
  final String error;

  FetchFailure(this.error) : super([], []);

  @override
  List<Object> get props => [error];
}

final class SubmitLoading extends ExpensesState {
  SubmitLoading() : super([], []);
}

final class SubmitSuccess extends ExpensesState {
  final TransactionModel transaction;

  const SubmitSuccess(this.transaction, super.categories, super.descriptions);

  @override
  List<Object> get props => [transaction];
}

final class SubmitFailure extends ExpensesState {
  final String error;

  SubmitFailure(this.error) : super([], []);

  @override
  List<Object> get props => [error];
}
