part of 'incomes_bloc.dart';

sealed class IncomesState extends Equatable {
  final List<CategoryModel> categories;
  final List<DescriptionModel> descriptions;

  const IncomesState(this.categories, this.descriptions);

  @override
  List<Object> get props => [categories, descriptions];
}

final class IncomesInitial extends IncomesState {
  IncomesInitial() : super([], []);
}

final class FetchLoading extends IncomesState {
  FetchLoading() : super([], []);
}

final class FetchSuccess extends IncomesState {
  const FetchSuccess(super.categories, super.descriptions);
}

final class FetchFailure extends IncomesState {
  final String error;

  FetchFailure(this.error) : super([], []);

  @override
  List<Object> get props => [error];
}

final class SubmitLoading extends IncomesState {
  SubmitLoading() : super([], []);
}

final class SubmitSuccess extends IncomesState {
  final TransactionModel transaction;

  const SubmitSuccess(this.transaction, super.categories, super.descriptions);
}

final class SubmitFailure extends IncomesState {
  final String error;

  SubmitFailure(this.error) : super([], []);
}
