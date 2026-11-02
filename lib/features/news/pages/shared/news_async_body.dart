import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// Children for [NewsPageScaffold] while an async value loads or fails.
List<Widget> newsAsyncChildren<T>(
  AsyncValue<T> value, {
  required List<Widget> Function(T data) data,
  required VoidCallback onRetry,
}) => value.when(
  data: data,
  loading: () => const [
    Padding(
      padding: EdgeInsets.only(top: 48),
      child: Center(child: CircularProgressIndicator()),
    ),
  ],
  error: (_, _) => [
    Padding(
      padding: const EdgeInsets.only(top: 48),
      child: Center(
        child: Column(
          children: [
            const Text('Could not load news'),
            TextButton(onPressed: onRetry, child: const Text('Retry')),
          ],
        ),
      ),
    ),
  ],
);
