import 'package:news_custom_mobile_app/features/auth/data-sources/provider/auth_repo_provider.dart';
import 'package:news_custom_mobile_app/features/auth/pages/providers/auth_guard.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'auth_provider.g.dart';

@riverpod
class Auth extends _$Auth {
  @override
  void build() {}

  Future<void> login(String username, String password) async {
    final session = await ref.read(authRepoProvider).login(username, password);
    await ref.read(authStateProvider.notifier).setSession(session);
  }

  Future<void> logout() async {
    try {
      await ref.read(authRepoProvider).logout();
    } catch (_) {
      // Still sign out locally if the server call fails.
    }
    await ref.read(authStateProvider.notifier).clearSession();
  }
}
