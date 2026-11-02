import 'dart:convert';

import 'package:news_custom_mobile_app/core/shared/constants/auth_state_const.dart';
import 'package:news_custom_mobile_app/core/shared/constants/storage_session_key_const.dart';
import 'package:news_custom_mobile_app/core/shared/services/local_storage_service.dart';
import 'package:news_custom_mobile_app/features/auth/data-sources/provider/auth_repo_provider.dart';
import 'package:news_custom_mobile_app/features/auth/domain/dto/auth_session_dto.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'auth_guard.g.dart';

@riverpod
class AuthState extends _$AuthState {
  @override
  AuthStateConst build() {
    // Stay in `loading` until the saved session has been checked.
    _loadSession();
    return AuthStateConst.loading;
  }

  /// Saves [session] and marks the user as authenticated.
  Future<void> setSession(AuthSessionDto session) async {
    await ref
        .read(localStorageServiceProvider)
        .write(
          StorageSessionKeyConst.authSession,
          jsonEncode(session.toJson()),
        );
    state = AuthStateConst.authenticated;
  }

  /// Clears all saved data and marks the user as unauthenticated.
  Future<void> clearSession() async {
    await ref.read(localStorageServiceProvider).deleteAll();
    state = AuthStateConst.unauthenticated;
  }

  /// Loads the saved session and checks that the token has not expired.
  Future<void> _loadSession() async {
    final storage = ref.read(localStorageServiceProvider);
    try {
      final raw = await storage.read(StorageSessionKeyConst.authSession);
      if (raw == null) {
        state = AuthStateConst.unauthenticated;
        return;
      }

      final session = AuthSessionDto.fromJson(
        jsonDecode(raw) as Map<String, Object?>,
      );
      final expireAt = session.expireAt;
      final valid =
          session.token != null &&
          expireAt != null &&
          DateTime.now().millisecondsSinceEpoch < expireAt;

      if (valid) {
        state = AuthStateConst.authenticated;
        return;
      }

      // Expired: try to get a new session with the refresh token.
      final refreshToken = session.refreshToken;
      state = refreshToken == null
          ? AuthStateConst.unauthenticated
          : await _refresh(refreshToken);
    } catch (_) {
      await storage.delete(StorageSessionKeyConst.authSession);
      state = AuthStateConst.unauthenticated;
    }
  }

  Future<AuthStateConst> _refresh(String refreshToken) async {
    try {
      final newSession = await ref
          .read(authRepoProvider)
          .refreshToken(refreshToken);
      await ref
          .read(localStorageServiceProvider)
          .write(
            StorageSessionKeyConst.authSession,
            jsonEncode(newSession.toJson()),
          );
      return AuthStateConst.authenticated;
    } catch (_) {
      return AuthStateConst.unauthenticated;
    }
  }
}
