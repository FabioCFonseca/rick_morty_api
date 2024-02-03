import 'package:flutter/material.dart';

import '../../../common/domain/app_error.dart';
import '../domain/character_details_model.dart';
import '../infrastructure/character_details_repository.dart';

enum CharacterDetailsProviderState { loading, success, error }

class CharacterDetailsProvider extends ChangeNotifier {
  CharacterDetailsProvider(
      {required this.selectedCharacter, required this.repository});

  //REPOSITORY INSTANCE
  CharactersDetailsRepository repository;
  int selectedCharacter;

  // MODELS FOR UI
  late CharacterDetailModel character;
  late AppError appError;

  //PROVIDER STATE
  late CharacterDetailsProviderState providerStatus;

  Future controllerStart() async {
    providerStatus = CharacterDetailsProviderState.loading;
    final result = await repository.getCharactersDetails(selectedCharacter);

    result.fold(
      (error) {
        appError = error;
        providerStatus = CharacterDetailsProviderState.error;
      },
      (success) {
        character = success;
        providerStatus = CharacterDetailsProviderState.success;
      },
    );
    notifyListeners();
  }
}
