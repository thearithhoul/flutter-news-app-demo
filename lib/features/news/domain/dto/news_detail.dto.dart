import 'package:freezed_annotation/freezed_annotation.dart';

part 'news_detail.dto.freezed.dart';
part 'news_detail.dto.g.dart';

/// A full article for the detail page.
@freezed
abstract class NewsDetailDto with _$NewsDetailDto {
  factory NewsDetailDto({
    required int id,
    required String title,
    required String? body,
    required String? category,
    required String? sourceName,
    required String? author,
    required String? imageUrl,
    required String? publishedAt,
    @Default(0) int likes,
    @Default(0) int comments,
    @Default(0) int views,
  }) = _NewsDetailDto;

  factory NewsDetailDto.fromJson(Map<String, Object?> json) =>
      _$NewsDetailDtoFromJson(json);
}
