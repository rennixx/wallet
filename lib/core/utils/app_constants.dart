class AppConstants {
  // App
  static const String appName = 'Wallet App';

  // Supabase
  static const String supabaseUrl =
      'YOUR_SUPABASE_URL'; // Replace with your Supabase URL
  static const String supabaseAnonKey =
      'YOUR_SUPABASE_ANON_KEY'; // Replace with your Supabase Anon Key

  // Auth
  static const String emailRegex =
      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+";
  static const int minPasswordLength = 8;

  // UI
  static const double defaultPadding = 16.0;
  static const double defaultBorderRadius = 8.0;

  // Database Table Names
  static const String usersTable = 'users';
  static const String transactionsTable = 'transactions';
  static const String accountsTable = 'accounts';

  // Other
  static const int splashScreenDuration = 2; // seconds
}
