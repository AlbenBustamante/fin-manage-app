import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:finmanageapp/core/util/enums.dart';
import 'package:finmanageapp/core/util/params/category_params.dart';

class CategoryEntity {
  String? id;
  final String name;
  final TransactionType type;

  CategoryEntity({this.id, required this.name, required this.type});

  factory CategoryEntity.fromJson(Map<String, dynamic> json) {
    return CategoryEntity(
        name: json['name'], type: json['type'] as TransactionType);
  }

  Map<String, dynamic> toJson() => {'name': name, 'type': type};

  factory CategoryEntity.fromDocument(DocumentSnapshot doc) {
    final category =
        CategoryEntity.fromJson(doc.data() as Map<String, dynamic>);
    category.id = doc.id;

    return category;
  }

  factory CategoryEntity.fromParams(CreateCategoryParams params) {
    return CategoryEntity(name: params.category, type: params.type);
  }
}
