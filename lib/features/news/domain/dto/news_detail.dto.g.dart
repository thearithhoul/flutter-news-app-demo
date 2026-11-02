// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'news_detail.dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_NewsDetailDto _$NewsDetailDtoFromJson(Map<String, dynamic> json) =>
    _NewsDetailDto(
      id: (json['id'] as num).toInt(),
      title: json['title'] as String,
      body: json['body'] as String?,
      category: json['category'] as String?,
      sourceName: json['sourceName'] as String?,
      author: json['author'] as String?,
      imageUrl: json['imageUrl'] as String?,
      publishedAt: json['publishedAt'] as String?,
      likes: (json['likes'] as num?)?.toInt() ?? 0,
      comments: (json['comments'] as num?)?.toInt() ?? 0,
      views: (json['views'] as num?)?.toInt() ?? 0,
    );

Map<String, dynamic> _$NewsDetailDtoToJson(_NewsDetailDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'body': instance.body,
      'category': instance.category,
      'sourceName': instance.sourceName,
      'author': instance.author,
      'imageUrl': instance.imageUrl,
      'publishedAt': instance.publishedAt,
      'likes': instance.likes,
      'comments': instance.comments,
      'views': instance.views,
    };
