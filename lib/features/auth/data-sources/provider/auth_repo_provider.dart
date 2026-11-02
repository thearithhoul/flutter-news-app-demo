import 'package:news_custom_mobile_app/features/auth/data-sources/interface/iauth_repo.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'auth_repo_provider.g.dart';

/// Override this with your real [IAuthRepo] implementation.
@Riverpod(keepAlive: true)
IAuthRepo authRepo(Ref ref) =>
    throw UnimplementedError('Provide an IAuthRepo implementation');
