import 'package:finmanageapp/core/use_case/use_case.dart';
import 'package:finmanageapp/features/auth/domain/repository/auth_repository.dart';

class SignOutUseCase extends UseCase<void, void> {
  final AuthRepository _authRepository;

  SignOutUseCase(this._authRepository);

  @override
  Future<void> call({void params}) {
    return _authRepository.signOut();
  }
}
