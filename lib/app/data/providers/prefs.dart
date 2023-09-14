import 'dart:async';
import 'package:mobile/app/core/values/constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Prefs {
  Prefs._();

  static Prefs? _singleton;
  String? _token;

  static Prefs get prefs {
    return _singleton ??= Prefs._();
  }

  Future<void> saveToken(String token) async {
    _token = token;
    SharedPreferences.getInstance()
        .then((value) => value.setString(keyToken, token));
  }

  static FutureOr<String?> get token async {
    return prefs._token ??
        (await SharedPreferences.getInstance()).getString(keyToken);
  }

  static FutureOr<bool> get hasToken async =>
      prefs._token != null ||
      (await SharedPreferences.getInstance()).containsKey(keyToken);
}
