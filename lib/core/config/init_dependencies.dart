import 'package:finmanageapp/features/auth/data/repository/auth_repository_impl.dart';
import 'package:finmanageapp/features/auth/domain/repository/auth_repository.dart';
import 'package:finmanageapp/features/auth/domain/use_cases/sign_in_use_case.dart';
import 'package:finmanageapp/features/auth/domain/use_cases/sign_up_use_case.dart';
import 'package:finmanageapp/features/auth/presentation/blocs/sign_in/sign_in_bloc.dart';
import 'package:finmanageapp/features/home/data/repositories/category_repository_impl.dart';
import 'package:finmanageapp/features/home/data/repositories/description_repository_impl.dart';
import 'package:finmanageapp/features/home/data/repositories/transaction_repository_impl.dart';
import 'package:finmanageapp/features/home/domain/repositories/category_repository.dart';
import 'package:finmanageapp/features/home/domain/repositories/description_repository.dart';
import 'package:finmanageapp/features/home/domain/repositories/transaction_repository.dart';
import 'package:finmanageapp/features/home/domain/use_cases/get_current_user_use_case.dart';
import 'package:finmanageapp/features/home/domain/use_cases/get_expense_categories_use_case.dart';
import 'package:finmanageapp/features/home/domain/use_cases/get_expense_descriptions_use_case.dart';
import 'package:finmanageapp/features/home/domain/use_cases/get_home_stats_use_case.dart';
import 'package:finmanageapp/features/home/domain/use_cases/get_home_transactions_use_case.dart';
import 'package:finmanageapp/features/home/domain/use_cases/get_income_categories_use_case.dart';
import 'package:finmanageapp/features/home/domain/use_cases/get_income_descriptions_use_case.dart';
import 'package:finmanageapp/features/home/domain/use_cases/register_expense_transaction_use_case.dart';
import 'package:finmanageapp/features/home/domain/use_cases/register_income_transaction_use_case.dart';
import 'package:finmanageapp/features/home/presentation/blocs/expenses_bloc/expenses_bloc.dart';
import 'package:finmanageapp/features/home/presentation/blocs/home_bloc/home_bloc.dart';
import 'package:finmanageapp/features/home/presentation/blocs/incomes_bloc/incomes_bloc.dart';
import 'package:get_it/get_it.dart';

import '../../features/auth/presentation/blocs/sign_up/sign_up_bloc.dart';

final ij = GetIt.instance;

void init() {
  // repositories
  ij.registerSingleton<AuthRepository>(AuthRepositoryImpl());
  ij.registerSingleton<CategoryRepository>(CategoryRepositoryImpl());
  ij.registerSingleton<DescriptionRepository>(
      DescriptionRepositoryImpl(ij<AuthRepository>()));
  ij.registerSingleton<TransactionRepository>(TransactionRepositoryImpl(
      ij<AuthRepository>(),
      ij<CategoryRepository>(),
      ij<DescriptionRepository>()));

  // use cases
  ij.registerSingleton(SignUpUseCase(ij<AuthRepository>()));
  ij.registerSingleton(SignInUseCase(ij<AuthRepository>()));
  ij.registerSingleton(GetExpenseCategoriesUseCase(ij<CategoryRepository>()));
  ij.registerSingleton(
      GetExpenseDescriptionsUseCase(ij<DescriptionRepository>()));
  ij.registerSingleton(GetIncomeCategoriesUseCase(ij<CategoryRepository>()));
  ij.registerSingleton(
      GetIncomeDescriptionsUseCase(ij<DescriptionRepository>()));
  ij.registerSingleton(
      RegisterExpenseTransactionUseCase(ij<TransactionRepository>()));
  ij.registerSingleton(
      RegisterIncomeTransactionUseCase(ij<TransactionRepository>()));
  ij.registerSingleton(GetCurrentUserUseCase(ij<AuthRepository>()));
  ij.registerSingleton(GetHomeStatsUseCase(ij<TransactionRepository>()));
  ij.registerSingleton(GetHomeTransactionsUseCase(ij<TransactionRepository>()));

  // blocs
  ij.registerSingleton(SignUpBloc(ij<SignUpUseCase>()));
  ij.registerSingleton(SignInBloc(ij<SignInUseCase>()));
  ij.registerSingleton(ExpensesBloc(
      ij<GetExpenseCategoriesUseCase>(),
      ij<GetExpenseDescriptionsUseCase>(),
      ij<RegisterExpenseTransactionUseCase>()));
  ij.registerSingleton(IncomesBloc(
      ij<GetIncomeCategoriesUseCase>(),
      ij<GetIncomeDescriptionsUseCase>(),
      ij<RegisterIncomeTransactionUseCase>()));
  ij.registerSingleton(HomeBloc(ij<GetCurrentUserUseCase>(),
      ij<GetHomeStatsUseCase>(), ij<GetHomeTransactionsUseCase>()));
}
