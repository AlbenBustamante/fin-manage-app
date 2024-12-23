import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:finmanageapp/core/util/enums.dart';

class TransactionEntity {
  String? id;
  final String userId;
  final String categoryId;
  final String descriptionId;
  final int value;
  final DateTime date;
  final TransactionType type;
  final DateTime? createdDate;

  TransactionEntity(
      {this.id,
      required this.userId,
      required this.categoryId,
      required this.descriptionId,
      required this.value,
      required this.date,
      required this.type,
      this.createdDate});

  factory TransactionEntity.fromJson(Map<String, dynamic> json) {
    return TransactionEntity(
        userId: json['userId'],
        categoryId: json['categoryId'],
        descriptionId: json['descriptionId'],
        value: json['value'],
        date: (json['date'] as Timestamp).toDate(),
        type: TransactionType.values
            .firstWhere((type) => type.name == json['type']),
        createdDate: (json['createdDate'] as Timestamp).toDate());
  }

  Map<String, dynamic> toJson() => {
        'userId': userId,
        'categoryId': categoryId,
        'descriptionId': descriptionId,
        'value': value,
        'date': Timestamp.fromDate(date),
        'type': type.name,
        'createdDate': Timestamp.fromDate(
            createdDate != null ? createdDate! : DateTime.now())
      };

  factory TransactionEntity.fromDocument(DocumentSnapshot doc) {
    final transaction =
        TransactionEntity.fromJson(doc.data() as Map<String, dynamic>);
    transaction.id = doc.id;

    return transaction;
  }
}
