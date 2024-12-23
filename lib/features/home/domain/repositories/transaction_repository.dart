import 'package:finmanageapp/core/util/params/transaction_params.dart';
import 'package:finmanageapp/features/home/data/models/total_stats_model.dart';
import 'package:finmanageapp/features/home/data/models/transaction_model.dart';

abstract class TransactionRepository {
  Future<List<TransactionModel>> fetchLastTen({void params});

  Future<TotalStatsModel> fetchTotalStats({void params});

  Future<TransactionModel> register({required CreateTransactionParams params});
}
