part of 'sign_up_bloc.dart';

sealed class SignUpEvent extends Equatable {
  const SignUpEvent();

  @override
  List<Object> get props => [];
}

final class OnSubmit extends SignUpEvent {
  final SignUpParams params;

  const OnSubmit(this.params);

  @override
  List<Object> get props => [params];
}
