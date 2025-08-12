import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import '../network/supabase_client.dart';

/// Global provider for Supabase client
final supabaseProvider = Provider<SupabaseClient>((ref) {
  return SupabaseClientProvider().client;
});

// Add other global providers here as needed
