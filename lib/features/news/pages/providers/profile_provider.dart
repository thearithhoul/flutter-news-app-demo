import 'package:news_custom_mobile_app/features/auth/data-sources/provider/auth_repo_provider.dart';
import 'package:news_custom_mobile_app/features/auth/domain/dto/user_dto.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'profile_provider.g.dart';

@riverpod
class Profile extends _$Profile {
  @override
  Future<UserDto> build() => ref.watch(authRepoProvider).getProfile();
}
