import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:finmanageapp/core/util/enums.dart';
import 'package:finmanageapp/core/util/params/transaction_params.dart';
import 'package:finmanageapp/features/home/data/models/category_model.dart';
import 'package:finmanageapp/features/home/data/models/description_model.dart';
import 'package:finmanageapp/features/home/data/models/transaction_model.dart';
import 'package:finmanageapp/features/home/domain/use_cases/get_expense_categories_use_case.dart';
import 'package:finmanageapp/features/home/domain/use_cases/get_expense_descriptions_use_case.dart';
import 'package:finmanageapp/features/home/domain/use_cases/register_expense_transaction_use_case.dart';

part 'expenses_event.dart';
part 'expenses_state.dart';

class ExpensesBloc extends Bloc<ExpensesEvent, ExpensesState> {
  final GetExpenseCategoriesUseCase _getExpenseCategoriesUseCase;
  final GetExpenseDescriptionsUseCase _getExpenseDescriptionsUseCase;
  final RegisterExpenseTransactionUseCase _registerExpenseTransactionUseCase;
  var _categories = <CategoryModel>[];
  var _descriptions = <DescriptionModel>[];

  ExpensesBloc(
      this._getExpenseCategoriesUseCase,
      this._getExpenseDescriptionsUseCase,
      this._registerExpenseTransactionUseCase)
      : super(ExpensesInitial()) {
    on<FetchData>((event, emit) async {
      emit(FetchLoading());

      try {
        _categories = await _getExpenseCategoriesUseCase();
        _descriptions = await _getExpenseDescriptionsUseCase();

        emit(FetchSuccess(_categories, _descriptions));
      } catch (e) {
        emit(FetchFailure(e.toString()));
      }
    });

    on<Submit>((event, emit) async {
      emit(SubmitLoading());

      try {
        final transaction =
            await _registerExpenseTransactionUseCase(params: event.params);
        emit(SubmitSuccess(transaction, _categories, _descriptions));
      } catch (e) {
        emit(SubmitFailure(e.toString()));
      }
    });
  }
}
