import 'package:finmanageapp/core/util/enums.dart';
import 'package:finmanageapp/features/home/domain/entities/transaction_entity.dart';

class TransactionModel {
  String category, description;
  final String id, userId, categoryId, descriptionId;
  final int value;
  final DateTime date;
  final TransactionType type;

  TransactionModel(
      {required this.id,
      required this.userId,
      required this.categoryId,
      required this.descriptionId,
      required this.value,
      required this.date,
      required this.type,
      required this.category,
      required this.description});

  factory TransactionModel.fromEntity(TransactionEntity entity) {
    return TransactionModel(
        id: entity.id ?? '',
        userId: entity.userId,
        categoryId: entity.categoryId,
        descriptionId: entity.descriptionId,
        value: entity.value,
        date: entity.date,
        type: entity.type,
        category: '',
        description: '');
  }

  @override
  String toString() {
    return 'Transaction Model: $id, $userId, $categoryId: $category, $descriptionId: $description, $value, $date, $type';
  }
}
