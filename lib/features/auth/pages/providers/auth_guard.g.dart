// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_guard.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(AuthState)
final authStateProvider = AuthStateProvider._();

final class AuthStateProvider
    extends $NotifierProvider<AuthState, AuthStateConst> {
  AuthStateProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'authStateProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$authStateHash();

  @$internal
  @override
  AuthState create() => AuthState();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(AuthStateConst value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<AuthStateConst>(value),
    );
  }
}

String _$authStateHash() => r'78000128bf5c8d600412964094f959031beb07d6';

abstract class _$AuthState extends $Notifier<AuthStateConst> {
  AuthStateConst build();
  @$mustCallSuper
  @override
  WhenComplete runBuild() {
    final ref = this.ref as $Ref<AuthStateConst, AuthStateConst>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AuthStateConst, AuthStateConst>,
              AuthStateConst,
              Object?,
              Object?
            >;
    return element.handleCreate(ref, build);
  }
}
