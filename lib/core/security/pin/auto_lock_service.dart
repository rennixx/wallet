import 'dart:async';

/// Auto-lock service for locking app after inactivity.
class AutoLockService {
  Timer? _timer;
  final Duration timeout;
  final void Function() onLock;

  AutoLockService({required this.timeout, required this.onLock});

  void startTimer() {
    _timer?.cancel();
    _timer = Timer(timeout, onLock);
  }

  void resetTimer() {
    startTimer();
  }

  void cancel() {
    _timer?.cancel();
  }
}
