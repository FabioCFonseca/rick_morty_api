import 'package:flutter/material.dart';

import '../../../utils/user_preferences.dart';
import '../../characters_list/domain/character_model.dart';
import '../../characters_list/infrastructure/characters_list_repository.dart';
import '../../../common/domain/app_error.dart';
import '../../character_details/presentation/details_page.dart';

enum CharacterListProviderState { loading, success, error }

class CharacterListProvider extends ChangeNotifier {
  CharacterListProvider({required this.repository});

  //REPOSITORY INSTANCE
  final CharactersListRepository repository;

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
        print(favoriteCharacters);
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
      UserPreferences.saveFavoriteCharactersToSharedPrefs('${character.id.toString()}');
      UserPreferences.printCache();
    } else {
      favoriteCharacters.removeAt(index);
      UserPreferences.removeFavoriteCharactersToSharedPrefs('${character.id.toString()}');
      UserPreferences.printCache();
    }
    notifyListeners();
  }

  //ADD CACHED FAVORITES
  void addCachedFavorites(CharacterModel character) {
    favoriteCharacters.add(character);
  }

  //DETAILS PAGE NAVIGATION
  void goToDetails(context, id) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => DetailsPage(selectedCharacter: id),
      ),
    );
  }

  //BOTTOM NAVBAR NAVIGATION
  final PageController pageController = PageController(initialPage: 0);
  int currentPage = 0;

  void setPage(int page) {
    pageController.animateToPage(
      page,
      duration: const Duration(milliseconds: 400),
      curve: Curves.ease,
    );
    currentPage = page;
    notifyListeners();
  }
}
