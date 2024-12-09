import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:finmanageapp/core/params/params.dart';
import 'package:finmanageapp/features/auth/domain/use_cases/sign_in_use_case.dart';

part 'sign_in_event.dart';
part 'sign_in_state.dart';

class SignInBloc extends Bloc<SignInEvent, SignInState> {
  final SignInUseCase _signInUseCase;

  SignInBloc(this._signInUseCase) : super(SignInInitial()) {
    on<OnSignIn>((event, emit) async {
      emit(Loading());

      try {
        final params =
            SignInParams(email: event.email, password: event.password);
        await _signInUseCase(params: params);

        emit(Success());
      } catch (e) {
        emit(Failure(e.toString()));
      }
    });
  }
}
