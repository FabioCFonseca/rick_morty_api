import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../utils/user_preferences.dart';
import '../domain/catalog.dart';
import '../infrastructure/catalog_repository.dart';

class CatalogController extends GetxController {
  CatalogController(this._repository);

  final CatalogRepository _repository;

  final RxList<CatalogModel> _catalog = RxList<CatalogModel>();
  List<CatalogModel> get catalog => _catalog;

  final RxList<CatalogModel> _favorites = RxList<CatalogModel>();
  List<CatalogModel> get favorites => _favorites;

  late final String _apiError;
  String get apiError => _apiError;

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
        _apiError = error.message!;
        status.value = RxStatus.error();
      },
      (success) {
        _catalog.addAll(success);
        for (final character in _catalog) {
          if (UserPreferences.getFavorite('${character.id}')) {
            favorites.add(character);
          }
        }
        print(favorites);
        status.value = RxStatus.success();
      },
    );
  }

  //TOGGLE FUNCTIONALITY
  void toggleFavorite({CatalogModel? character}) {
    final index = _favorites.indexOf(character);
    if (index == -1) {
      _favorites.add(character!);
      UserPreferences.saveFavoriteCharactersToSharedPrefs(
          '${character!.id.toString()}');
      print(favorites);
    } else {
      _favorites.removeAt(index);
      UserPreferences.removeFavoriteCharactersToSharedPrefs(
          '${character!.id.toString()}');
      print(favorites);
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
