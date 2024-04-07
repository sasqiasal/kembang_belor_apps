part of 'login_bloc.dart';

sealed class LoginEvent extends Equatable {
  const LoginEvent();

  @override
  List<Object> get props => [];
}

final class LoginEmailAddressChanged extends LoginEvent {
  final String email;

  const LoginEmailAddressChanged({required this.email});
}

final class LoginPasswordChanged extends LoginEvent {
  final String password;

  const LoginPasswordChanged({required this.password});
}

final class LoginButtonPressed extends LoginEvent {}

final class GoogleButtonPressed extends LoginEvent {}
