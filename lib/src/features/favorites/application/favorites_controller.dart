// ignore_for_file: unnecessary_string_interpolations

import 'package:get/get.dart';

import 'package:rick_morty_getx/src/features/favorites/model/favorites_model.dart';
import 'package:rick_morty_getx/src/utils/user_preferences.dart';

class FavoritesController extends GetxController {
  final RxList<FavoritesModel> _favorites = RxList<FavoritesModel>();
  List<FavoritesModel> get favorites => _favorites;

  //TOGGLE FUNCTIONALITY
  void toggleFavorite(FavoritesModel character) {
    final index = _favorites.indexOf(character);
    if (index == -1) {
      _favorites.add(character);
      UserPreferences.saveFavoriteCharactersToSharedPrefs(
        '${character.id.toString()}',
      );
    } else {
      _favorites.removeAt(index);
      UserPreferences.removeFavoriteCharactersToSharedPrefs(
        '${character.id.toString()}',
      );
    }
  }
}
