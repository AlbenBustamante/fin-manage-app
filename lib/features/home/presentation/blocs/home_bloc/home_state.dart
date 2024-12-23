part of 'home_bloc.dart';

sealed class HomeState extends Equatable {
  const HomeState();

  @override
  List<Object> get props => [];
}

final class HomeInitial extends HomeState {}

final class Loading extends HomeState {}

final class Success extends HomeState {
  final UserModel user;
  final int totalBalance;
  final int totalIncomes;
  final int totalExpenses;
  final List<TransactionModel> transactions;

  const Success(this.user, this.totalBalance, this.totalIncomes,
      this.totalExpenses, this.transactions);
}

final class Failure extends HomeState {
  final String error;

  const Failure(this.error);
}
