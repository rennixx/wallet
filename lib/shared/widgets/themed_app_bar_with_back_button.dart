import 'package:flutter/material.dart';
import 'package:wallet/core/ui/glass_app_bar.dart';

class ThemedAppBarWithBackButton extends StatelessWidget
    implements PreferredSizeWidget {
  final String title;
  final List<Widget>? actions;
  final VoidCallback? onBackButtonPressed;

  const ThemedAppBarWithBackButton({
    super.key,
    required this.title,
    this.actions,
    this.onBackButtonPressed,
  });

  @override
  Widget build(BuildContext context) {
    return GlassAppBar(
      title: title,
      actions: actions,
      automaticallyImplyLeading: true,
      onBackButtonPressed: onBackButtonPressed,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
