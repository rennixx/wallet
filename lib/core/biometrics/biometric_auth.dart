import 'package:local_auth/local_auth.dart';

/// Biometric authentication integration using local_auth.
class BiometricAuth {
  static final LocalAuthentication _auth = LocalAuthentication();

  /// Returns true if authentication succeeds.
  static Future<bool> authenticate() async {
    final canCheck = await _auth.canCheckBiometrics;
    if (!canCheck) return false;
    try {
      return await _auth.authenticate(
        localizedReason: 'Authenticate to access your wallet',
        options: const AuthenticationOptions(biometricOnly: true),
      );
    } catch (_) {
      return false;
    }
  }
}
