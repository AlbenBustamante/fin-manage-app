import 'package:finmanageapp/features/auth/domain/entities/user_entity.dart';

class SignUpParams {
  final UserEntity user;
  final String password;

  const SignUpParams({required this.user, required this.password});
}

class SignInParams {
  final String email;
  final String password;

  const SignInParams({required this.email, required this.password});
}
