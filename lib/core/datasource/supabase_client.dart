import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class AppSupabaseClient {
  static final AppSupabaseClient _singleton = AppSupabaseClient._internal();
  late final SupabaseClient instance;

  AppSupabaseClient._internal() {
    _initialize();
  }

  factory AppSupabaseClient() {
    return _singleton;
  }

  /// Initialize the Supabase client. This should be called once during app startup.
  Future<void> _initialize() async {
    final baseUrl = dotenv.get('REST_APP_SUPABASE_URL');
    final apiKey = dotenv.get('REST_APP_SUPABASE_API_KEY');

    final supabaseClient = await Supabase.initialize(
      url: baseUrl,
      anonKey: apiKey,
    );
    instance = supabaseClient.client;
  }

  /// Reconnect to Supabase client with retry logic
  Future<void> reconnect({
    int maxRetries = 5,
    Duration initialDelay = const Duration(seconds: 2),
    double backoffFactor = 2.0,
  }) async {
    int attempt = 0;
    Duration delay = initialDelay;

    while (attempt < maxRetries) {
      try {
        // Attempt reconnection
        debugPrint('Attempt ${attempt + 1}: Reconnecting to Supabase...');
        // Add Supabase-specific reconnection logic if necessary
        // For instance, validate a session token or refresh it

        await _initialize();

        debugPrint('Supabase reconnected successfully.');
        return; // Exit loop on successful reconnection
      } catch (error) {
        attempt++;
        if (attempt >= maxRetries) {
          debugPrint('Failed to reconnect after $maxRetries attempts: $error');
          return; // Exit on max retries
        }

        debugPrint(
            'Reconnection failed: $error. Retrying in ${delay.inSeconds} seconds...');
        await Future.delayed(delay);
        delay = Duration(
            milliseconds: (delay.inMilliseconds * backoffFactor).toInt());
      }
    }
  }
}
