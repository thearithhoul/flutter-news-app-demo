import 'package:news_custom_mobile_app/features/news/domain/dto/news_detail.dto.dart';
import 'package:news_custom_mobile_app/features/news/domain/dto/news_pagination_dto.dart';

abstract interface class INewsRepo {
  /// Loads one page of news, optionally filtered by [category] or [query].
  Future<NewsPaginationDto> getNews({
    int page = 1,
    String? category,
    String? query,
  });

  /// Loads the full article with [id].
  Future<NewsDetailDto> getNewsDetail(int id);
}
