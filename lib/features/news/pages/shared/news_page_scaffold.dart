import 'package:flutter/material.dart';

/// Page background shared by the news tabs and the article screen.
const newsBackgroundGradient = LinearGradient(
  begin: Alignment.topCenter,
  end: Alignment.bottomCenter,
  colors: [Color(0xFFF4F6F5), Color(0xFFE3EEE6), Color(0xFFBFE0C5)],
);

/// Shared header + scrolling body used by every tab of the news feature.
class NewsPageScaffold extends StatelessWidget {
  const NewsPageScaffold({
    super.key,
    required this.title,
    this.trailing,
    this.top,
    required this.children,
  });

  final String title;
  final Widget? trailing;
  final Widget? top;
  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(16, 16, 16, 12),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                ),
              ),
              ?trailing,
            ],
          ),
        ),
        ?top,
        Expanded(
          child: ListView(
            padding: const EdgeInsets.fromLTRB(16, 0, 16, 120),
            children: children,
          ),
        ),
      ],
    );
  }
}

/// Interleaves [items] with 12px gaps.
List<Widget> spaced(Iterable<Widget> items) => [
  for (final w in items) ...[w, const SizedBox(height: 12)],
];
