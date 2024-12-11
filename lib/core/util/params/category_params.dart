import '../enums.dart';

class CreateCategoryParams {
  final String category;
  final TransactionType type;

  const CreateCategoryParams({required this.category, required this.type});
}
