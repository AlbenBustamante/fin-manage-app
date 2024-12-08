import 'package:finmanageapp/features/auth/data/repository/auth_repository_impl.dart';
import 'package:finmanageapp/features/auth/domain/repository/auth_repository.dart';
import 'package:finmanageapp/features/auth/domain/use_cases/sign_up_use_case.dart';
import 'package:get_it/get_it.dart';

import '../../features/auth/presentation/blocs/sign_up/sign_up_bloc.dart';

final ij = GetIt.instance;

void init() {
  // repositories
  ij.registerSingleton<AuthRepository>(AuthRepositoryImpl());

  // use cases
  ij.registerSingleton<SignUpUseCase>(SignUpUseCase(ij<AuthRepository>()));

  // blocs
  ij.registerSingleton<SignUpBloc>(SignUpBloc(ij<SignUpUseCase>()));
}
