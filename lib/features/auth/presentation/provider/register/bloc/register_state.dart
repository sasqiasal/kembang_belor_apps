part of 'register_bloc.dart';

enum FormSubmissionStatus {
  initial,
  submitting,
  success,
  failure,
}

class RegisterState extends Equatable {
  final EmailAddress email;
  final Password password;
  final PhoneNumber phoneNumber;
  final Name name;
  final FormSubmissionStatus formSubmissionStatus;
  const RegisterState({
    this.email = EmailAddress.empty,
    this.password = Password.empty,
    this.phoneNumber = PhoneNumber.empty,
    this.name = Name.empty,
    this.formSubmissionStatus = FormSubmissionStatus.initial,
  });

  RegisterState copyWith({
    EmailAddress? email,
    Password? password,
    Name? name,
    PhoneNumber? phoneNumber,
    FormSubmissionStatus? formSubmissionStatus,
  }) =>
      RegisterState(
        email: email ?? this.email,
        password: password ?? this.password,
        name: name ?? this.name,
        phoneNumber: phoneNumber ?? this.phoneNumber,
        formSubmissionStatus: formSubmissionStatus ?? this.formSubmissionStatus,
      );

  @override
  List<Object?> get props => [
        name,
        email,
        password,
        phoneNumber,
        formSubmissionStatus,
      ];

  bool isSubmitting() =>
      formSubmissionStatus == FormSubmissionStatus.submitting;

  bool isSubmissionSuccessOrFailure() =>
      formSubmissionStatus == FormSubmissionStatus.success ||
      formSubmissionStatus == FormSubmissionStatus.failure;

  bool get isValid =>
      !email.hasError &&
      !password.hasError &&
      !phoneNumber.hasError &&
      !name.hasError;
}

final class RegisterInitial extends RegisterState {}
