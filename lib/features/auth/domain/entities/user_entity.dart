import 'package:cloud_firestore/cloud_firestore.dart';

class UserEntity {
  String? id;
  String name;
  String email;

  UserEntity({this.id, required this.name, required this.email});

  factory UserEntity.fromJson(Map<String, dynamic> json) {
    return UserEntity(name: json['name'], email: json['email']);
  }

  Map<String, dynamic> toJson() => {'name': name, 'email': email};

  factory UserEntity.fromDocument(DocumentSnapshot doc) {
    final json = doc.data() as Map<String, dynamic>;

    return UserEntity(id: doc.id, name: json['name'], email: json['email']);
  }
}
