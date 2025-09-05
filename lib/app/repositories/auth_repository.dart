import 'dart:math';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';

abstract class _StorageKeys {
  static const sessionToken = 'session_token';
}

class AuthRepository {
  static const storage = FlutterSecureStorage();

  Future<String?> getSessionToken() => storage.read(key: _StorageKeys.sessionToken);

  void setSessionToken() => storage.write(
    key: _StorageKeys.sessionToken,
    value: _generateSessionToken(),
  );

  void deleteSessionToken() => storage.delete(key: _StorageKeys.sessionToken);

  String _generateSessionToken({int length = 32}) {
    const chars = 'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789';
    final random = Random.secure();

    return String.fromCharCodes(Iterable.generate(length, (_) => chars.codeUnitAt(random.nextInt(chars.length))));
  }
}
