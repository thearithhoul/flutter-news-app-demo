import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:news_custom_mobile_app/core/shared/constants/storage_session_key_const.dart';
import 'package:news_custom_mobile_app/core/shared/services/local_storage_service.dart';
import 'package:news_custom_mobile_app/features/auth/data-sources/provider/auth_repo_provider.dart';
import 'package:news_custom_mobile_app/features/auth/domain/dto/auth_session_dto.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'http_client_service.g.dart';

const _baseUrl = 'https://api.example.com';
const _retriedKey = 'retried';

@Riverpod(keepAlive: true)
Dio httpClient(Ref ref) {
  final dio = Dio(
    BaseOptions(
      baseUrl: _baseUrl,
      connectTimeout: const Duration(seconds: 15),
      receiveTimeout: const Duration(seconds: 20),
      headers: {'Accept': 'application/json'},
    ),
  );

  dio.interceptors.add(_AuthInterceptor(ref, dio));
  return dio;
}

/// Adds the bearer token to requests and refreshes it once on a 401.
class _AuthInterceptor extends Interceptor {
  _AuthInterceptor(this._ref, this._dio);

  final Ref _ref;
  final Dio _dio;
  bool _refreshing = false;

  LocalStorageService get _storage => _ref.read(localStorageServiceProvider);

  Future<AuthSessionDto?> _readSession() async {
    final raw = await _storage.read(StorageSessionKeyConst.authSession);
    if (raw == null) return null;
    return AuthSessionDto.fromJson(jsonDecode(raw) as Map<String, Object?>);
  }

  @override
  Future<void> onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    // The refresh call itself must not carry the expired token.
    if (!_refreshing) {
      final token = (await _readSession())?.token;
      if (token != null) options.headers['Authorization'] = 'Bearer $token';
    }
    handler.next(options);
  }

  @override
  Future<void> onError(
    DioException err,
    ErrorInterceptorHandler handler,
  ) async {
    final request = err.requestOptions;
    final canRefresh =
        err.response?.statusCode == 401 &&
        !_refreshing &&
        request.extra[_retriedKey] != true;
    if (!canRefresh) return handler.next(err);

    try {
      final refreshToken = (await _readSession())?.refreshToken;
      if (refreshToken == null) return handler.next(err);

      _refreshing = true;
      final session = await _ref
          .read(authRepoProvider)
          .refreshToken(refreshToken);
      await _storage.write(
        StorageSessionKeyConst.authSession,
        jsonEncode(session.toJson()),
      );
      _refreshing = false;

      request.extra[_retriedKey] = true;
      request.headers['Authorization'] = 'Bearer ${session.token}';
      handler.resolve(await _dio.fetch<dynamic>(request));
    } on DioException catch (e) {
      handler.next(e);
    } catch (_) {
      handler.next(err);
    } finally {
      _refreshing = false;
    }
  }
}
