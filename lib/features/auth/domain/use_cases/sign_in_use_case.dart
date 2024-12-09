import 'package:finmanageapp/core/params/params.dart';
import 'package:finmanageapp/core/use_case/use_case.dart';
import 'package:finmanageapp/features/auth/domain/repository/auth_repository.dart';

class SignInUseCase extends UseCase<void, SignInParams> {
  final AuthRepository _authRepository;

  SignInUseCase(this._authRepository);

  @override
  Future<void> call({required SignInParams params}) async {
    await _authRepository.signIn(params: params);
  }
}
