// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_repo_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// Override this with your real [IAuthRepo] implementation.

@ProviderFor(authRepo)
final authRepoProvider = AuthRepoProvider._();

/// Override this with your real [IAuthRepo] implementation.

final class AuthRepoProvider
    extends $FunctionalProvider<IAuthRepo, IAuthRepo, IAuthRepo>
    with $Provider<IAuthRepo> {
  /// Override this with your real [IAuthRepo] implementation.
  AuthRepoProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'authRepoProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$authRepoHash();

  @$internal
  @override
  $ProviderElement<IAuthRepo> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  IAuthRepo create(Ref ref) {
    return authRepo(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(IAuthRepo value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<IAuthRepo>(value),
    );
  }
}

String _$authRepoHash() => r'd53cba7e7882b74a1c2cb8fd918acf9ed35ea781';
