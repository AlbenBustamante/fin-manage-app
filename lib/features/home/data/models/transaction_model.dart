import 'package:finmanageapp/core/util/enums.dart';
import 'package:finmanageapp/features/home/domain/entities/transaction_entity.dart';

class TransactionModel {
  final String id, userId, categoryId, descriptionId;
  final int value;
  final DateTime date;
  final TransactionType type;

  const TransactionModel(
      {required this.id,
      required this.userId,
      required this.categoryId,
      required this.descriptionId,
      required this.value,
      required this.date,
      required this.type});

  factory TransactionModel.fromEntity(TransactionEntity entity) {
    return TransactionModel(
        id: entity.id ?? '',
        userId: entity.userId,
        categoryId: entity.categoryId,
        descriptionId: entity.descriptionId,
        value: entity.value,
        date: entity.date,
        type: entity.type);
  }

  @override
  String toString() {
    return 'Transaction Model: $id, $userId, $categoryId, $descriptionId, $value, $date, $type';
  }
}
