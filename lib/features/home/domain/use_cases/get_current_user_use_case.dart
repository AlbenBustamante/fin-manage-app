import 'package:finmanageapp/core/use_case/use_case.dart';
import 'package:finmanageapp/features/auth/data/models/user_model.dart';
import 'package:finmanageapp/features/auth/domain/repository/auth_repository.dart';

class GetCurrentUserUseCase extends UseCase<UserModel?, void> {
  final AuthRepository _authRepository;

  GetCurrentUserUseCase(this._authRepository);

  @override
  Future<UserModel?> call({void params}) {
    return _authRepository.user.first;
  }
}
