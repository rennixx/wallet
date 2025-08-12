import 'package:go_router/go_router.dart';
import 'package:flutter/material.dart';
import 'package:wallet/features/card/presentation/screens/card_list_screen.dart';
import 'package:wallet/features/settings/settings_screen.dart';

/// Main app router using GoRouter with type-safe routes.
final GoRouter appRouter = GoRouter(
  routes: <GoRoute>[
    GoRoute(path: '/', builder: (context, state) => const CardListScreen()),
    GoRoute(
      path: '/settings',
      builder: (context, state) => const SettingsScreen(),
    ),
    // Add more routes here as needed
  ],
);
