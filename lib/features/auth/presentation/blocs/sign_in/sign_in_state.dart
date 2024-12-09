part of 'sign_in_bloc.dart';

sealed class SignInState extends Equatable {
  const SignInState();

  @override
  List<Object> get props => [];
}

final class SignInInitial extends SignInState {}

final class Loading extends SignInState {}

final class Success extends SignInState {
  final String message = 'Iniciaste sesión exitosamente';
}

final class Failure extends SignInState {
  final String error;

  const Failure(this.error);
}
