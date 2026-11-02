import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:news_custom_mobile_app/features/news/pages/providers/news_provider.dart';
import 'package:news_custom_mobile_app/features/news/pages/shared/news_async_body.dart';
import 'package:news_custom_mobile_app/features/news/pages/shared/news_dto_ext.dart';
import 'package:news_custom_mobile_app/features/news/pages/shared/news_page_scaffold.dart';
import 'package:news_custom_mobile_app/features/news/pages/shared/news_categories.dart';

class ExploreView extends ConsumerStatefulWidget {
  const ExploreView({super.key});

  @override
  ConsumerState<ExploreView> createState() => _ExploreViewState();
}

class _ExploreViewState extends ConsumerState<ExploreView> {
  String _category = newsCategories.first;
  String _query = '';
  Timer? _debounce;

  @override
  void dispose() {
    _debounce?.cancel();
    super.dispose();
  }

  void _onQueryChanged(String value) {
    _debounce?.cancel();
    _debounce = Timer(
      const Duration(milliseconds: 400),
      () => setState(() => _query = value.trim()),
    );
  }

  @override
  Widget build(BuildContext context) {
    final results = ref.watch(
      newsListProvider(
        category: _category == 'All' ? null : _category,
        query: _query.isEmpty ? null : _query,
      ),
    );

    return NewsPageScaffold(
      title: 'Explore',
      top: Column(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 0, 16, 12),
            child: TextField(
              onChanged: _onQueryChanged,
              decoration: InputDecoration(
                hintText: 'Search news',
                prefixIcon: const Icon(Icons.search_rounded),
                filled: true,
                fillColor: Colors.white,
                contentPadding: const EdgeInsets.symmetric(vertical: 0),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(28),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
          ),
          SizedBox(
            height: 40,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: 16),
              itemCount: newsCategories.length,
              separatorBuilder: (_, _) => const SizedBox(width: 8),
              itemBuilder: (_, i) {
                final c = newsCategories[i];
                return ChoiceChip(
                  label: Text(c),
                  selected: c == _category,
                  onSelected: (_) => setState(() => _category = c),
                  selectedColor: const Color(0xFF111413),
                  labelStyle: TextStyle(
                    color: c == _category ? Colors.white : Colors.black,
                  ),
                  showCheckmark: false,
                  shape: const StadiumBorder(),
                );
              },
            ),
          ),
          const SizedBox(height: 12),
        ],
      ),
      children: newsAsyncChildren(
        results,
        onRetry: () => ref.invalidate(newsListProvider),
        data: (page) => page.items.isEmpty
            ? const [
                Padding(
                  padding: EdgeInsets.only(top: 48),
                  child: Center(child: Text('No news found')),
                ),
              ]
            : spaced(page.items.map((n) => n.toCard(context))),
      ),
    );
  }
}
