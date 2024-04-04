import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:kembang_belor_apps/core/resources/data_state/data_state.dart';
import 'package:kembang_belor_apps/features/auth/domain/repository/login_repository.dart';
import 'package:kembang_belor_apps/features/auth/domain/usecases/login_usecase.dart';
import 'package:supabase/supabase.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final LoginUseCase _loginUseCase;

  LoginBloc(this._loginUseCase) : super(LoginInitialState()) {
    on<AppLoginRequested>((event, emit) async {
      try {
        final data = await _loginUseCase();
        emit(LoginSucces(response: data.data!));
      } catch (e) {
        LoginFailure(exception: e.toString());
      }
    });
  }
}
