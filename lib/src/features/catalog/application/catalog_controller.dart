import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

import '../../../utils/user_preferences.dart';
import '../domain/catalog.dart';
import '../infrastructure/catalog_repository.dart';

part 'catalog_controller.g.dart';

enum CatalogState { loading, success, error }

class CatalogController = _CatalogControllerBase with _$CatalogController;

abstract class _CatalogControllerBase with Store {
  _CatalogControllerBase(this._repository) {
    controllerStart();
  }

  final CatalogRepository _repository;

  @observable
  ObservableList<CatalogModel> catalog = ObservableList<CatalogModel>();

  @observable
  ObservableList<CatalogModel> favorites = ObservableList<CatalogModel>();

  @observable
  late String _apiError;

  String get apiError => _apiError;

  @observable
  late CatalogState status = CatalogState.loading;

  @action
  Future<void> controllerStart() async {
    final result = await _repository.getCatalog();

    result.fold(
      (error) {
        _apiError = error!.toString();
        status = CatalogState.error;
      },
      (success) {
        catalog.addAll(success);
        for (final character in catalog) {
          if (UserPreferences.getFavorite('${character.id}')) {
            favorites.add(character);
          }
        }
        print(favorites);
        status = CatalogState.success;
      },
    );
  }

  // TOGGLE FUNCTIONALITY
  @action
  void toggleFavorite({CatalogModel? character}) {
    final index = favorites.indexOf(character);
    if (index == -1) {
      favorites.add(character!);
      UserPreferences.saveFavoriteCharactersToSharedPrefs(
          '${character.id.toString()}');
      UserPreferences.printCache();
      print(favorites);
    } else {
      favorites.removeAt(index);
      UserPreferences.removeFavoriteCharactersToSharedPrefs(
          '${character!.id.toString()}');
      UserPreferences.printCache();
      print(favorites);
    }
  }

  // BOTTOM NAVBAR NAVIGATION
  final PageController pageController = PageController(initialPage: 0);
  @observable
  int currentPage = 0;

  @action
  void setPage(int page) {
    pageController.animateToPage(
      page,
      duration: const Duration(milliseconds: 400),
      curve: Curves.ease,
    );
    currentPage = page;
  }
}
