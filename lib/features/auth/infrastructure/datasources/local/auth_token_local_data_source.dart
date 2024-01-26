import 'package:fpdart/fpdart.dart';
import 'package:greenleaf/features/common/domain/failures/failure.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// Manage token in device storage
class AuthTokenLocalDataSource {
  /// Default constructor for [AuthTokenLocalDataSource]
  AuthTokenLocalDataSource(this._prefs);

  final Future<SharedPreferences> _prefs;

  static const _key = 'auth_token';

  /// get the token from the device storage
  Either<Failure, String> get() {
    final v = _prefs.then((value) => value.getString(_key)).toString();

    return right(v);
  }

  /// Store token in device storage
  Future<bool> store(String token) async {
    return _prefs.then(
      (value) => value.setString(
        _key,
        token,
      ),
    );
  }

  /// Remove token from device storage
  Future<bool> remove() async {
    return _prefs.then((value) => value.remove(_key));
  }
}
