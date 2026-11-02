import 'package:flutter/widgets.dart';
import 'package:news_custom_mobile_app/core/shared/constants/auth_state_const.dart';
import 'package:news_custom_mobile_app/features/auth/pages/providers/auth_guard.dart';
import 'package:news_custom_mobile_app/features/auth/pages/views/login_view.dart';
import 'package:news_custom_mobile_app/features/news/pages/views/news_detail_view.dart';
import 'package:news_custom_mobile_app/features/news/pages/views/news_shell_view.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:go_router/go_router.dart';

part 'app_routes.g.dart';

Page<void> _shellPage(BuildContext context, GoRouterState state) =>
    const NoTransitionPage(key: ValueKey('news-shell'), child: NewsShellView());

const publicPrefix = ['/login'];

@riverpod
GoRouter appRoutes(Ref ref) {
  final authListenable = ValueNotifier<int>(0);

  ref.listen(authStateProvider, (_, _) => authListenable.value++);

  return GoRouter(
    refreshListenable: authListenable,
    initialLocation: '/',
    redirect: (context, state) {
      final auth = ref.read(authStateProvider);
      // Wait until the saved session has been checked.
      if (auth == AuthStateConst.loading) return null;

      final isPublic = publicPrefix.contains(state.matchedLocation);
      final isLogin = auth == AuthStateConst.authenticated;

      if (!isPublic && !isLogin) return '/login';
      if (isPublic && isLogin) return '/';
      return null;
    },
    routes: [
      GoRoute(path: '/', pageBuilder: _shellPage),
      GoRoute(path: '/explore', pageBuilder: _shellPage),
      GoRoute(path: '/favourite', pageBuilder: _shellPage),
      GoRoute(path: '/profile', pageBuilder: _shellPage),
      GoRoute(
        path: '/news/:id',
        builder: (context, state) =>
            NewsDetailView(id: int.tryParse(state.pathParameters['id']!) ?? 0),
      ),
      GoRoute(path: '/login', builder: (context, state) => LoginView()),
    ],
  );
}
