part of 'login_bloc.dart';

sealed class LoginEvent extends Equatable {
  final AuthResponse authResponse;
  const LoginEvent(this.authResponse);

  @override
  List<Object> get props => [authResponse];
}

final class AuthLogin extends LoginEvent {
  AuthLogin(super.authResponse);
  
}