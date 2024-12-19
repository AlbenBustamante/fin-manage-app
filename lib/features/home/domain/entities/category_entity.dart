import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:finmanageapp/core/util/enums.dart';
import 'package:finmanageapp/core/util/params/category_params.dart';

class CategoryEntity {
  String? id;
  final String nameUpper;
  final String name;
  final TransactionType type;

  CategoryEntity(
      {this.id,
      required this.nameUpper,
      required this.name,
      required this.type});

  factory CategoryEntity.fromJson(Map<String, dynamic> json) {
    return CategoryEntity(
        nameUpper: json['nameUpper'],
        name: json['name'],
        type: TransactionType.values
            .firstWhere((type) => type.name == json['type']));
  }

  Map<String, dynamic> toJson() =>
      {'nameUpper': nameUpper, 'name': name, 'type': type.name};

  factory CategoryEntity.fromDocument(DocumentSnapshot doc) {
    final category =
        CategoryEntity.fromJson(doc.data() as Map<String, dynamic>);
    category.id = doc.id;

    return category;
  }

  factory CategoryEntity.fromParams(CreateCategoryParams params) {
    return CategoryEntity(
        nameUpper: params.category.toUpperCase(),
        name: params.category,
        type: params.type);
  }
}
