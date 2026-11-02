// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'news_pagination_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_NewsPaginationDto _$NewsPaginationDtoFromJson(Map<String, dynamic> json) =>
    _NewsPaginationDto(
      items: (json['items'] as List<dynamic>)
          .map((e) => NewsDto.fromJson(e as Map<String, dynamic>))
          .toList(),
      page: (json['page'] as num?)?.toInt() ?? 1,
      hasMore: json['hasMore'] as bool? ?? false,
      total: (json['total'] as num?)?.toInt() ?? 0,
    );

Map<String, dynamic> _$NewsPaginationDtoToJson(_NewsPaginationDto instance) =>
    <String, dynamic>{
      'items': instance.items,
      'page': instance.page,
      'hasMore': instance.hasMore,
      'total': instance.total,
    };
