import 'package:finmanageapp/core/util/enums.dart';

class CreateDescriptionParams {
  final String description;
  final TransactionType type;

  const CreateDescriptionParams(
      {required this.description, required this.type});
}
