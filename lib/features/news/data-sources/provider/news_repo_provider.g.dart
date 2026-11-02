// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'news_repo_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// Override this with your real [INewsRepo] implementation.

@ProviderFor(newsRepo)
final newsRepoProvider = NewsRepoProvider._();

/// Override this with your real [INewsRepo] implementation.

final class NewsRepoProvider
    extends $FunctionalProvider<INewsRepo, INewsRepo, INewsRepo>
    with $Provider<INewsRepo> {
  /// Override this with your real [INewsRepo] implementation.
  NewsRepoProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'newsRepoProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$newsRepoHash();

  @$internal
  @override
  $ProviderElement<INewsRepo> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  INewsRepo create(Ref ref) {
    return newsRepo(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(INewsRepo value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<INewsRepo>(value),
    );
  }
}

String _$newsRepoHash() => r'3cb3b58612028830e394c28447f8db0ab3296966';
