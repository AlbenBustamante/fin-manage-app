import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:finmanageapp/core/util/enums.dart';
import 'package:finmanageapp/core/util/params/transaction_params.dart';
import 'package:finmanageapp/features/home/data/models/category_model.dart';
import 'package:finmanageapp/features/home/data/models/description_model.dart';
import 'package:finmanageapp/features/home/data/models/transaction_model.dart';
import 'package:finmanageapp/features/home/domain/use_cases/get_income_categories_use_case.dart';
import 'package:finmanageapp/features/home/domain/use_cases/get_income_descriptions_use_case.dart';
import 'package:finmanageapp/features/home/domain/use_cases/register_income_transaction_use_case.dart';

part 'incomes_event.dart';
part 'incomes_state.dart';

class IncomesBloc extends Bloc<IncomesEvent, IncomesState> {
  final GetIncomeCategoriesUseCase _getIncomeCategoriesUseCase;
  final GetIncomeDescriptionsUseCase _getIncomeDescriptionsUseCase;
  final RegisterIncomeTransactionUseCase _registerIncomeTransactionUseCase;
  var _categories = <CategoryModel>[];
  var _descriptions = <DescriptionModel>[];

  IncomesBloc(
      this._getIncomeCategoriesUseCase,
      this._getIncomeDescriptionsUseCase,
      this._registerIncomeTransactionUseCase)
      : super(IncomesInitial()) {
    on<FetchData>((event, emit) async {
      emit(FetchLoading());

      try {
        _categories = await _getIncomeCategoriesUseCase();
        _descriptions = await _getIncomeDescriptionsUseCase();

        emit(FetchSuccess(_categories, _descriptions));
      } catch (e) {
        emit(FetchFailure(e.toString()));
      }
    });

    on<Submit>((event, emit) async {
      emit(SubmitLoading());

      try {
        final transaction =
            await _registerIncomeTransactionUseCase(params: event.params);
        emit(SubmitSuccess(transaction, _categories, _descriptions));
      } catch (e) {
        emit(SubmitFailure(e.toString()));
      }
    });
  }
}
