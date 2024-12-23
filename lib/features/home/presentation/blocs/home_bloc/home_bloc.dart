import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:finmanageapp/features/auth/data/models/user_model.dart';
import 'package:finmanageapp/features/home/data/models/transaction_model.dart';
import 'package:finmanageapp/features/home/domain/use_cases/get_current_user_use_case.dart';
import 'package:finmanageapp/features/home/domain/use_cases/get_home_stats_use_case.dart';
import 'package:finmanageapp/features/home/domain/use_cases/get_home_transactions_use_case.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final GetCurrentUserUseCase _getCurrentUserUseCase;
  final GetHomeStatsUseCase _getHomeStatsUseCase;
  final GetHomeTransactionsUseCase _getHomeTransactionsUseCase;

  HomeBloc(this._getCurrentUserUseCase, this._getHomeStatsUseCase,
      this._getHomeTransactionsUseCase)
      : super(HomeInitial()) {
    on<FetchData>((event, emit) async {
      emit(Loading());

      try {
        final user = await _getCurrentUserUseCase();
        final stats = await _getHomeStatsUseCase();
        final transactions = await _getHomeTransactionsUseCase();

        emit(Success(user!, stats.totalBalance, stats.totalIncomes,
            stats.totalExpenses, transactions));
      } catch (e) {
        emit(Failure(e.toString()));
      }
    });
  }
}
