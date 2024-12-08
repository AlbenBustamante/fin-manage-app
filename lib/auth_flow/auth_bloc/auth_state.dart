part of 'auth_bloc.dart';

sealed class AuthState extends Equatable {
  final UserModel? _user;

  const AuthState(this._user);

  UserModel? get user => _user;

  @override
  List<Object?> get props => [_user];
}

final class AuthInitial extends AuthState {
  const AuthInitial(super.user);
}

final class Authenticated extends AuthState {
  const Authenticated(super.user);
}

final class Unauthenticated extends AuthState {
  const Unauthenticated(super.user);
}
