import 'package:get/get.dart';

import '../domain/details.dart';
import '../domain/i_details_repository.dart';

class DetailsController extends GetxController {
  DetailsController(this._repository, this._index);

  IDetailsRepository _repository;
  int _index;

  final Rxn<DetailsModel> details = Rxn<DetailsModel>();

  final Rx<RxStatus> status = Rx(RxStatus.empty());

  late final String _apiError;
  String get apiError => _apiError;

  @override
  void onInit() {
    controllerStart();
    super.onInit();
  }

  void controllerStart() async {
    status.value = RxStatus.loading();

    final result = await _repository.getDetails(_index);

    result.fold((error) {
      _apiError = error.message!;
      status.value = RxStatus.error();
    }, (success) {
      details.value = success;
      status.value = RxStatus.success();
    });
  }
}
