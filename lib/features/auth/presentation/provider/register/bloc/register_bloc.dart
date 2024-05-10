import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:kembang_belor_apps/features/auth/domain/entity/email.dart';
import 'package:kembang_belor_apps/features/auth/domain/entity/name.dart';
import 'package:kembang_belor_apps/features/auth/domain/entity/password.dart';
import 'package:kembang_belor_apps/features/auth/domain/entity/phone.dart';
import 'package:kembang_belor_apps/features/auth/domain/repository/i_authentication_repository.dart';

part 'register_event.dart';
part 'register_state.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  final IAuthenticationRepository _authenticationRepository;

  RegisterBloc(this._authenticationRepository) : super(const RegisterState()) {
    on<RegistrationRegisterButtonPressed>(_onRegistrationRegisterButtonPressed);
    on<RegistrationEmailAddressChanged>(_onEmailAddressChanged);
    on<RegistrationPasswordChanged>(_onPasswordChanged);
    on<RegistrationNameChanged>(_onNameChanged);
    on<RegistrationPhoneNumberChanged>(_onPhonNumberChanged);
  }

  Future<void> _onRegistrationRegisterButtonPressed(
    RegistrationRegisterButtonPressed event,
    Emitter<RegisterState> emit,
  ) async {
    if (!state.isValid) return;

    emit(state.copyWith(formSubmissionStatus: FormSubmissionStatus.submitting));

    try {
      await _authenticationRepository.signUpWithEmailAndPassword(
          email: state.email.value,
          password: state.password.value,
          name: state.name.value,
          phoneNumber: state.phoneNumber.value);

      emit(state.copyWith(formSubmissionStatus: FormSubmissionStatus.success));
    } catch (e) {
      emit(state.copyWith(formSubmissionStatus: FormSubmissionStatus.failure));
    }
  }

  Future<void> _onEmailAddressChanged(
    RegistrationEmailAddressChanged event,
    Emitter<RegisterState> emit,
  ) async =>
      emit(state.copyWith(
        email: EmailAddress.create(event.email),
        formSubmissionStatus: FormSubmissionStatus.initial,
      ));

  Future<void> _onPasswordChanged(
    RegistrationPasswordChanged event,
    Emitter<RegisterState> emit,
  ) async =>
      emit(state.copyWith(
        password: Password.create(event.password),
        formSubmissionStatus: FormSubmissionStatus.initial,
      ));

  Future<void> _onNameChanged(
    RegistrationNameChanged event,
    Emitter<RegisterState> emit,
  ) async =>
      emit(state.copyWith(
        name: Name.create(event.name),
        formSubmissionStatus: FormSubmissionStatus.initial,
      ));

  Future<void> _onPhonNumberChanged(
    RegistrationPhoneNumberChanged event,
    Emitter<RegisterState> emit,
  ) async =>
      emit(state.copyWith(
        phoneNumber: PhoneNumber.create(event.phoneNumber),
        formSubmissionStatus: FormSubmissionStatus.initial,
      ));
}
