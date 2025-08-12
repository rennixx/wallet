import 'package:flutter/material.dart';
import 'package:wallet/core/ui/glass_app_bar.dart';

class AppBarWidget extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final List<Widget>? actions;
  final bool automaticallyImplyLeading;

  const AppBarWidget({
    super.key,
    required this.title,
    this.actions,
    this.automaticallyImplyLeading = true,
  });

  @override
  Widget build(BuildContext context) {
    return GlassAppBar(
      title: title,
      actions: actions,
      automaticallyImplyLeading: automaticallyImplyLeading,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
