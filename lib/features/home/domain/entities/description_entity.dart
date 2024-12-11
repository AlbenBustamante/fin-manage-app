import 'package:cloud_firestore/cloud_firestore.dart';

class DescriptionEntity {
  String? id;
  String text;
  String userId;

  DescriptionEntity({this.id, required this.text, required this.userId});

  factory DescriptionEntity.fromJson(Map<String, dynamic> json) {
    return DescriptionEntity(text: json['text'], userId: json['userId']);
  }

  Map<String, dynamic> toJson() => {'text': text, 'userId': userId};

  factory DescriptionEntity.fromDocument(DocumentSnapshot doc) {
    final description =
        DescriptionEntity.fromJson(doc.data() as Map<String, dynamic>);
    description.id = doc.id;

    return description;
  }
}
