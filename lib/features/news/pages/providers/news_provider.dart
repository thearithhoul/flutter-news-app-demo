import 'package:news_custom_mobile_app/features/news/data-sources/provider/news_repo_provider.dart';
import 'package:news_custom_mobile_app/features/news/domain/dto/news_detail.dto.dart';
import 'package:news_custom_mobile_app/features/news/domain/dto/news_pagination_dto.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'news_provider.g.dart';

/// First page of news, optionally filtered.
@riverpod
Future<NewsPaginationDto> newsList(
  Ref ref, {
  String? category,
  String? query,
}) => ref.watch(newsRepoProvider).getNews(category: category, query: query);

@riverpod
Future<NewsDetailDto> newsDetail(Ref ref, int id) =>
    ref.watch(newsRepoProvider).getNewsDetail(id);
