import 'package:finmanageapp/features/home/domain/entities/description_entity.dart';

class DescriptionModel {
  final String id;
  final String text;
  final String userId;

  const DescriptionModel(
      {required this.id, required this.text, required this.userId});

  factory DescriptionModel.formEntity(DescriptionEntity entity) {
    return DescriptionModel(
        id: entity.id ?? '', text: entity.text, userId: entity.userId);
  }

  @override
  String toString() {
    return 'Description Model: $id, $text, $userId';
  }
}
