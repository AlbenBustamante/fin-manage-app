import 'package:finmanageapp/core/util/params/auth_params.dart';
import 'package:finmanageapp/features/auth/data/models/user_model.dart';

abstract class AuthRepository {
  Stream<UserModel?> get user;

  Future<UserModel> signUp({required SignUpParams params});

  Future<void> signIn({required SignInParams params});

  Future<void> signOut();
}
