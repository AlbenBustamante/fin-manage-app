import 'dart:developer';

import 'package:finmanageapp/core/api/api_collections.dart';
import 'package:finmanageapp/core/util/params/auth_params.dart';
import 'package:finmanageapp/features/auth/domain/entities/user_entity.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:finmanageapp/features/auth/data/models/user_model.dart';
import 'package:finmanageapp/features/auth/domain/repository/auth_repository.dart';
import 'package:rxdart/rxdart.dart';

class AuthRepositoryImpl extends AuthRepository {
  final _auth = FirebaseAuth.instance;
  final _collection = ApiCollections.users;

  @override
  Stream<UserModel?> get user =>
      _auth.authStateChanges().flatMap((firebaseUser) async* {
        if (firebaseUser == null) {
          yield UserModel.empty;
        } else {
          yield await _collection.doc(firebaseUser.uid).get().then(
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

  @override
  Future<void> signIn({required SignInParams params}) async {
    try {
      final email = params.email;
      final password = params.password;

      await _auth.signInWithEmailAndPassword(email: email, password: password);
    } catch (e) {
      log(e.toString());
      rethrow;
    }
  }
}
