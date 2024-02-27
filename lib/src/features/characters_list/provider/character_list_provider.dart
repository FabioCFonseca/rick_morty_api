// ignore_for_file: unnecessary_string_interpolations, noop_primitive_operations

import 'package:flutter/material.dart';

import 'package:rick_morty_flutter/src/common/domain/app_error.dart';
import 'package:rick_morty_flutter/src/features/character_details/presentation/details_page.dart';
import 'package:rick_morty_flutter/src/features/characters_list/domain/character_model.dart';
import 'package:rick_morty_flutter/src/features/characters_list/domain/i_character_repository.dart';
import 'package:rick_morty_flutter/src/utils/user_preferences.dart';

enum CharacterListProviderState { loading, success, error }

class CharacterListProvider extends ChangeNotifier {
  CharacterListProvider({required this.repository});

  //REPOSITORY INSTANCE
  final ICharacterRepository repository;

  // MODELS FOR UI
  List<CharacterModel> characters = [];
  List<CharacterModel> favoriteCharacters = [];
  late AppError appError;

  //PROVIDER STATE
  late CharacterListProviderState providerStatus;

  Future<void> controllerStart() async {
    providerStatus = CharacterListProviderState.loading;
    final result = await repository.getCharacters();

    result.fold(
      (error) {
        appError = error;
        providerStatus = CharacterListProviderState.error;
      },
      (success) {
        characters = success;
        for (final character in characters) {
          if (UserPreferences.getFavorite('${character.id}')) {
            favoriteCharacters.add(character);
          }
        }
        providerStatus = CharacterListProviderState.success;
      },
    );
    notifyListeners();
  }

  //TOGGLE FUNCTIONALITY
  void toggleFavorite(CharacterModel character) {
    final index = favoriteCharacters.indexOf(character);
    if (index == -1) {
      favoriteCharacters.add(character);
      UserPreferences.saveFavoriteCharactersToSharedPrefs(
        '${character.id.toString()}',
      );
    } else {
      favoriteCharacters.removeAt(index);
      UserPreferences.removeFavoriteCharactersToSharedPrefs(
        '${character.id.toString()}',
      );
    }
    notifyListeners();
  }

  //ADD CACHED FAVORITES
  void addCachedFavorites(CharacterModel character) {
    favoriteCharacters.add(character);
  }

  //DETAILS PAGE NAVIGATION
  void goToDetails(BuildContext context, int id) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => DetailsPage(selectedCharacter: id),
      ),
    );
  }
}
