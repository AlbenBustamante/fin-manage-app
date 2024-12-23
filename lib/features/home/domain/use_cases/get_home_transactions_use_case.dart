import 'package:finmanageapp/core/use_case/use_case.dart';
import 'package:finmanageapp/features/home/data/models/transaction_model.dart';
import 'package:finmanageapp/features/home/domain/repositories/transaction_repository.dart';

class GetHomeTransactionsUseCase extends UseCase<List<TransactionModel>, void> {
  final TransactionRepository _transactionRepository;

  GetHomeTransactionsUseCase(this._transactionRepository);

  @override
  Future<List<TransactionModel>> call({void params}) {
    return _transactionRepository.fetchLastTen();
  }
}
