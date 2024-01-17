import 'package:shared_preferences/shared_preferences.dart';

import '../presentation/resources/language_manager.dart';

const String prefsKeyLang = 'PREFS_KEY_LANG';

class AppPreferences {
  final SharedPreferences _sharedPreferences;

  AppPreferences(this._sharedPreferences);

  Future<String> getAppLanguage() async {
    String? language = _sharedPreferences.getString(prefsKeyLang);

    if (language != null && language.isNotEmpty) {
      return language;
    } else {
      // return default language
      return LanguageType.english.getValue();
    }
  }
}
