import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:kembang_belor_apps/features/auth/domain/entity/email.dart';
import 'package:kembang_belor_apps/features/auth/domain/entity/password.dart';
import 'package:kembang_belor_apps/features/auth/domain/repository/i_authentication_repository.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final IAuthenticationRepository _authenticationRepository;
  LoginBloc(this._authenticationRepository) : super(const LoginState()) {
    on<LoginEmailAddressChanged>(_onEmailAddressChanged);
    on<LoginPasswordChanged>(_onPasswordChanged);
    on<LoginButtonPressed>(_onLoginButtonPressed);
    on<GoogleButtonPressed>(_onGoogleSignIn);
    on<ResetPasswordPressed>(_onEmailResetSend);
  }

  Future<void> _onLoginButtonPressed(
    LoginButtonPressed event,
    Emitter<LoginState> emit,
  ) async {
    if (!state.isValid) return;

    emit(state.copyWith(formSubmissionStatus: FormSubmissionStatus.submitting));

    try {
      await _authenticationRepository.signInWithEmailAndPassword(
        email: state.email.value,
        password: state.password.value,
      );
      emit(state.copyWith(formSubmissionStatus: FormSubmissionStatus.success));
    } on AuthException catch (e) {
      log('${e.statusCode}');
      emit(state.copyWith(formSubmissionStatus: FormSubmissionStatus.failure));
    }
  }

  Future<void> _onEmailAddressChanged(
    LoginEmailAddressChanged event,
    Emitter<LoginState> emit,
  ) async =>
      emit(state.copyWith(
        email: EmailAddress.create(event.email),
        formSubmissionStatus: FormSubmissionStatus.initial,
      ));

  Future<void> _onPasswordChanged(
    LoginPasswordChanged event,
    Emitter<LoginState> emit,
  ) async =>
      emit(state.copyWith(
        password: Password.create(event.password),
        formSubmissionStatus: FormSubmissionStatus.initial,
      ));

  Future<void> _onGoogleSignIn(
    GoogleButtonPressed event,
    Emitter<LoginState> emit,
  ) async {
    try {
      await _authenticationRepository.signInWithGoogle();

      emit(state.copyWith(formSubmissionStatus: FormSubmissionStatus.success));
    } catch (e) {
      log(e.toString());
      emit(state.copyWith(formSubmissionStatus: FormSubmissionStatus.failure));
    }
  }

  Future<void> _onEmailResetSend(
      ResetPasswordPressed event, Emitter<LoginState> emit) async {
    try {
      await _authenticationRepository.sendResetPassword(email: event.email);

      emit(state.copyWith(formSubmissionStatus: FormSubmissionStatus.success));
    } catch (e) {
      log(e.toString());
      emit(state.copyWith(formSubmissionStatus: FormSubmissionStatus.failure));
    }
  }
}
