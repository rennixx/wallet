import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'core/network/supabase_client.dart';
import 'core/providers/global_providers.dart';
import 'core/theme/app_theme.dart';
import 'core/navigation/app_router.dart';
import 'core/security/session_manager.dart';
import 'core/security/emergency_lock.dart';
import 'core/security/lock_screen.dart';

/// Entry point for the Wallet App.
/// Initializes environment variables and Supabase client, then runs the app.
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load();
  // Initialize session manager and emergency lock
  final sessionManager = SessionManager();
  sessionManager.onSessionTimeout = () => EmergencyLock.trigger();
  sessionManager.start();
  // SupabaseClientProvider initializes itself on first use
  runApp(const ProviderScope(child: MyApp()));
}

/// The root widget for the Wallet App.
class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool _locked = EmergencyLock.isLocked;

  @override
  void initState() {
    super.initState();
    EmergencyLock.onLock = () {
      setState(() => _locked = true);
    };
  }

  void _onUnlock() {
    setState(() => _locked = false);
  }

  @override
  Widget build(BuildContext context) {
    if (_locked) {
      return MaterialApp(
        home: LockScreen(onUnlock: _onUnlock),
        debugShowCheckedModeBanner: false,
      );
    }
    return MaterialApp.router(
      title: 'Wallet App',
      theme: appTheme,
      darkTheme: appDarkTheme,
      themeMode: ThemeMode.system,
      routerConfig: appRouter,
      debugShowCheckedModeBanner: false,
    );
  }
}
