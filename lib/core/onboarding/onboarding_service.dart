import 'package:hive/hive.dart';

/// Service for onboarding flow and first-time user experience.
class OnboardingService {
  static const _onboardingBox = 'onboarding';
  static const _completeKey = 'complete';

  /// Check if onboarding is complete
  static Future<bool> isOnboardingComplete() async {
    final box = await Hive.openBox(_onboardingBox);
    return box.get(_completeKey, defaultValue: false) as bool;
  }

  /// Mark onboarding as complete
  static Future<void> completeOnboarding() async {
    final box = await Hive.openBox(_onboardingBox);
    await box.put(_completeKey, true);
  }
}
