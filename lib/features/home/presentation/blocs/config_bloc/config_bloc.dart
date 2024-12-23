import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:finmanageapp/features/auth/domain/use_cases/sign_out_use_case.dart';

part 'config_event.dart';
part 'config_state.dart';

class ConfigBloc extends Bloc<ConfigEvent, ConfigState> {
  final SignOutUseCase _signOutUseCase;

  ConfigBloc(this._signOutUseCase) : super(ConfigInitial()) {
    on<SignOut>((event, emit) async {
      emit(SignOutLoading());

      try {
        await _signOutUseCase();
        emit(SignOutSuccess());
      } catch (e) {
        emit(Failure(e.toString()));
      }
    });
  }
}
