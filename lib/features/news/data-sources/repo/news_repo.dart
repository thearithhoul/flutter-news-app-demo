import 'package:news_custom_mobile_app/features/news/data-sources/interface/inews_repo.dart';
import 'package:news_custom_mobile_app/features/news/domain/dto/news_detail.dto.dart';
import 'package:news_custom_mobile_app/features/news/domain/dto/news_dto.dart';
import 'package:news_custom_mobile_app/features/news/domain/dto/news_pagination_dto.dart';

/// [INewsRepo] that returns hard-coded sample data until a real API exists.
class NewsRepo implements INewsRepo {
  static const _pageSize = 5;

  static const _categories = ['Politics', 'Sports', 'Tech', 'Business'];

  static final List<NewsDetailDto> _articles = List.generate(24, (i) {
    final id = i + 1;
    final category = _categories[i % _categories.length];
    return NewsDetailDto(
      id: id,
      title: 'Sample $category headline #$id',
      body:
          'This is sample article #$id in the $category category. '
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit. '
          'Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.\n\n'
          'Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris '
          'nisi ut aliquip ex ea commodo consequat.',
      category: category,
      sourceName: 'Sample News',
      author: 'Staff Reporter',
      imageUrl: 'https://picsum.photos/seed/news$id/800/450',
      publishedAt: DateTime(
        2026,
        11,
        2,
      ).subtract(Duration(hours: i * 3)).toIso8601String(),
      likes: 10 * id,
      comments: 2 * id,
      views: 100 * id,
    );
  });

  @override
  Future<NewsPaginationDto> getNews({
    int page = 1,
    String? category,
    String? query,
  }) async {
    await Future<void>.delayed(const Duration(milliseconds: 400));

    final q = query?.trim().toLowerCase();
    final filtered = _articles.where((a) {
      final matchesCategory =
          category == null || category == 'All' || a.category == category;
      final matchesQuery =
          q == null || q.isEmpty || a.title.toLowerCase().contains(q);
      return matchesCategory && matchesQuery;
    }).toList();

    final start = (page - 1) * _pageSize;
    final items = start >= filtered.length
        ? <NewsDetailDto>[]
        : filtered.sublist(
            start,
            (start + _pageSize).clamp(0, filtered.length),
          );

    return NewsPaginationDto(
      items: items.map(_toListItem).toList(),
      page: page,
      hasMore: start + _pageSize < filtered.length,
      total: filtered.length,
    );
  }

  @override
  Future<NewsDetailDto> getNewsDetail(int id) async {
    await Future<void>.delayed(const Duration(milliseconds: 300));
    return _articles.firstWhere(
      (a) => a.id == id,
      orElse: () => throw StateError('News $id not found'),
    );
  }

  NewsDto _toListItem(NewsDetailDto a) => NewsDto(
    id: a.id,
    title: a.title,
    category: a.category,
    sourceName: a.sourceName,
    imageUrl: a.imageUrl,
    publishedAt: a.publishedAt,
    likes: a.likes,
    comments: a.comments,
    views: a.views,
  );
}
