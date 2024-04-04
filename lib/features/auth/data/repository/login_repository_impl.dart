import 'package:kembang_belor_apps/core/resources/data_state/data_state.dart';
import 'package:kembang_belor_apps/features/auth/data/data_source/login/login_data_source.dart';
import 'package:kembang_belor_apps/features/auth/domain/repository/login_repository.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class LoginRepositoryImpl implements LoginRepository {
  final LoginDataSource _loginDataSource;

  LoginRepositoryImpl(this._loginDataSource);

  @override
  Future<DataState<AuthResponse>> loginWithGoogle() async {
    try {
      final dataLogin = await _loginDataSource.googleSignIn();
      return DataSuccess(dataLogin);
    } catch (e) {
      return DataFailed(e.toString());
    }
  }
}
