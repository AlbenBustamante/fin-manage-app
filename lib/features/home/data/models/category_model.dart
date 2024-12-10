import 'package:finmanageapp/features/home/domain/entities/category_entity.dart';

class CategoryModel {
  final String id;
  final String name;

  const CategoryModel({required this.id, required this.name});

  static CategoryModel fromEntity(CategoryEntity entity) {
    return CategoryModel(id: entity.id ?? '', name: entity.name);
  }

  @override
  String toString() {
    return 'CategoryModel: $id, $name';
  }
}
