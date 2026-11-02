import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:news_custom_mobile_app/features/news/pages/providers/news_provider.dart';
import 'package:news_custom_mobile_app/features/news/pages/shared/news_async_body.dart';
import 'package:news_custom_mobile_app/features/news/pages/shared/news_dto_ext.dart';
import 'package:news_custom_mobile_app/features/news/pages/shared/news_page_scaffold.dart';

class HomeViews extends ConsumerWidget {
  const HomeViews({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final news = ref.watch(newsListProvider());

    return NewsPageScaffold(
      title: 'Popular News',
      trailing: const Text(
        'See All',
        style: TextStyle(fontSize: 13, color: Color(0xFF7A807C)),
      ),
      children: newsAsyncChildren(
        news,
        onRetry: () => ref.invalidate(newsListProvider),
        data: (page) =>
            spaced(page.items.take(2).map((n) => n.toCard(context))),
      ),
    );
  }
}
