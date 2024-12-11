import 'package:finmanageapp/features/home/data/models/description_model.dart';

abstract class DescriptionRepository {
  Future<DescriptionModel> register(String description);

  Future<List<DescriptionModel>> fetchAll();
}
