// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'news_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// First page of news, optionally filtered.

@ProviderFor(newsList)
final newsListProvider = NewsListFamily._();

/// First page of news, optionally filtered.

final class NewsListProvider
    extends
        $FunctionalProvider<
          AsyncValue<NewsPaginationDto>,
          NewsPaginationDto,
          FutureOr<NewsPaginationDto>
        >
    with
        $FutureModifier<NewsPaginationDto>,
        $FutureProvider<NewsPaginationDto> {
  /// First page of news, optionally filtered.
  NewsListProvider._({
    required NewsListFamily super.from,
    required ({String? category, String? query}) super.argument,
  }) : super(
         retry: null,
         name: r'newsListProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$newsListHash();

  @override
  String toString() {
    return r'newsListProvider'
        ''
        '$argument';
  }

  @$internal
  @override
  $FutureProviderElement<NewsPaginationDto> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<NewsPaginationDto> create(Ref ref) {
    final argument = this.argument as ({String? category, String? query});
    return newsList(ref, category: argument.category, query: argument.query);
  }

  @override
  bool operator ==(Object other) {
    return other is NewsListProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$newsListHash() => r'43174784773850a6b6a6e0b07317155b6c12baaf';

/// First page of news, optionally filtered.

final class NewsListFamily extends $Family
    with
        $FunctionalFamilyOverride<
          FutureOr<NewsPaginationDto>,
          ({String? category, String? query})
        > {
  NewsListFamily._()
    : super(
        retry: null,
        name: r'newsListProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  /// First page of news, optionally filtered.

  NewsListProvider call({String? category, String? query}) =>
      NewsListProvider._(
        argument: (category: category, query: query),
        from: this,
      );

  @override
  String toString() => r'newsListProvider';
}

@ProviderFor(newsDetail)
final newsDetailProvider = NewsDetailFamily._();

final class NewsDetailProvider
    extends
        $FunctionalProvider<
          AsyncValue<NewsDetailDto>,
          NewsDetailDto,
          FutureOr<NewsDetailDto>
        >
    with $FutureModifier<NewsDetailDto>, $FutureProvider<NewsDetailDto> {
  NewsDetailProvider._({
    required NewsDetailFamily super.from,
    required int super.argument,
  }) : super(
         retry: null,
         name: r'newsDetailProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$newsDetailHash();

  @override
  String toString() {
    return r'newsDetailProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $FutureProviderElement<NewsDetailDto> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<NewsDetailDto> create(Ref ref) {
    final argument = this.argument as int;
    return newsDetail(ref, argument);
  }

  @override
  bool operator ==(Object other) {
    return other is NewsDetailProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$newsDetailHash() => r'97f78d988ab3c795bc831e2fe579687d1e25bae3';

final class NewsDetailFamily extends $Family
    with $FunctionalFamilyOverride<FutureOr<NewsDetailDto>, int> {
  NewsDetailFamily._()
    : super(
        retry: null,
        name: r'newsDetailProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  NewsDetailProvider call(int id) =>
      NewsDetailProvider._(argument: id, from: this);

  @override
  String toString() => r'newsDetailProvider';
}
