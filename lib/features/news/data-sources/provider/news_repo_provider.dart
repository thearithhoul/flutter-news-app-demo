import 'package:news_custom_mobile_app/features/news/data-sources/interface/inews_repo.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'news_repo_provider.g.dart';

/// Override this with your real [INewsRepo] implementation.
@Riverpod(keepAlive: true)
INewsRepo newsRepo(Ref ref) =>
    throw UnimplementedError('Provide an INewsRepo implementation');
