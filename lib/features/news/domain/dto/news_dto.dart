import 'package:freezed_annotation/freezed_annotation.dart';

part 'news_dto.freezed.dart';
part 'news_dto.g.dart';

/// A news item as shown in lists (no article body).
@freezed
abstract class NewsDto with _$NewsDto {
  factory NewsDto({
    required int id,
    required String title,
    required String? category,
    required String? sourceName,
    required String? imageUrl,
    required String? publishedAt,
    @Default(0) int likes,
    @Default(0) int comments,
    @Default(0) int views,
  }) = _NewsDto;

  factory NewsDto.fromJson(Map<String, Object?> json) =>
      _$NewsDtoFromJson(json);
}
