import 'package:shared_preferences/shared_preferences.dart';

class UserPreferences {
  static late SharedPreferences preferences;
  static var valor = preferences.getString('favoriteCharacters');

  static Future init() async =>
      preferences = await SharedPreferences.getInstance();

  static Future<void> saveFavoriteCharactersToSharedPrefs(
      String favoriteCharacters) async {
    await preferences.setString(favoriteCharacters, favoriteCharacters);
  }

  static Future<void> removeFavoriteCharactersToSharedPrefs(
      String favoriteCharacters) async {
    await preferences.remove(favoriteCharacters);
  }

  static bool getFavorite(String id) {
    if (preferences.getString(id) != null) {
      return true;
    } else {
      return false;
    }
  }

  static void printCache() {
    for (final key in preferences.getKeys()) {
      final value = preferences.get(key);
      print(
          'Key: $key - ${key.runtimeType}, Value: $value - ${value.runtimeType}');
    }
  }
}
