import 'package:flutter/material.dart';

/// Slides the sheet up once when the page opens.
class SheetEntrance extends StatelessWidget {
  const SheetEntrance({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    if (MediaQuery.disableAnimationsOf(context)) return child;

    return TweenAnimationBuilder<double>(
      tween: Tween(begin: 1, end: 0),
      duration: const Duration(milliseconds: 520),
      curve: Curves.easeOutCubic,
      builder: (context, t, child) =>
          Transform.translate(offset: Offset(0, 80 * t), child: child),
      child: child,
    );
  }
}
