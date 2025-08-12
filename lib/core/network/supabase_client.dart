import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

/// Provides a singleton instance of the Supabase client, initialized with environment variables.
class SupabaseClientProvider {
  static final SupabaseClientProvider _instance =
      SupabaseClientProvider._internal();
  late final SupabaseClient client;

  factory SupabaseClientProvider() {
    return _instance;
  }

  SupabaseClientProvider._internal() {
    final supabaseUrl = dotenv.env['SUPABASE_URL'] ?? '';
    final supabaseAnonKey = dotenv.env['SUPABASE_ANON_KEY'] ?? '';
    client = SupabaseClient(supabaseUrl, supabaseAnonKey);
  }
}
