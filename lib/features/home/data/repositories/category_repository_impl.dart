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
    final snapshot =
        await _collection.where('type', isEqualTo: params.type).get();

    final List<CategoryModel> categories = [];

    if (snapshot.docs.isNotEmpty) {
      for (final doc in snapshot.docs) {
        final entity = CategoryEntity.fromDocument(doc);
        categories.add(CategoryModel.fromEntity(entity));
      }
    }

    return categories;
  }

  @override
  Future<CategoryModel> register({required CreateCategoryParams params}) async {
    final name = params.category;
    final type = params.type;

    final snapshot = await _collection
        .where('name', isEqualTo: name)
        .where('type', isEqualTo: type)
        .limit(1)
        .get();

    if (snapshot.docs.isNotEmpty) {
      final entity = CategoryEntity.fromDocument(snapshot.docs.first);
      return CategoryModel.fromEntity(entity);
    }

    final docRef =
        await _collection.add(CategoryEntity(name: name, type: type).toJson());

    return CategoryModel(id: docRef.id, name: name, type: type);
  }
}
