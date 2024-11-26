import 'package:ai_connect/core/datasource/supabase_client.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class AuthService {
  final AppSupabaseClient supabaseClient;

  AuthService({required this.supabaseClient});

  Future<AuthResponse> signInWithIdToken({
    required String idToken,
    required OAuthProvider provider,
  }) async {
    return await supabaseClient.instance.auth.signInWithIdToken(
      idToken: idToken,
      provider: provider,
    );
  }

  Future<void> signInWithOtp({required String phone}) async {
    await supabaseClient.instance.auth.signInWithOtp(
      phone: phone,
      channel: OtpChannel.sms,
      shouldCreateUser: true,
    );
  }

  Future<AuthResponse> verifyOtp({
    required String phone,
    required String otp,
  }) async {
    return await supabaseClient.instance.auth.verifyOTP(
      phone: phone,
      token: otp,
      type: OtpType.sms,
    );
  }

  Future<void> signOut() async {
    return await supabaseClient.instance.auth.signOut();
  }
}
