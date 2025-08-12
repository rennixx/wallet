import 'package:flutter/material.dart';
import 'package:wallet/core/biometrics/biometric_auth.dart';
import 'package:wallet/core/security/emergency_lock.dart';
import 'package:wallet/core/security/suspicious_activity_detector.dart';

/// LockScreen prompts for biometric authentication to unlock the app.
class LockScreen extends StatefulWidget {
  final VoidCallback onUnlock;
  const LockScreen({super.key, required this.onUnlock});

  @override
  State<LockScreen> createState() => _LockScreenState();
}

class _LockScreenState extends State<LockScreen> {
  String? _error;
  bool _loading = false;

  Future<void> _authenticate() async {
    setState(() {
      _loading = true;
      _error = null;
    });
    final success = await BiometricAuth.authenticate();
    setState(() {
      _loading = false;
    });
    if (success) {
      EmergencyLock.unlock();
      widget.onUnlock();
    } else {
      setState(() {
        _error = 'Authentication failed';
      });
      await SuspiciousActivityDetector.log(
        'failed_biometric',
        details: 'User failed biometric unlock',
      );
    }
  }

  @override
  void initState() {
    super.initState();
    _authenticate();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child:
            _loading
                ? const CircularProgressIndicator()
                : Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(Icons.lock, size: 64),
                    const SizedBox(height: 16),
                    const Text('App Locked', style: TextStyle(fontSize: 24)),
                    if (_error != null) ...[
                      const SizedBox(height: 8),
                      Text(_error!, style: const TextStyle(color: Colors.red)),
                    ],
                    const SizedBox(height: 24),
                    ElevatedButton(
                      onPressed: _authenticate,
                      child: const Text('Unlock'),
                    ),
                  ],
                ),
      ),
    );
  }
}
