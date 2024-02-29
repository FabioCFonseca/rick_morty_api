// ignore_for_file: unnecessary_string_interpolations

import 'package:get/get.dart';

import 'package:rick_morty_getx/src/common/domain/app_error.dart';
import 'package:rick_morty_getx/src/features/catalog/domain/i_catalog_repository.dart';
import 'package:rick_morty_getx/src/features/favorites/application/favorites_controller.dart';
import '../../../utils/user_preferences.dart';
import '../domain/catalog_model.dart';

class CatalogController extends GetxController {
  CatalogController(this._repository);

  final ICatalogRepository _repository;

  final RxList<CatalogModel> _catalog = RxList<CatalogModel>();
  List<CatalogModel> get catalog => _catalog;

  late final AppError _apiError;
  AppError get apiError => _apiError;

  Rx<RxStatus> status = Rx(RxStatus.empty());

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
            Get.find<FavoritesController>().favorites.add(character);
          }
        }
        status.value = RxStatus.success();
      },
    );
  }
}
