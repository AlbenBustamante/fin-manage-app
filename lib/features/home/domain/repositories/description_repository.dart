import 'package:finmanageapp/core/util/params/description_params.dart';
import 'package:finmanageapp/core/util/params/transaction_params.dart';
import 'package:finmanageapp/features/home/data/models/description_model.dart';

abstract class DescriptionRepository {
  Future<DescriptionModel> register({required CreateDescriptionParams params});

  Future<List<DescriptionModel>> fetchAllByType(
      {required GetByTransactionTypeParams params});
}
