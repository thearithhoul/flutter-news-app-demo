import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:news_custom_mobile_app/features/news/domain/dto/news_dto.dart';

part 'news_pagination_dto.freezed.dart';
part 'news_pagination_dto.g.dart';

/// One page of news items.
@freezed
abstract class NewsPaginationDto with _$NewsPaginationDto {
  factory NewsPaginationDto({
    required List<NewsDto> items,
    @Default(1) int page,
    @Default(false) bool hasMore,
    @Default(0) int total,
  }) = _NewsPaginationDto;

  factory NewsPaginationDto.fromJson(Map<String, Object?> json) =>
      _$NewsPaginationDtoFromJson(json);
}
