part of 'expenses_bloc.dart';

sealed class ExpensesState extends Equatable {
  const ExpensesState();

  @override
  List<Object> get props => [];
}

final class ExpensesInitial extends ExpensesState {}

final class FetchLoading extends ExpensesState {}

final class FetchSuccess extends ExpensesState {
  final List<CategoryModel> categories;
  final List<DescriptionModel> descriptions;

  const FetchSuccess(this.categories, this.descriptions);

  @override
  List<Object> get props => [categories, descriptions];
}

final class FetchFailure extends ExpensesState {
  final String error;

  const FetchFailure(this.error);

  @override
  List<Object> get props => [error];
}
