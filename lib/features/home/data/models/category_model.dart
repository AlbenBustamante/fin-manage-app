import 'package:finmanageapp/core/util/enums.dart';
import 'package:finmanageapp/features/home/domain/entities/category_entity.dart';

class CategoryModel {
  String id;
  final String name;
  final TransactionType type;

  CategoryModel({required this.id, required this.name, required this.type});

  factory CategoryModel.fromEntity(CategoryEntity entity) {
    return CategoryModel(
        id: entity.id ?? '', name: entity.name, type: entity.type);
  }

  @override
  String toString() {
    return 'CategoryModel: $id, $name, $type';
  }
}
