// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'news_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_NewsDto _$NewsDtoFromJson(Map<String, dynamic> json) => _NewsDto(
  id: (json['id'] as num).toInt(),
  title: json['title'] as String,
  category: json['category'] as String?,
  sourceName: json['sourceName'] as String?,
  imageUrl: json['imageUrl'] as String?,
  publishedAt: json['publishedAt'] as String?,
  likes: (json['likes'] as num?)?.toInt() ?? 0,
  comments: (json['comments'] as num?)?.toInt() ?? 0,
  views: (json['views'] as num?)?.toInt() ?? 0,
);

Map<String, dynamic> _$NewsDtoToJson(_NewsDto instance) => <String, dynamic>{
  'id': instance.id,
  'title': instance.title,
  'category': instance.category,
  'sourceName': instance.sourceName,
  'imageUrl': instance.imageUrl,
  'publishedAt': instance.publishedAt,
  'likes': instance.likes,
  'comments': instance.comments,
  'views': instance.views,
};
