part of 'auth_bloc.dart';

sealed class AuthEvent extends Equatable {
  const AuthEvent();

  @override
  List<Object?> get props => [];
}

class AuthChange extends AuthEvent {
  final UserModel? user;

  const AuthChange(this.user);

  @override
  List<Object?> get props => [user];
}
