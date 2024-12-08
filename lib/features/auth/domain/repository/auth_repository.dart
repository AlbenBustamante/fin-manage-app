import 'package:finmanageapp/core/params/params.dart';
import 'package:finmanageapp/features/auth/data/models/user_model.dart';

abstract class AuthRepository {
  Stream<UserModel?> get user;

  Future<UserModel> signUp({required SignUpParams params});
}
