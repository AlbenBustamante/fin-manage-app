part of 'config_bloc.dart';

sealed class ConfigState extends Equatable {
  const ConfigState();

  @override
  List<Object> get props => [];
}

final class ConfigInitial extends ConfigState {}

final class SignOutLoading extends ConfigState {}

final class SignOutSuccess extends ConfigState {}

final class Failure extends ConfigState {
  final String error;

  const Failure(this.error);

  @override
  List<Object> get props => [error];
}
