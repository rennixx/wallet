import 'package:flutter/foundation.dart' show kIsWeb;
import 'dart:html' as html;
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:wallet/core/ui/glass_container.dart';

class GlassAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final List<Widget>? actions;
  final bool automaticallyImplyLeading;
  final VoidCallback? onBackButtonPressed;
  final double blur;
  final double elevation;
  final double borderRadius;

  const GlassAppBar({
    super.key,
    required this.title,
    this.actions,
    this.automaticallyImplyLeading = true,
    this.onBackButtonPressed,
    this.blur = 24,
    this.elevation = 0,
    this.borderRadius = 0,
  });

  @override
  Widget build(BuildContext context) {
    final leading =
        automaticallyImplyLeading
            ? IconButton(
              icon: const Icon(
                Icons.arrow_back_ios_new_rounded,
                color: Colors.white,
                size: 22,
              ),
              onPressed:
                  onBackButtonPressed ??
                  () async {
                    bool popped = false;
                    try {
                      context.pop();
                      popped = true;
                    } catch (_) {}
                    if (!popped) {
                      try {
                        popped = await Navigator.of(context).maybePop();
                      } catch (_) {}
                    }
                    // Web fallback: use browser history
                    if (!popped && kIsWeb) {
                      try {
                        html.window.history.back();
                      } catch (_) {}
                    }
                  },
              splashRadius: 22,
            )
            : null;
    return Stack(
      children: [
        GlassContainer(
          borderRadius: borderRadius,
          blur: blur,
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Colors.white.withOpacity(0.18),
              Colors.white.withOpacity(0.09),
            ],
          ),
          border: Border(
            bottom: BorderSide(
              color: Colors.white.withOpacity(0.10),
              width: 1.5,
            ),
          ),
          child: const SizedBox.expand(),
        ),
        AppBar(
          backgroundColor: Colors.transparent,
          elevation: elevation,
          title: Text(
            title,
            style: Theme.of(context).textTheme.titleLarge?.copyWith(
              color: Colors.white,
              fontWeight: FontWeight.w700,
              letterSpacing: 0.2,
            ),
          ),
          centerTitle: true,
          actions: actions,
          leading: leading,
          automaticallyImplyLeading: false,
          iconTheme: const IconThemeData(color: Colors.white),
          titleSpacing: 0,
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
