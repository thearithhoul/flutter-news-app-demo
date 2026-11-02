import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';
import 'package:news_custom_mobile_app/features/news/domain/dto/news_dto.dart';
import 'package:news_custom_mobile_app/features/news/pages/shared/news_card_widget.dart';

extension NewsDtoCard on NewsDto {
  NewsCardWidget toCard(BuildContext context, {VoidCallback? onLikeTap}) =>
      NewsCardWidget(
        onTap: () => context.push('/news/$id'),
        sourceName: sourceName ?? '',
        timeAgo: publishedAt ?? '',
        title: title,
        imageUrl: imageUrl,
        likes: likes,
        comments: comments,
        views: views,
        onLikeTap: onLikeTap,
      );
}
