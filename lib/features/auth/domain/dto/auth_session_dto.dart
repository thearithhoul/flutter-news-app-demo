import 'package:freezed_annotation/freezed_annotation.dart';

part 'auth_session_dto.freezed.dart';
part 'auth_session_dto.g.dart';

@freezed
abstract class AuthSessionDto with _$AuthSessionDto {
  factory AuthSessionDto({
    required String? token,
    required String? refreshToken,
    required int? expireAt,
  }) = _AuthSessionDto;

  factory AuthSessionDto.fromJson(Map<String, Object?> json) =>
      _$AuthSessionDtoFromJson(json);
}
