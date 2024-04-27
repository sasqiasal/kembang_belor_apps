part of 'register_bloc.dart';

sealed class RegisterEvent extends Equatable {
  const RegisterEvent();

  @override
  List<Object> get props => [];
}

final class RegistrationEmailAddressChanged extends RegisterEvent {
  final String email;

  const RegistrationEmailAddressChanged(this.email);
}

final class RegistrationPasswordChanged extends RegisterEvent {
  final String password;

  const RegistrationPasswordChanged(this.password);
}

final class RegistrationNameChanged extends RegisterEvent {
  final String name;

  const RegistrationNameChanged(this.name);
}

final class RegistrationPhoneNumberChanged extends RegisterEvent {
  final String phoneNumber;

  const RegistrationPhoneNumberChanged(this.phoneNumber);
}

final class RegistrationRegisterButtonPressed extends RegisterEvent {}
