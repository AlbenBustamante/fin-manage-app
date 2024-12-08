import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:finmanageapp/core/params/params.dart';
import 'package:finmanageapp/features/auth/data/models/user_model.dart';
import 'package:finmanageapp/features/auth/domain/use_cases/sign_up_use_case.dart';

part 'sign_up_event.dart';
part 'sign_up_state.dart';

class SignUpBloc extends Bloc<SignUpEvent, SignUpState> {
  final SignUpUseCase _signUpUseCase;

  SignUpBloc(this._signUpUseCase) : super(SignUpInitial()) {
    on<OnSubmit>((event, emit) async {
      emit(SignUpLoading());
      try {
        final user = await _signUpUseCase(params: event.params);
        emit(SignUpSuccess(user));
      } catch (e) {
        emit(SignUpFailure(e.toString()));
      }
    });
  }
}
