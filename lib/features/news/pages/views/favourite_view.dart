import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:news_custom_mobile_app/features/news/pages/providers/news_provider.dart';
import 'package:news_custom_mobile_app/features/news/pages/shared/news_async_body.dart';
import 'package:news_custom_mobile_app/features/news/pages/shared/news_dto_ext.dart';
import 'package:news_custom_mobile_app/features/news/pages/shared/news_page_scaffold.dart';

class FavouriteView extends ConsumerWidget {
  const FavouriteView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final news = ref.watch(newsListProvider());
    // Placeholder: replace with the user's saved articles once persisted.
    final savedCount = news.value?.items.where((n) => n.likes > 600).length;

    return NewsPageScaffold(
      title: 'Favourites',
      trailing: Text(
        '${savedCount ?? 0} saved',
        style: const TextStyle(fontSize: 13, color: Color(0xFF7A807C)),
      ),
      children: newsAsyncChildren(
        news,
        onRetry: () => ref.invalidate(newsListProvider),
        data: (page) {
          final saved = page.items.where((n) => n.likes > 600);
          if (saved.isEmpty) {
            return const [
              Padding(
                padding: EdgeInsets.only(top: 48),
                child: Center(child: Text('No favourites yet')),
              ),
            ];
          }
          return spaced(saved.map((n) => n.toCard(context)));
        },
      ),
    );
  }
}
