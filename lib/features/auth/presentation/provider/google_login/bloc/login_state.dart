part of 'login_bloc.dart';

sealed class LoginState extends Equatable {
  const LoginState();
  @override
  List<Object?> get props => [];
}

final class LoginInitialState extends LoginState {}

final class LoginSucces extends LoginState {
  final AuthResponse response;

  const LoginSucces({required this.response});
}

final class LoginFailure extends LoginState {
  final String exception;

  const LoginFailure({required this.exception});
}
