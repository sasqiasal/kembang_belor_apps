import 'package:google_sign_in/google_sign_in.dart';
import 'package:injectable/injectable.dart';
import 'package:kembang_belor_apps/features/auth/domain/repository/i_authentication_repository.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

@Injectable(as: IAuthenticationRepository)
class AuthenticationRepository implements IAuthenticationRepository {
  final GoTrueClient _supabaseAuth;
  static const String _redirectUrl =
      'https://ktcdelnorjxtdrtvogra.supabase.co/auth/v1/callback';

  AuthenticationRepository(this._supabaseAuth);

  @override
  Future<void> signInWithEmailAndPassword({
    required String email,
    required String password,
  }) async =>
      await _supabaseAuth.signInWithPassword(password: password, email: email);

  @override
  Future<void> signUpWithEmailAndPassword(
          {required String email,
          required String password,
          required String name,
          required String phoneNumber}) async =>
      await _supabaseAuth.signUp(
          password: password,
          email: email,
          emailRedirectTo: _redirectUrl,
          data: {'name': name, 'phone': phoneNumber, 'role': 'user'});

  @override
  Future<void> signOut() async => await _supabaseAuth.signOut();

  @override
  Stream<User?> getCurrentUser() =>
      _supabaseAuth.onAuthStateChange.map((event) => event.session?.user);

  @override
  User? getSignedInUser() => _supabaseAuth.currentUser;

  @override
  Future<AuthResponse> signInWithGoogle() async {
    const webClientId =
        '889220975978-vq73gn5th55jqufbq275p52j2d00gess.apps.googleusercontent.com';

    const iosClientId =
        '889220975978-1mj68l18nvl6en96nkk3einkmkg7n8fp.apps.googleusercontent.com';

    // Google sign in on Android will work without providing the Android
    // Client ID registered on Google Cloud.

    final GoogleSignIn googleSignIn = GoogleSignIn(
      clientId: iosClientId,
      serverClientId: webClientId,
    );
    final googleUser = await googleSignIn.signIn();
    final googleAuth = await googleUser!.authentication;
    final accessToken = googleAuth.accessToken;
    final idToken = googleAuth.idToken;

    if (accessToken == null) {
      throw 'No Access Token found.';
    }
    if (idToken == null) {
      throw 'No ID Token found.';
    }

    return _supabaseAuth.signInWithIdToken(
      provider: OAuthProvider.google,
      idToken: idToken,
      accessToken: accessToken,
    );
  }
}
