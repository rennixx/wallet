import 'package:go_router/go_router.dart';
import 'package:flutter/material.dart';

final GoRouter appRouter = GoRouter(
  routes: <RouteBase>[
    GoRoute(
      path: '/',
      builder: (BuildContext context, GoRouterState state) {
        return const Placeholder(); // TODO: Replace with actual splash screen or home page
      },
    ),
    // TODO: Add more routes here as features are developed
  ],
);
