part of 'sign_in_bloc.dart';

sealed class SignInEvent extends Equatable {
  const SignInEvent();

  @override
  List<Object> get props => [];
}

class OnSignIn extends SignInEvent {
  final String email, password;

  const OnSignIn(this.email, this.password);
}
