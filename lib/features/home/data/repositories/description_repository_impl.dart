import 'dart:developer';

import 'package:finmanageapp/core/api/api_collections.dart';
import 'package:finmanageapp/core/util/params/description_params.dart';
import 'package:finmanageapp/core/util/params/transaction_params.dart';
import 'package:finmanageapp/features/auth/domain/repository/auth_repository.dart';
import 'package:finmanageapp/features/home/data/models/description_model.dart';
import 'package:finmanageapp/features/home/domain/entities/description_entity.dart';
import 'package:finmanageapp/features/home/domain/repositories/description_repository.dart';

class DescriptionRepositoryImpl implements DescriptionRepository {
  final AuthRepository _authRepository;
  final _collection = ApiCollections.descriptions;

  DescriptionRepositoryImpl(this._authRepository);

  @override
  Future<List<DescriptionModel>> fetchAllByType(
      {required GetByTransactionTypeParams params}) async {
    try {
      final user = await _authRepository.user.first;

      final snapshot = await _collection
          .where('userId', isEqualTo: user!.id)
          .where('type', isEqualTo: params.type.name)
          .get();

      final List<DescriptionModel> descriptions = [];

      if (snapshot.docs.isNotEmpty) {
        for (final doc in snapshot.docs) {
          final entity = DescriptionEntity.fromDocument(doc);
          descriptions.add(DescriptionModel.fromEntity(entity));
        }
      }

      return descriptions;
    } catch (e, stackTrace) {
      log(e.toString(), stackTrace: stackTrace);
      rethrow;
    }
  }

  @override
  Future<String> register({required CreateDescriptionParams params}) async {
    try {
      final user = await _authRepository.user.first;

      final snapshot = await _collection
          .limit(1)
          .where('userId', isEqualTo: user!.id)
          .where('type', isEqualTo: params.type.name)
          .where('textUpper', isEqualTo: params.description.toUpperCase())
          .get();

      if (snapshot.docs.isNotEmpty) {
        final doc = snapshot.docs.first;
        return doc.id;
      }

      final entity = DescriptionEntity.fromParams(user.id, params);
      final docRef = await _collection.add(entity.toJson());

      return docRef.id;
    } catch (e, stackTrace) {
      log(e.toString(), stackTrace: stackTrace);
      rethrow;
    }
  }
}
