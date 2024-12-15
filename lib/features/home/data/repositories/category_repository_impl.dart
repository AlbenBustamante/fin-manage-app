import 'dart:developer';

import 'package:finmanageapp/core/api/api_collections.dart';
import 'package:finmanageapp/core/util/params/category_params.dart';
import 'package:finmanageapp/core/util/params/transaction_params.dart';
import 'package:finmanageapp/features/home/data/models/category_model.dart';
import 'package:finmanageapp/features/home/domain/entities/category_entity.dart';
import 'package:finmanageapp/features/home/domain/repositories/category_repository.dart';

class CategoryRepositoryImpl implements CategoryRepository {
  final _collection = ApiCollections.categories;

  @override
  Future<List<CategoryModel>> fetchAllByType(
      {required GetByTransactionTypeParams params}) async {
    try {
      final snapshot =
          await _collection.where('type', isEqualTo: params.type.name).get();

      final List<CategoryModel> categories = [];

      if (snapshot.docs.isNotEmpty) {
        for (final doc in snapshot.docs) {
          final entity = CategoryEntity.fromDocument(doc);
          categories.add(CategoryModel.fromEntity(entity));
        }
      }

      return categories;
    } catch (e, stackTrace) {
      log(e.toString(), stackTrace: stackTrace);
      rethrow;
    }
  }

  @override
  Future<String> register({required CreateCategoryParams params}) async {
    try {
      final entity = CategoryEntity.fromParams(params);
      final docRef = await _collection.add(entity.toJson());

      return docRef.id;
    } catch (e, stackTrace) {
      log(e.toString(), stackTrace: stackTrace);
      rethrow;
    }
  }
}
