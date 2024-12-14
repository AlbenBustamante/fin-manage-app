import 'package:finmanageapp/core/use_case/use_case.dart';
import 'package:finmanageapp/core/util/enums.dart';
import 'package:finmanageapp/core/util/params/transaction_params.dart';
import 'package:finmanageapp/features/home/data/models/transaction_model.dart';
import 'package:finmanageapp/features/home/domain/repositories/transaction_repository.dart';

class RegisterExpenseTransactionUseCase
    extends UseCase<TransactionModel, CreateTransactionParams> {
  final TransactionRepository _repository;

  RegisterExpenseTransactionUseCase(this._repository);

  @override
  Future<TransactionModel> call(
      {required CreateTransactionParams params}) async {
    return await _repository.register(
        params: params..type = TransactionType.expense);
  }
}
