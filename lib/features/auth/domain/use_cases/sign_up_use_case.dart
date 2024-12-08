import 'package:finmanageapp/core/params/params.dart';
import 'package:finmanageapp/core/use_case/use_case.dart';
import 'package:finmanageapp/features/auth/data/models/user_model.dart';
import 'package:finmanageapp/features/auth/domain/repository/auth_repository.dart';

class SignUpUseCase extends UseCase<UserModel, SignUpParams> {
  final AuthRepository _authRepository;

  SignUpUseCase(this._authRepository);

  @override
  Future<UserModel> call({required SignUpParams params}) {
    return _authRepository.signUp(params: params);
  }
}
