import 'package:kembang_belor_apps/core/resources/data_state/data_state.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

abstract class LoginRepository {
  Future<DataState<AuthResponse>> loginWithGoogle();
}
