import 'dart:async';
import 'package:flutter/widgets.dart';

/// SessionManager handles session timeout and auto-lock for the wallet app.
class SessionManager with WidgetsBindingObserver {
  static final SessionManager _instance = SessionManager._internal();
  factory SessionManager() => _instance;
  SessionManager._internal();

  Duration timeout = const Duration(minutes: 5);
  Timer? _timer;
  VoidCallback? onSessionTimeout;

  void start() {
    WidgetsBinding.instance.addObserver(this);
    _resetTimer();
  }

  void stop() {
    WidgetsBinding.instance.removeObserver(this);
    _timer?.cancel();
  }

  void userActivity() => _resetTimer();

  void _resetTimer() {
    _timer?.cancel();
    _timer = Timer(timeout, _handleTimeout);
  }

  void _handleTimeout() {
    onSessionTimeout?.call();
    // Lock the app, show authentication screen, etc.
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.paused) {
      _timer?.cancel();
    } else if (state == AppLifecycleState.resumed) {
      _resetTimer();
    }
  }
}
