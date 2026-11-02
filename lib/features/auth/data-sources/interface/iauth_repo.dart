import '../../domain/dto/auth_session_dto.dart';
import '../../domain/dto/user_dto.dart';

abstract interface class IAuthRepo {
  Future<AuthSessionDto> login(String username, String password);

  /// Logs out the current user (e.g. invalidates the session on the server).
  Future<void> logout();

  /// Exchanges [refreshToken] for a new [AuthSessionDto].
  Future<AuthSessionDto> refreshToken(String refreshToken);

  /// Loads the signed-in user's profile.
  Future<UserDto> getProfile();
}
