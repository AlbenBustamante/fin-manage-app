import 'package:finmanageapp/core/util/enums.dart';
import 'package:finmanageapp/features/home/domain/entities/description_entity.dart';

class DescriptionModel {
  String id;
  final String text, userId;
  final TransactionType type;

  DescriptionModel(
      {required this.id,
      required this.text,
      required this.userId,
      required this.type});

  factory DescriptionModel.fromEntity(DescriptionEntity entity) {
    return DescriptionModel(
        id: entity.id ?? '',
        text: entity.text,
        userId: entity.userId,
        type: entity.type);
  }

  @override
  String toString() {
    return 'Description Model: $id, $text, $userId, $type';
  }
}
