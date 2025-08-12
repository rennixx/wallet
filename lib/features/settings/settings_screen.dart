import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:wallet/core/settings/settings_service.dart';
import 'package:wallet/core/security/session_manager.dart';
import 'package:wallet/core/ui/glass_container.dart';
import 'package:wallet/core/ui/glass_app_bar.dart';

/// Comprehensive settings screen for all user preferences.
class SettingsScreen extends ConsumerStatefulWidget {
  const SettingsScreen({super.key});

  @override
  ConsumerState<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends ConsumerState<SettingsScreen> {
  bool _biometrics = false;
  bool _notifications = false;
  bool _darkMode = false;
  int _autoLockMinutes = 5;

  @override
  void initState() {
    super.initState();
    _loadSettings();
  }

  Future<void> _loadSettings() async {
    _biometrics = await SettingsService.getSetting('biometrics') ?? false;
    _notifications = await SettingsService.getSetting('notifications') ?? false;
    _darkMode = await SettingsService.getSetting('darkMode') ?? false;
    _autoLockMinutes = await SettingsService.getSetting('autoLockMinutes') ?? 5;
    setState(() {});
  }

  Future<void> _saveSetting(String key, dynamic value) async {
    setState(() {
      if (key == 'biometrics') _biometrics = value as bool;
      if (key == 'notifications') _notifications = value as bool;
      if (key == 'darkMode') _darkMode = value as bool;
      if (key == 'autoLockMinutes') _autoLockMinutes = value as int;
    });
    await SettingsService.setSetting(key, value);

    // Wire up settings to app behavior
    if (key == 'autoLockMinutes') {
      // Update session timeout
      final sessionManager = SessionManager();
      sessionManager.timeout = Duration(minutes: value as int);
      sessionManager.userActivity(); // reset timer
    }
    // For biometrics, the lock screen will check the setting when shown
    // For dark mode, you would need to use a theme provider (not shown here)
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: GlassAppBar(
        title: 'Settings',
        borderRadius: 0,
        onBackButtonPressed: () {
          if (context.canPop()) {
            context.pop();
          } else {
            Navigator.of(context).maybePop();
          }
        },
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: GlassContainer(
              borderRadius: 24,
              blur: 24,
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  Colors.white.withOpacity(0.08),
                  Colors.white.withOpacity(0.03),
                ],
              ),
              padding: const EdgeInsets.all(24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Settings',
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),
                  const SizedBox(height: 24),
                  _buildSwitch(
                    title: 'Enable Biometrics',
                    value: _biometrics,
                    onChanged: (v) => _saveSetting('biometrics', v),
                  ),
                  const SizedBox(height: 16),
                  _buildSwitch(
                    title: 'Enable Notifications',
                    value: _notifications,
                    onChanged: (v) => _saveSetting('notifications', v),
                  ),
                  const SizedBox(height: 16),
                  _buildSwitch(
                    title: 'Dark Mode',
                    value: _darkMode,
                    onChanged: (v) => _saveSetting('darkMode', v),
                  ),
                  const SizedBox(height: 24),
                  _buildDropdown(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildSwitch({
    required String title,
    required bool value,
    required ValueChanged<bool> onChanged,
  }) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(title, style: Theme.of(context).textTheme.bodyLarge),
        Switch(
          value: value,
          onChanged: onChanged,
          activeColor: const Color(0xFFE8E8E8),
          inactiveTrackColor: Colors.white.withOpacity(0.15),
        ),
      ],
    );
  }

  Widget _buildDropdown() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Auto-lock Timeout',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w600,
              ),
            ),
            Text(
              '$_autoLockMinutes minutes',
              style: const TextStyle(color: Color(0xFFB0B0B0)),
            ),
          ],
        ),
        DropdownButton<int>(
          value: _autoLockMinutes,
          dropdownColor: const Color(0xFF1A1A1A),
          style: const TextStyle(color: Colors.white),
          borderRadius: BorderRadius.circular(16),
          items:
              [1, 5, 10, 30]
                  .map((m) => DropdownMenuItem(value: m, child: Text('$m min')))
                  .toList(),
          onChanged: (v) {
            if (v != null) _saveSetting('autoLockMinutes', v);
          },
        ),
      ],
    );
  }
}
