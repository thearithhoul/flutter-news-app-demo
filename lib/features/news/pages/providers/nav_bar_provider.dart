import 'package:flutter/material.dart';

/// Icons shown in the bottom nav bar, in tab order.
const List<IconData> navBarIcons = [
  Icons.home_rounded,
  Icons.explore_rounded,
  Icons.bookmark_rounded,
  Icons.person_rounded,
];

/// Route for each nav bar tab, in the same order as [navBarIcons].
const List<String> navBarPaths = ['/', '/explore', '/favourite', '/profile'];
