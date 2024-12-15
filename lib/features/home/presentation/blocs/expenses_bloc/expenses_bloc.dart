import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:finmanageapp/core/util/enums.dart';
import 'package:finmanageapp/features/home/data/models/category_model.dart';
import 'package:finmanageapp/features/home/data/models/description_model.dart';
import 'package:finmanageapp/features/home/domain/use_cases/get_expense_categories_use_case.dart';
import 'package:finmanageapp/features/home/domain/use_cases/get_expense_descriptions_use_case.dart';

part 'expenses_event.dart';
part 'expenses_state.dart';

class ExpensesBloc extends Bloc<ExpensesEvent, ExpensesState> {
  final GetExpenseCategoriesUseCase _getExpenseCategoriesUseCase;
  final GetExpenseDescriptionsUseCase _getExpenseDescriptionsUseCase;

  ExpensesBloc(
      this._getExpenseCategoriesUseCase, this._getExpenseDescriptionsUseCase)
      : super(ExpensesInitial()) {
    on<FetchData>((event, emit) async {
      emit(Loading());

      try {
        final categories = await _getExpenseCategoriesUseCase();
        final descriptions = await _getExpenseDescriptionsUseCase();

        emit(FetchSuccess(categories, descriptions));
      } catch (e) {
        emit(FetchFailure(e.toString()));
      }
    });
  }
}
