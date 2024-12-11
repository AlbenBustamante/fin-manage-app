import 'package:finmanageapp/features/home/data/models/category_model.dart';

abstract class CategoryRepository {
  Future<CategoryModel> register(String category);

  Future<List<CategoryModel>> fetchAll();
}
