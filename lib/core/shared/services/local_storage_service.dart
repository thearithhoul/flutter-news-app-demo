import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:news_custom_mobile_app/core/shared/constants/storage_session_key_const.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'local_storage_service.g.dart';

@Riverpod(keepAlive: true)
LocalStorageService localStorageService(Ref ref) => LocalStorageService();

class LocalStorageService {
  LocalStorageService([FlutterSecureStorage? storage])
    : _storage = storage ?? const FlutterSecureStorage();

  final FlutterSecureStorage _storage;

  /// Saves [value] under [key].
  Future<void> write(StorageSessionKeyConst key, String value) =>
      _storage.write(key: key.key, value: value);

  /// Returns the value for [key], or null if missing.
  Future<String?> read(StorageSessionKeyConst key) =>
      _storage.read(key: key.key);

  /// Whether [key] exists.
  Future<bool> contains(StorageSessionKeyConst key) =>
      _storage.containsKey(key: key.key);

  /// Deletes the value for [key].
  Future<void> delete(StorageSessionKeyConst key) =>
      _storage.delete(key: key.key);

  /// Deletes everything (e.g. on logout).
  Future<void> deleteAll() => _storage.deleteAll();
}
