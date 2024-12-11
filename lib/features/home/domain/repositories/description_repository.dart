import 'package:finmanageapp/core/util/params/transaction_params.dart';
import 'package:finmanageapp/features/home/data/models/description_model.dart';

abstract class DescriptionRepository {
  Future<DescriptionModel> register(String description);

  Future<List<DescriptionModel>> fetchAllByType(
      {required GetByTransactionTypeParams params});
}
