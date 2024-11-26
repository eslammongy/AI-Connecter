import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class AppSupabaseClient {
  static final AppSupabaseClient _singleton = AppSupabaseClient._internal();
  late final SupabaseClient instance;

  AppSupabaseClient._internal();

  factory AppSupabaseClient() {
    return _singleton;
  }

  /// Initialize the Supabase client. This should be called once during app startup.
  static Future<void> initialize() async {
    final baseUrl = dotenv.get('REST_APP_SUPABASE_URL');
    final apiKey = dotenv.get('REST_APP_SUPABASE_API_KEY');

    await Supabase.initialize(
      url: baseUrl,
      anonKey: apiKey,
    );
    _singleton.instance = Supabase.instance.client;
  }
}
