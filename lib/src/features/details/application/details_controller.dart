import 'package:get/get.dart';
import 'package:rick_morty_getx/src/common/domain/app_error.dart';

import '../domain/character_details_model.dart';
import '../domain/i_character_details_repository.dart';

class DetailsController extends GetxController {
  DetailsController(this._repository, this._index);

  final ICharacterDetailsRepository _repository;
  final int _index;

  final Rxn<CharacterDetailModel> details = Rxn<CharacterDetailModel>();

  final Rx<RxStatus> status = Rx(RxStatus.empty());

  late final AppError _apiError;
  AppError get apiError => _apiError;

  @override
  void onInit() {
    controllerStart();
    super.onInit();
  }

  void controllerStart() async {
    status.value = RxStatus.loading();

    final result = await _repository.getDetails(_index);

    result.fold((error) {
      _apiError = error;
      status.value = RxStatus.error();
    }, (success) {
      details.value = success;
      status.value = RxStatus.success();
    });
  }
}
