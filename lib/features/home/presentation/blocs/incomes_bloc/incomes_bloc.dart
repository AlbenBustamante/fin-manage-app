import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:finmanageapp/core/util/enums.dart';
import 'package:finmanageapp/features/home/data/models/category_model.dart';
import 'package:finmanageapp/features/home/data/models/description_model.dart';
import 'package:finmanageapp/features/home/domain/use_cases/get_income_categories_use_case.dart';
import 'package:finmanageapp/features/home/domain/use_cases/get_income_descriptions_use_case.dart';

part 'incomes_event.dart';
part 'incomes_state.dart';

class IncomesBloc extends Bloc<IncomesEvent, IncomesState> {
  final GetIncomeCategoriesUseCase _getIncomeCategoriesUseCase;
  final GetIncomeDescriptionsUseCase _getIncomeDescriptionsUseCase;

  IncomesBloc(
      this._getIncomeCategoriesUseCase, this._getIncomeDescriptionsUseCase)
      : super(IncomesInitial()) {
    on<FetchData>((event, emit) async {
      emit(FetchLoading());

      try {
        final categories = await _getIncomeCategoriesUseCase(params: null);
        final descriptions = await _getIncomeDescriptionsUseCase(params: null);

        emit(FetchSuccess(categories, descriptions));
      } catch (e) {
        emit(FetchFailure(e.toString()));
      }
    });
  }
}
