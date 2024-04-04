part of 'login_bloc.dart';

sealed class LoginState extends Equatable {
  @override
  List<Object?> get props => [];
}

final class AppLogoutRequested extends LoginState {}

final class _AppUserChanged extends LoginState {
  _AppUserChanged(this.user);
  final AuthResponse user;
}
