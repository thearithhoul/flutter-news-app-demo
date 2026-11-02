enum StorageSessionKeyConst { authSession }

extension StorageSessionKeyConstExtension on StorageSessionKeyConst {
  /// Converts the enum to the string used as the storage key.
  String get key => switch (this) {
    StorageSessionKeyConst.authSession => 'auth_session',
  };
}
