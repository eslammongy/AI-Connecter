import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class AppSupabaseClient {
  static final AppSupabaseClient _singleton = AppSupabaseClient._internal();
  late final SupabaseClient _instance;

  AppSupabaseClient._internal();

  factory AppSupabaseClient() {
    return _singleton;
  }

  /// Initialize the Supabase client. This should be called once during app startup.
  static Future<void> initialize() async {
    await dotenv.load(fileName: ".env");
    final baseUrl = dotenv.get('REST_APP_SUPABASE_URL');
    final apiKey = dotenv.get('REST_APP_SUPABASE_API_KEY');

    await Supabase.initialize(
      url: baseUrl,
      anonKey: apiKey,
    );
    _singleton._instance = Supabase.instance.client;
  }

  Future<AuthResponse> signInWithIdToken({
    required String idToken,
    required OAuthProvider provider,
  }) async {
    return await _instance.auth.signInWithIdToken(
      idToken: idToken,
      provider: provider,
    );
  }

  Future<void> signInWithOtp({required String phone}) async {
    await _instance.auth.signInWithOtp(phone: phone, channel: OtpChannel.sms);
  }

  Future<AuthResponse> verifyOtp({
    required String phone,
    required String otp,
  }) async {
    return await _instance.auth.verifyOTP(
      phone: phone,
      token: otp,
      type: OtpType.sms,
    );
  }
}
