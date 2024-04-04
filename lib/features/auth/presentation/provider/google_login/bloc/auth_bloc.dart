import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:kembang_belor_apps/features/auth/domain/repository/i_authentication_repository.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final IAuthenticationRepository _authenticationRepository;
  StreamSubscription<User?>? _userSubscription;

  AuthBloc(this._authenticationRepository) : super(AuthInitial()) {
    on<AuthEvent>((event, emit) {});

    _startUserSubscription();
  }

  void _startUserSubscription() => _userSubscription =
          _authenticationRepository.getCurrentUser().listen((user) {
        add(AuthOnCurrentUserChanged(user));
      });
}
