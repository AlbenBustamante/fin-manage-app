import 'package:cloud_firestore/cloud_firestore.dart';

class TransactionEntity {
  String? id;
  final String userId;
  final String categoryId;
  final String descriptionId;
  final int value;
  final DateTime date;

  TransactionEntity(
      {this.id,
      required this.userId,
      required this.categoryId,
      required this.descriptionId,
      required this.value,
      required this.date});

  factory TransactionEntity.fromJson(Map<String, dynamic> json) {
    return TransactionEntity(
        userId: json['userId'],
        categoryId: json['categoryId'],
        descriptionId: json['descriptionId'],
        value: json['value'],
        date: (json['date'] as Timestamp).toDate());
  }

  Map<String, dynamic> toJson() => {
        'userId': userId,
        'categoryId': categoryId,
        'descriptionId': descriptionId,
        'value': value,
        'date': Timestamp.fromDate(date)
      };

  factory TransactionEntity.fromDocument(DocumentSnapshot doc) {
    final transaction =
        TransactionEntity.fromJson(doc.data() as Map<String, dynamic>);
    transaction.id = doc.id;

    return transaction;
  }
}
