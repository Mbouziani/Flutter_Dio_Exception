import 'package:shared_preferences/shared_preferences.dart';

class CacheHelper {
  final SharedPreferences shared;
  CacheHelper({required this.shared});

  // Keys
  final String _loginKey = 'loginKey';

  final String _baseUrl = 'baseUrlKey';

  final String _languageCode = 'languageCodeKey';

  final String _isDarkMode = 'darkModeKey';

  // geter
  String? get getLogin => shared.getString(_loginKey);

  String? get getBaseUrl => shared.getString(_baseUrl);

  String? get getLanguageCode => shared.getString(_languageCode);

  bool get isDarkMode => shared.getBool(_isDarkMode) ?? false;

  // Seter
  Future<void> setLogin({required String value}) async {
    await shared.setString(_loginKey, value);
  }

  Future<void> setBaseUrl({required String value}) async {
    await shared.setString(_baseUrl, value);
  }

  Future<void> setLanguageCode({required String value}) async {
    await shared.setString(_languageCode, value);
  }

  Future<void> setDarkMode({required bool value}) async {
    await shared.setBool(_isDarkMode, value);
  }

  // remove
  Future removeLoginKey() async {
    await shared.remove(_loginKey);
  }
}
