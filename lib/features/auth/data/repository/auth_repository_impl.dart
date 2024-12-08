import 'dart:developer';

import 'package:finmanageapp/core/api/api_collection.dart';
import 'package:finmanageapp/core/params/params.dart';
import 'package:finmanageapp/features/auth/domain/entities/user_entity.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:finmanageapp/features/auth/data/models/user_model.dart';
import 'package:finmanageapp/features/auth/domain/repository/auth_repository.dart';
import 'package:rxdart/rxdart.dart';

class AuthRepositoryImpl extends AuthRepository {
  final _auth = FirebaseAuth.instance;
  final _collection = ApiCollection.users;

  @override
  Stream<UserModel?> get user =>
      _auth.authStateChanges().flatMap((firebaseUser) async* {
        if (firebaseUser == null) {
          yield UserModel.empty();
        } else {
          await _collection.doc(firebaseUser.uid).get().then(
              (doc) => UserModel.fromEntity(UserEntity.fromDocument(doc)));
        }
      });

  @override
  Future<UserModel> signUp({required SignUpParams params}) async {
    try {
      final user = params.user;
      final password = params.password;

      final userCredential = await _auth.createUserWithEmailAndPassword(
          email: user.email, password: password);

      final uid = userCredential.user!.uid;

      await _collection.doc(uid).set(user.toJson());

      user.id = uid;

      return UserModel.fromEntity(user);
    } catch (e) {
      log(e.toString());
      rethrow;
    }
  }
}
