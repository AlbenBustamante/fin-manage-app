import 'package:finmanageapp/core/use_case/use_case.dart';
import 'package:finmanageapp/features/home/data/models/total_stats_model.dart';
import 'package:finmanageapp/features/home/domain/repositories/transaction_repository.dart';

class GetHomeStatsUseCase extends UseCase<TotalStatsModel, void> {
  final TransactionRepository _transactionRepository;

  GetHomeStatsUseCase(this._transactionRepository);

  @override
  Future<TotalStatsModel> call({void params}) {
    return _transactionRepository.fetchTotalStats();
  }
}
