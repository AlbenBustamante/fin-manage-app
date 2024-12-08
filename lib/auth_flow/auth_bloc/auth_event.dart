part of 'auth_bloc.dart';

sealed class AuthEvent extends Equatable {
  const AuthEvent();

  @override
  List<Object?> get props => [];
}

class AuthChange extends AuthEvent {
  final UserModel? _user;

  const AuthChange(this._user);

  UserModel? get user => _user;

  @override
  List<Object?> get props => [_user];
}
