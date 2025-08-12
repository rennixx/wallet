/// Certificate pinning utility for Supabase connections.
///
/// Note: Supabase uses its own HTTP client. To enable certificate pinning,
/// you must configure it at the platform level or by customizing the HTTP transport.
///
/// Android: Use network_security_config.xml to specify pinned certificates.
/// iOS: Use ATS (App Transport Security) and add SecTrustEvaluate logic in Swift.
///
/// See README or documentation for detailed steps.
class CertificatePinning {
  /// Call this at app startup to enforce pinning (no-op in Dart, platform-specific).
  static Future<void> enforce() async {
    // Optionally, use MethodChannel to invoke platform-specific pinning logic.
    // For advanced use, customize the Supabase HTTP client (not directly supported).
  }
}
