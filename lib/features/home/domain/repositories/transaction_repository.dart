import 'package:finmanageapp/core/util/params/transaction_params.dart';
import 'package:finmanageapp/features/home/data/models/transaction_model.dart';

abstract class TransactionRepository {
  Future<TransactionModel> register({required CreateTransactionParams params});
}
