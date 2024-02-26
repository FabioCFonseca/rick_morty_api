// ignore_for_file: unnecessary_string_interpolations

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:rick_morty_getx/src/common/domain/app_error.dart';
import 'package:rick_morty_getx/src/features/catalog/domain/i_catalog_repository.dart';
import '../../../utils/user_preferences.dart';
import '../domain/catalog_model.dart';

class CatalogController extends GetxController {
  CatalogController(this._repository);

  final ICatalogRepository _repository;

  final RxList<CatalogModel> _catalog = RxList<CatalogModel>();
  List<CatalogModel> get catalog => _catalog;

  final RxList<CatalogModel> _favorites = RxList<CatalogModel>();
  List<CatalogModel> get favorites => _favorites;

  late final AppError _apiError;
  AppError get apiError => _apiError;

  final Rx<RxStatus> status = Rx(RxStatus.empty());

  @override
  void onInit() {
    super.onInit();
    controllerStart();
  }

  void controllerStart() async {
    status.value = RxStatus.loading();

    final result = await _repository.getCatalog();

    result.fold(
      (error) {
        _apiError = error;
        status.value = RxStatus.error();
      },
      (success) {
        _catalog.addAll(success);
        for (final character in _catalog) {
          if (UserPreferences.getFavorite('${character.id}')) {
            favorites.add(character);
          }
        }
        status.value = RxStatus.success();
      },
    );
  }

  //TOGGLE FUNCTIONALITY
  void toggleFavorite(CatalogModel character) {
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

  //BOTTOM NAVBAR NAVIGATION
  final PageController pageController = PageController(initialPage: 0);
  RxInt currentPage = 0.obs;

  void setPage(int page) {
    pageController.animateToPage(
      page,
      duration: const Duration(milliseconds: 400),
      curve: Curves.ease,
    );
    currentPage.value = page;
  }
}
