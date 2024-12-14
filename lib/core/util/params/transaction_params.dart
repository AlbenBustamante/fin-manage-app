import '../enums.dart';

class GetByTransactionTypeParams {
  final TransactionType type;

  const GetByTransactionTypeParams({required this.type});
}

class CreateTransactionParams {
  final String? category, description, categoryId, descriptionId;
  final int value;
  final DateTime date;
  final TransactionType type;

  const CreateTransactionParams(
      {required this.category,
      required this.description,
      required this.categoryId,
      required this.descriptionId,
      required this.value,
      required this.date,
      required this.type});
}
