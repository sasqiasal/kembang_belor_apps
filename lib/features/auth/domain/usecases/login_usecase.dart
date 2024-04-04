import 'package:kembang_belor_apps/core/resources/data_state/data_state.dart';
import 'package:kembang_belor_apps/core/usecase/use_case.dart';
import 'package:kembang_belor_apps/features/auth/domain/repository/login_repository.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class LoginUseCase implements UseCase<DataState<AuthResponse>, void> {
  final LoginRepository _repository;

  LoginUseCase(this._repository);
  @override
  Future<DataState<AuthResponse>> call({void params}) {
    return _repository.loginWithGoogle();
  }
}
