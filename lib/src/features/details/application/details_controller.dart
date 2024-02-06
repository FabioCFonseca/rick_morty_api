import 'package:mobx/mobx.dart';

import '../domain/details.dart';
import '../domain/i_details_repository.dart';

part 'details_controller.g.dart';

enum DetailsFetchState { loading, success, error }

class DetailsController = _DetailsControllerBase with _$DetailsController;

abstract class _DetailsControllerBase with Store {
  _DetailsControllerBase({required this.repository, required this.index}){
    controllerStart();
  }

  final IDetailsRepository repository;
  final int index;

  @observable
  DetailsModel? details;

  @observable
  DetailsFetchState status = DetailsFetchState.loading;

  @observable
  late String _apiError;
  String get apiError => _apiError;

  @action
  Future<void> controllerStart() async {
    status = DetailsFetchState.loading;

    final result = await repository.getDetails(index);

    result.fold((error) {
      _apiError = error.toString();
      status = DetailsFetchState.error;
    }, (success) {
      details = success;
      status = DetailsFetchState.success;
    });
  }
}
