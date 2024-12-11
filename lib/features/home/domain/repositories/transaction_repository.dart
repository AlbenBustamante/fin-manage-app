import 'package:finmanageapp/features/home/data/models/transaction_model.dart';

abstract class TransactionRepository {
  Future<TransactionModel> register(TransactionModel transaction);
}
