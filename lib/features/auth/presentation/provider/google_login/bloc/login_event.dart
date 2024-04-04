part of 'login_bloc.dart';

sealed class LoginEvent extends Equatable {
  @override
  List<Object> get props => [];
}

final class AppLogoutRequested extends LoginEvent {}

final class AppLoginRequested extends LoginEvent {}
