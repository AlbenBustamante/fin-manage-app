import 'package:equatable/equatable.dart';
import 'package:finmanageapp/features/auth/domain/entities/user_entity.dart';

class UserModel extends Equatable {
  final String id;
  final String name;
  final String email;

  const UserModel({required this.id, required this.name, required this.email});

  static UserModel fromEntity(UserEntity user) {
    return UserModel(id: user.id!, name: user.name, email: user.email);
  }

  static UserModel empty() {
    return const UserModel(id: '', name: '', email: '');
  }

  @override
  String toString() => 'UserModel: $id, $name, $email';

  @override
  List<Object?> get props => [id, name, email];
}
