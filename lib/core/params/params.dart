import 'package:finmanageapp/features/auth/domain/entities/user_entity.dart';

class SignUpParams {
  final UserEntity user;
  final String password;

  const SignUpParams({required this.user, required this.password});
}
