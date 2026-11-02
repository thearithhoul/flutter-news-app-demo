import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:news_custom_mobile_app/features/news/pages/providers/nav_bar_provider.dart';

class NavBarWidget extends StatelessWidget {
  const NavBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final selectedIndex = navBarPaths
        .indexOf(GoRouterState.of(context).matchedLocation)
        .clamp(0, navBarPaths.length - 1);

    final navIcons = navBarIcons;
    return ClipRRect(
      borderRadius: BorderRadius.circular(40),

      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 20, sigmaY: 20),
        child: Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: Colors.white.withValues(alpha: 0.35),
            borderRadius: BorderRadius.circular(40),
            border: Border.all(color: Colors.white.withValues(alpha: 0.6)),
            boxShadow: [
              BoxShadow(
                color: Colors.black12,

                blurRadius: 20,
                offset: Offset(0, 8),
              ),
            ],
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              for (var i = 0; i < navIcons.length; i++)
                _nevItmesWidget(
                  icon: navIcons[i],
                  isSelected: i == selectedIndex,
                  onTap: () => context.go(navBarPaths[i]),
                ),
            ],
          ),
        ),
      ),
    );
  }
}

Widget _nevItmesWidget({
  required IconData icon,
  required bool isSelected,
  required VoidCallback onTap,
}) {
  return GestureDetector(
    onTap: onTap,
    behavior: HitTestBehavior.opaque,
    child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: TweenAnimationBuilder<double>(
        tween: Tween(end: isSelected ? 1.0 : 0.0),
        duration: const Duration(milliseconds: 350),
        curve: Curves.easeOutCubic,
        builder: (context, t, child) {
          return DualShadowCircle(
            blur: lerpDouble(0, 34, t)!,
            offset: lerpDouble(0, 10, t)!,
            opacity: lerpDouble(0.6, 0.23, t)!,
            innerColor: Colors.black,
            outerColor: Colors.white,
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                for (final c in _selectedColors)
                  Color.lerp(Colors.white, c, t)!,
              ],
              stops: const [0.0, 0.3, 0.75, 1.0],
            ),
            // Icon grows while the margin shrinks, so the circle keeps its size.
            child: Container(
              margin: EdgeInsets.all(lerpDouble(14, 12, t)!),
              child: Transform.translate(
                offset: Offset(0, lerpDouble(0, -2, t)!),
                child: Icon(
                  icon,
                  size: lerpDouble(34, 34, t),
                  color: isSelected ? Colors.white : Colors.black,
                ),
              ),
            ),
          );
        },
      ),
    ),
  );
}

const _selectedColors = [
  Colors.green,
  Color(0xffA5D6A7),
  Color.fromARGB(194, 255, 255, 255),
  Colors.white,
];

class DualShadowCircle extends StatelessWidget {
  const DualShadowCircle({
    super.key,

    this.blur = 24,
    this.offset = 14,
    this.gradient = const LinearGradient(
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
      colors: [Color(0xFFFF9A8B), Color(0xFF6A82FB)],
    ),
    this.innerColor = const Color(0xFF5028A0),
    this.outerColor = const Color(0xFFFF7864),
    this.opacity = 0.55,
    this.child = const SizedBox(),
  });
  final Widget child;
  final double blur, offset, opacity;
  final Gradient gradient;
  final Color innerColor, outerColor;

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      // size: Size.square(size),
      painter: _DualShadowPainter(
        blur: blur,
        offset: offset,
        gradient: gradient,
        innerColor: innerColor.withValues(alpha: opacity),
        outerColor: outerColor.withValues(alpha: opacity),
      ),
      child: child,
    );
  }
}

class _DualShadowPainter extends CustomPainter {
  _DualShadowPainter({
    required this.blur,
    required this.offset,
    required this.gradient,
    required this.innerColor,
    required this.outerColor,
  });

  final double blur, offset;
  final Gradient gradient;
  final Color innerColor, outerColor;

  @override
  void paint(Canvas canvas, Size size) {
    final rect = Offset.zero & size;
    final circle = Path()..addOval(rect);
    final big = Path()..addRect(rect.inflate(blur * 4));
    final shifted = circle.shift(Offset(0, offset));
    final sigma = blur / 2;

    final outerPaint = Paint()
      ..color = outerColor
      ..maskFilter = MaskFilter.blur(BlurStyle.normal, sigma);
    final innerPaint = Paint()
      ..color = innerColor
      ..maskFilter = MaskFilter.blur(BlurStyle.normal, sigma);

    // 1. outer shadow (bottom), outer color
    canvas.save();
    canvas.clipPath(Path.combine(PathOperation.difference, big, circle));
    canvas.drawPath(shifted, outerPaint);
    canvas.restore();

    // 2. gradient fill
    canvas.drawPath(circle, Paint()..shader = gradient.createShader(rect));

    // 3. inner shadow (top), inner color
    canvas.save();
    canvas.clipPath(circle);
    canvas.drawPath(
      Path.combine(PathOperation.difference, big, shifted),
      innerPaint,
    );
    canvas.restore();
  }

  @override
  bool shouldRepaint(_DualShadowPainter old) =>
      old.blur != blur ||
      old.offset != offset ||
      old.gradient != gradient ||
      old.innerColor != innerColor ||
      old.outerColor != outerColor;
}
