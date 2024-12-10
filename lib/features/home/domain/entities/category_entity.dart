import 'package:cloud_firestore/cloud_firestore.dart';

class CategoryEntity {
  String? id;
  final String name;

  CategoryEntity({this.id, required this.name});

  factory CategoryEntity.fromJson(Map<String, dynamic> json) {
    return CategoryEntity(name: json['name']);
  }

  Map<String, dynamic> toJson() => {'name': name};

  factory CategoryEntity.fromDocument(DocumentSnapshot doc) {
    final category =
        CategoryEntity.fromJson(doc.data() as Map<String, dynamic>);
    category.id = doc.id;

    return category;
  }
}
