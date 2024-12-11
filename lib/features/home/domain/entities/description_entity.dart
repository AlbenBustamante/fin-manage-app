import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:finmanageapp/core/util/enums.dart';

class DescriptionEntity {
  String? id;
  final String text;
  final String userId;
  final TransactionType type;

  DescriptionEntity(
      {this.id, required this.text, required this.userId, required this.type});

  factory DescriptionEntity.fromJson(Map<String, dynamic> json) {
    return DescriptionEntity(
        text: json['text'],
        userId: json['userId'],
        type: json['type'] as TransactionType);
  }

  Map<String, dynamic> toJson() =>
      {'text': text, 'userId': userId, 'type': type};

  factory DescriptionEntity.fromDocument(DocumentSnapshot doc) {
    final description =
        DescriptionEntity.fromJson(doc.data() as Map<String, dynamic>);
    description.id = doc.id;

    return description;
  }
}
