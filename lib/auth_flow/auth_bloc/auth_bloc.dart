import 'dart:async';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:finmanageapp/features/auth/data/models/user_model.dart';
import 'package:finmanageapp/features/auth/domain/repository/auth_repository.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthRepository _authRepository;
  late StreamSubscription<UserModel?> _userSuscription;

  AuthBloc(this._authRepository) : super(AuthInitial(UserModel.empty())) {
    _userSuscription = _authRepository.user.listen((user) {
      log('Authenticated User: $user');
      add(AuthChange(user));
    });

    on<AuthChange>((event, emit) {
      if (event._user == UserModel.empty()) {
        emit(Unauthenticated(UserModel.empty()));
      } else {
        emit(Authenticated(event._user));
      }
    });
  }

  @override
  Future<void> close() {
    _userSuscription.cancel();
    return super.close();
  }
}
