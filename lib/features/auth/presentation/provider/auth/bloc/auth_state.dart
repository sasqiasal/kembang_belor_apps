part of 'auth_bloc.dart';

sealed class AuthStates extends Equatable {
  const AuthStates();

  @override
  List<Object> get props => [];
}

class AuthInitial extends AuthStates {}

class AuthUserAuthenticated extends AuthStates {
  final User user;

  const AuthUserAuthenticated(this.user);
}

class AuthUserUnauthenticated extends AuthStates {}
